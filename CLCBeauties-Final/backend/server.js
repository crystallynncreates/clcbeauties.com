/**
 * ============================================================
 *  CLC Beauties — Backend Server
 *  Crystal Lynn Creates · CLCBeauties.com
 * ============================================================
 *  Handles:
 *    • Stripe payment intents (secure card charging)
 *    • CJ Dropshipping product fetching & order placement
 *    • CORS for your frontend HTML file
 * ============================================================
 */

require('dotenv').config();
const express    = require('express');
const cors       = require('cors');
const stripe     = require('stripe')(process.env.STRIPE_SECRET_KEY);
const fetch      = (...args) => import('node-fetch').then(({default: f}) => f(...args));

const app  = express();
const PORT = process.env.PORT || 3000;

// ── Middleware ───────────────────────────────────────────────
app.use(cors({ origin: '*' })); // Restrict to your domain in production
app.use(express.json());
app.use(express.static('public')); // Serves your clcbeauties.html if placed in /public

// ── CJ Dropshipping helpers ──────────────────────────────────
const CJ_BASE    = 'https://developers.cjdropshipping.com/api2.0/v1';
const CJ_KEY     = process.env.CJ_API_KEY;
const MARKUP     = 1.05; // 5% markup

async function cjGet(path, params = {}) {
  const url = new URL(`${CJ_BASE}${path}`);
  Object.entries(params).forEach(([k, v]) => url.searchParams.set(k, v));
  const res = await fetch(url.toString(), {
    headers: { 'CJ-Access-Token': CJ_KEY, 'Content-Type': 'application/json' }
  });
  return res.json();
}

async function cjPost(path, body = {}) {
  const res = await fetch(`${CJ_BASE}${path}`, {
    method: 'POST',
    headers: { 'CJ-Access-Token': CJ_KEY, 'Content-Type': 'application/json' },
    body: JSON.stringify(body)
  });
  return res.json();
}

function applyMarkup(price) {
  return parseFloat((parseFloat(price || 0) * MARKUP).toFixed(2));
}

function mapProduct(item) {
  return {
    id:        item.pid,
    name:      item.productNameEn,
    category:  detectCategory(item.productNameEn),
    price:     applyMarkup(item.sellPrice || item.productPrice || 9.99),
    inventory: item.inventory ?? 99,
    img:       item.productImage || item.productMainImage || '',
    badge:     item.isNew ? 'NEW' : item.isSale ? 'SALE' : '',
    cjPid:     item.pid,
    variantId: item.vid || item.variantId || '',
  };
}

function detectCategory(name = '') {
  const n = name.toLowerCase();
  if (n.includes('bundle'))                          return 'bundles';
  if (n.includes('wig') || n.includes('lace front')) return 'wigs';
  if (n.includes('nail'))                            return 'nails';
  if (n.includes('lash'))                            return 'lashes';
  return 'accessories';
}

// ════════════════════════════════════════════════════════════
//  ROUTES
// ════════════════════════════════════════════════════════════

// ── Health check ─────────────────────────────────────────────
app.get('/health', (req, res) => {
  res.json({ status: 'ok', store: 'CLCBeauties.com', timestamp: new Date().toISOString() });
});

// ── GET /api/products ─────────────────────────────────────────
// Fetches products from CJ by keyword, applies 5% markup
// Query params: keyword, page, pageSize
app.get('/api/products', async (req, res) => {
  try {
    const { keyword = 'wig', page = 1, pageSize = 20 } = req.query;
    const data = await cjGet('/product/list', {
      pageNum:       page,
      pageSize:      Math.min(pageSize, 50),
      productNameEn: keyword,
    });

    if (data.code !== 200) {
      return res.status(502).json({ error: 'CJ API error', detail: data.message });
    }

    const products = (data.data?.list || []).map(mapProduct);
    res.json({ success: true, total: data.data?.total || 0, products });
  } catch (err) {
    console.error('GET /api/products error:', err);
    res.status(500).json({ error: 'Failed to fetch products', detail: err.message });
  }
});

// ── GET /api/products/all ─────────────────────────────────────
// Fetches all store categories at once (used on page load)
app.get('/api/products/all', async (req, res) => {
  try {
    const keywords = [
      'lace front wig', 'human hair wig', 'body wave wig',
      'human hair bundles', 'brazilian hair',
      'press on nails', 'false nails', 'nail accessories',
      'false lashes', 'mink lashes', 'lash accessories',
      'wig accessories',
    ];

    const results = await Promise.allSettled(
      keywords.map(kw => cjGet('/product/list', { pageNum: 1, pageSize: 30, productNameEn: kw }))
    );

    const seen = new Set();
    const products = [];

    results.forEach(r => {
      if (r.status === 'fulfilled' && r.value.code === 200) {
        (r.value.data?.list || []).forEach(item => {
          if (!seen.has(item.pid)) {
            seen.add(item.pid);
            products.push(mapProduct(item));
          }
        });
      }
    });

    res.json({ success: true, total: products.length, products });
  } catch (err) {
    console.error('GET /api/products/all error:', err);
    res.status(500).json({ error: 'Failed to fetch products', detail: err.message });
  }
});

// ── GET /api/products/:id ─────────────────────────────────────
// Single product detail + variants
app.get('/api/products/:id', async (req, res) => {
  try {
    const data = await cjGet('/product/query', { pid: req.params.id });
    if (data.code !== 200) {
      return res.status(404).json({ error: 'Product not found' });
    }
    res.json({ success: true, product: mapProduct(data.data) });
  } catch (err) {
    console.error('GET /api/products/:id error:', err);
    res.status(500).json({ error: err.message });
  }
});

// ── POST /api/create-payment-intent ──────────────────────────
// Creates a Stripe PaymentIntent for the cart total
// Body: { items: [{ id, name, price, qty }] }
app.post('/api/create-payment-intent', async (req, res) => {
  try {
    const { items, customerEmail } = req.body;

    if (!items || !Array.isArray(items) || items.length === 0) {
      return res.status(400).json({ error: 'Cart is empty' });
    }

    // Calculate total in cents (Stripe uses smallest currency unit)
    const totalCents = Math.round(
      items.reduce((sum, item) => sum + item.price * item.qty, 0) * 100
    );

    if (totalCents < 50) {
      return res.status(400).json({ error: 'Order total too low (minimum $0.50)' });
    }

    const paymentIntent = await stripe.paymentIntents.create({
      amount:   totalCents,
      currency: 'usd',
      receipt_email: customerEmail || undefined,
      metadata: {
        store:    'CLCBeauties.com',
        items:    JSON.stringify(items.map(i => ({ id: i.id, name: i.name.substring(0,40), qty: i.qty }))),
      },
      automatic_payment_methods: { enabled: true },
    });

    res.json({
      success:      true,
      clientSecret: paymentIntent.client_secret,
      amount:       totalCents,
    });
  } catch (err) {
    console.error('POST /api/create-payment-intent error:', err);
    res.status(500).json({ error: err.message });
  }
});

// ── POST /api/orders ─────────────────────────────────────────
// Places order on CJ Dropshipping after payment succeeds
// Body: { paymentIntentId, customer: {...}, items: [...] }
app.post('/api/orders', async (req, res) => {
  try {
    const { paymentIntentId, customer, items } = req.body;

    // 1. Verify payment succeeded with Stripe
    const intent = await stripe.paymentIntents.retrieve(paymentIntentId);
    if (intent.status !== 'succeeded') {
      return res.status(402).json({ error: 'Payment not confirmed yet', status: intent.status });
    }

    // 2. Build CJ order payload
    const cjOrder = {
      orderNumber:   `CLC-${Date.now()}`,
      shippingZip:   customer.zip,
      shippingCountryCode: 'US',
      shippingCountry:     'United States',
      shippingProvince:    customer.state,
      shippingCity:        customer.city,
      shippingAddress:     customer.address,
      shippingAddress2:    '',
      shippingCustomerName: `${customer.firstName} ${customer.lastName}`,
      shippingPhone:       customer.phone || '0000000000',
      remark:              'CLCBeauties.com Order',
      products: items.map(item => ({
        vid:      item.variantId || item.cjPid,
        quantity: item.qty,
      })),
    };

    // 3. Place order on CJ
    const cjResult = await cjPost('/order/create', cjOrder);

    if (cjResult.code !== 200) {
      console.error('CJ order failed:', cjResult);
      return res.status(502).json({
        error:   'Order placed with payment but CJ fulfillment failed',
        detail:  cjResult.message,
        cjCode:  cjResult.code,
      });
    }

    res.json({
      success:     true,
      orderId:     cjResult.data?.orderId,
      orderNumber: cjOrder.orderNumber,
      message:     'Order placed successfully! You will receive a confirmation email.',
    });
  } catch (err) {
    console.error('POST /api/orders error:', err);
    res.status(500).json({ error: err.message });
  }
});

// ── POST /api/webhook ─────────────────────────────────────────
// Stripe webhook — listens for payment confirmations
// Set this URL in your Stripe Dashboard → Webhooks
app.post('/api/webhook', express.raw({ type: 'application/json' }), async (req, res) => {
  const sig     = req.headers['stripe-signature'];
  const secret  = process.env.STRIPE_WEBHOOK_SECRET;

  let event;
  try {
    event = stripe.webhooks.constructEvent(req.body, sig, secret);
  } catch (err) {
    console.error('Webhook signature failed:', err.message);
    return res.status(400).send(`Webhook Error: ${err.message}`);
  }

  if (event.type === 'payment_intent.succeeded') {
    const intent = event.data.object;
    console.log(`✅ Payment succeeded: ${intent.id} — $${(intent.amount / 100).toFixed(2)}`);
    // Auto-fulfillment logic can go here if desired
  }

  if (event.type === 'payment_intent.payment_failed') {
    const intent = event.data.object;
    console.log(`❌ Payment failed: ${intent.id}`);
  }

  res.json({ received: true });
});

// ── GET /api/track/:orderId ───────────────────────────────────
// Track a CJ order by orderId
app.get('/api/track/:orderId', async (req, res) => {
  try {
    const data = await cjGet('/order/getOrderDetail', { orderId: req.params.orderId });
    if (data.code !== 200) {
      return res.status(404).json({ error: 'Order not found' });
    }
    res.json({ success: true, order: data.data });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// ── Start server ──────────────────────────────────────────────
app.listen(PORT, () => {
  console.log(`
  ╔══════════════════════════════════════════╗
  ║   💄 CLC Beauties Server Running         ║
  ║   Crystal Lynn Creates · CLCBeauties.com ║
  ╠══════════════════════════════════════════╣
  ║   http://localhost:${PORT}                  ║
  ╠══════════════════════════════════════════╣
  ║   Endpoints:                             ║
  ║   GET  /api/products/all                 ║
  ║   GET  /api/products?keyword=wig         ║
  ║   POST /api/create-payment-intent        ║
  ║   POST /api/orders                       ║
  ║   GET  /api/track/:orderId               ║
  ╚══════════════════════════════════════════╝
  `);
});

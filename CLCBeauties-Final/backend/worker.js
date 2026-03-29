/**
 * ============================================================
 *  CLC Beauties — Cloudflare Worker Backend
 *  Crystal Lynn Creates · www.CLCBeauties.com
 * ============================================================
 *  After deploying this Worker, add these secret variables
 *  in Cloudflare Dashboard → Worker → Settings → Variables:
 *
 *    CJ_API_KEY          → CJ5263067@api@b70e8a82dd064c8bb0662225b9bc87aa
 *    STRIPE_SECRET_KEY   → pk_test_51TEKZDEoS3UsWWc897i3PL7c5xZJ2X3oeicp3hjePvSAlYDmgx2gyUsn6fOTSUXHrJs09YZk9fi0mohYzvO5v4Sr00y9df7err
 * ============================================================
 */

const CORS_HEADERS = {
  'Access-Control-Allow-Origin':  '*',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
};

const CJ_BASE = 'https://developers.cjdropshipping.com/api2.0/v1';
const MARKUP  = 1.05;

function json(data, status = 200) {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json', ...CORS_HEADERS },
  });
}

function applyMarkup(price) {
  return parseFloat((parseFloat(price || 0) * MARKUP).toFixed(2));
}

function detectCategory(name = '') {
  const n = name.toLowerCase();
  if (n.includes('bundle') || n.includes('weave')) return 'bundles';
  if (n.includes('wig') || n.includes('lace front') || n.includes('closure')) return 'wigs';
  if (n.includes('nail')) return 'nails';
  if (n.includes('lash')) return 'lashes';
  return 'accessories';
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

async function cjGet(path, params, apiKey) {
  const url = new URL(`${CJ_BASE}${path}`);
  Object.entries(params).forEach(([k, v]) => url.searchParams.set(k, v));
  const res = await fetch(url.toString(), {
    headers: { 'CJ-Access-Token': apiKey, 'Content-Type': 'application/json' },
  });
  return res.json();
}

async function cjPost(path, body, apiKey) {
  const res = await fetch(`${CJ_BASE}${path}`, {
    method:  'POST',
    headers: { 'CJ-Access-Token': apiKey, 'Content-Type': 'application/json' },
    body:    JSON.stringify(body),
  });
  return res.json();
}

async function stripePost(path, data, secretKey) {
  const res = await fetch(`https://api.stripe.com/v1${path}`, {
    method:  'POST',
    headers: {
      'Authorization': `Bearer ${secretKey}`,
      'Content-Type':  'application/x-www-form-urlencoded',
    },
    body: new URLSearchParams(data).toString(),
  });
  return res.json();
}

async function stripeGet(path, secretKey) {
  const res = await fetch(`https://api.stripe.com/v1${path}`, {
    headers: { 'Authorization': `Bearer ${secretKey}` },
  });
  return res.json();
}

export default {
  async fetch(request, env) {
    const url    = new URL(request.url);
    const path   = url.pathname;
    const method = request.method;

    if (method === 'OPTIONS') {
      return new Response(null, { headers: CORS_HEADERS });
    }

    const CJ_KEY = env.CJ_API_KEY;
    const SK     = env.STRIPE_SECRET_KEY;

    // GET /health
    if (path === '/health' && method === 'GET') {
      return json({ status: 'ok', store: 'www.CLCBeauties.com', worker: true });
    }

    // GET /api/products
    if (path === '/api/products' && method === 'GET') {
      const keyword  = url.searchParams.get('keyword') || 'wig';
      const pageSize = Math.min(parseInt(url.searchParams.get('pageSize') || '30'), 50);
      const pageNum  = url.searchParams.get('page') || '1';
      try {
        const data = await cjGet('/product/list', { pageNum, pageSize, productNameEn: keyword }, CJ_KEY);
        if (data.code !== 200) return json({ error: 'CJ API error', detail: data.message }, 502);
        return json({ success: true, total: data.data?.total || 0, products: (data.data?.list || []).map(mapProduct) });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // GET /api/products/all
    if (path === '/api/products/all' && method === 'GET') {
      const keywords = [
        'kinky curly lace front wig', 'afro curly human hair wig',
        'deep wave lace wig', 'water wave human hair wig',
        'kinky curly human hair bundles', 'deep wave hair bundles',
        'water wave hair bundles', 'body wave brazilian bundles',
        'press on nails coffin', 'false nails almond',
        'nail art accessories', 'mink false lashes',
        '3D mink lashes', 'wispy false lashes', 'lash glue',
      ];
      try {
        const results = await Promise.allSettled(
          keywords.map(kw => cjGet('/product/list', { pageNum: 1, pageSize: 30, productNameEn: kw }, CJ_KEY))
        );
        const seen = new Set();
        const products = [];
        results.forEach(r => {
          if (r.status === 'fulfilled' && r.value.code === 200) {
            (r.value.data?.list || []).forEach(item => {
              if (!seen.has(item.pid)) { seen.add(item.pid); products.push(mapProduct(item)); }
            });
          }
        });
        return json({ success: true, total: products.length, products });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // POST /api/create-payment-intent
    if (path === '/api/create-payment-intent' && method === 'POST') {
      try {
        const { items, customerEmail } = await request.json();
        if (!items?.length) return json({ error: 'Cart is empty' }, 400);
        const totalCents = Math.round(items.reduce((s, i) => s + i.price * i.qty, 0) * 100);
        if (totalCents < 50) return json({ error: 'Minimum order $0.50' }, 400);
        const params = {
          amount: totalCents, currency: 'usd',
          'automatic_payment_methods[enabled]': 'true',
          'metadata[store]': 'www.CLCBeauties.com',
        };
        if (customerEmail) params.receipt_email = customerEmail;
        const intent = await stripePost('/payment_intents', params, SK);
        if (intent.error) return json({ error: intent.error.message }, 400);
        return json({ success: true, clientSecret: intent.client_secret, amount: totalCents });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // POST /api/orders
    if (path === '/api/orders' && method === 'POST') {
      try {
        const { paymentIntentId, customer, items } = await request.json();
        const intent = await stripeGet(`/payment_intents/${paymentIntentId}`, SK);
        if (intent.status !== 'succeeded') return json({ error: 'Payment not confirmed', status: intent.status }, 402);
        const cjOrder = {
          orderNumber: `CLC-${Date.now()}`,
          shippingZip: customer.zip,
          shippingCountryCode: 'US',
          shippingCountry: 'United States',
          shippingProvince: customer.state,
          shippingCity: customer.city,
          shippingAddress: customer.address,
          shippingAddress2: '',
          shippingCustomerName: `${customer.firstName} ${customer.lastName}`,
          shippingPhone: customer.phone || '0000000000',
          remark: 'www.CLCBeauties.com Order',
          products: items.map(item => ({ vid: item.variantId || item.cjPid, quantity: item.qty })),
        };
        const cjResult = await cjPost('/order/create', cjOrder, CJ_KEY);
        if (cjResult.code !== 200) return json({ error: 'CJ fulfillment failed', detail: cjResult.message }, 502);
        return json({ success: true, orderId: cjResult.data?.orderId, orderNumber: cjOrder.orderNumber });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // GET /api/track/:orderId
    if (path.startsWith('/api/track/') && method === 'GET') {
      const orderId = path.split('/api/track/')[1];
      try {
        const data = await cjGet('/order/getOrderDetail', { orderId }, CJ_KEY);
        if (data.code !== 200) return json({ error: 'Order not found' }, 404);
        return json({ success: true, order: data.data });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    return json({ error: 'Not found' }, 404);
  },
};

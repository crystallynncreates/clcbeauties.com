/**
 * CLC Beauties — Cloudflare Worker v5.0
 * www.CLCBeauties.com · Crystal Lynn Creates
 * Products: Supabase  |  Payments: Stripe
 *
 * Worker secrets (set in Cloudflare Dashboard → Worker → Settings → Variables):
 *   STRIPE_SECRET_KEY    — sk_live_... or sk_test_...
 *   SUPABASE_SERVICE_KEY — service_role key from Supabase Dashboard → Project Settings → API
 *
 * Worker vars (non-secret, set in wrangler.toml):
 *   SUPABASE_URL         — https://gfhnwydldnvtvquagzav.supabase.co
 */

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
};

async function stripePost(path, data, sk) {
  const res = await fetch(`https://api.stripe.com/v1${path}`, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${sk}`,
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: new URLSearchParams(data).toString(),
  });
  return res.json();
}

async function stripeGet(path, sk) {
  const res = await fetch(`https://api.stripe.com/v1${path}`, {
    headers: { Authorization: `Bearer ${sk}` },
  });
  return res.json();
}

async function sbInsert(supaUrl, svcKey, table, data) {
  const res = await fetch(`${supaUrl}/rest/v1/${table}`, {
    method: 'POST',
    headers: {
      apikey: svcKey,
      Authorization: `Bearer ${svcKey}`,
      'Content-Type': 'application/json',
      Prefer: 'return=minimal',
    },
    body: JSON.stringify(data),
  });
  if (!res.ok) {
    const body = await res.text();
    throw new Error(`Supabase error ${res.status}: ${body}`);
  }
}

async function sbSelectOne(supaUrl, svcKey, table, filter, select = '*') {
  const res = await fetch(
    `${supaUrl}/rest/v1/${table}?${filter}&select=${select}&limit=1`,
    { headers: { apikey: svcKey, Authorization: `Bearer ${svcKey}` } }
  );
  const rows = await res.json();
  return Array.isArray(rows) ? rows[0] || null : null;
}

async function sbSelect(supaUrl, svcKey, table, filter = '', select = '*') {
  const qs = filter ? `${filter}&select=${select}` : `select=${select}`;
  const res = await fetch(
    `${supaUrl}/rest/v1/${table}?${qs}`,
    { headers: { apikey: svcKey, Authorization: `Bearer ${svcKey}` } }
  );
  if (!res.ok) {
    const body = await res.text();
    throw new Error(`Supabase error ${res.status}: ${body}`);
  }
  const rows = await res.json();
  return Array.isArray(rows) ? rows : [];
}

function mapProduct(p) {
  return { ...p, img: p.image_url };
}

export default {
  async fetch(req, env) {
    const url = new URL(req.url);
    const { pathname: path, } = url;
    const method = req.method;

    if (method === 'OPTIONS') return new Response(null, { headers: CORS });

    const SK        = env.STRIPE_SECRET_KEY;
    const SUPA_URL  = env.SUPABASE_URL  || 'https://gfhnwydldnvtvquagzav.supabase.co';
    const SUPA_SVC  = env.SUPABASE_SERVICE_KEY;
    // Public anon key — safe to embed, used only for reading the public product catalog
    const SUPA_ANON = env.SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdmaG53eWRsZG52dHZxdWFnemF2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzM5ODA1MDIsImV4cCI6MjA4OTU1NjUwMn0.QG-jncISo8dOnj00OnUs9GrlI91YnizsNOBRm2kqa5g';

    const json = (d, s = 200) =>
      new Response(JSON.stringify(d), {
        status: s,
        headers: { 'Content-Type': 'application/json', ...CORS },
      });

    // ── Health ───────────────────────────────────────────────────────────────
    if (path === '/health') {
      return json({
        status: 'ok',
        store: 'www.CLCBeauties.com',
        stripe: !!SK,
        supabase: !!SUPA_URL,
        anonKey: !!SUPA_ANON,
        version: '5.1',
      });
    }

    // ── Create Stripe payment intent ──────────────────────────────────────────
    if (path === '/api/create-payment-intent' && method === 'POST') {
      try {
        const { items, customerEmail } = await req.json();
        if (!items?.length) return json({ error: 'Cart is empty' }, 400);

        const cents = Math.round(
          items.reduce((s, i) => s + i.price * i.qty, 0) * 100
        );
        if (cents < 50) return json({ error: 'Minimum order $0.50' }, 400);

        const params = {
          amount: cents,
          currency: 'usd',
          'automatic_payment_methods[enabled]': 'true',
          'metadata[store]': 'www.CLCBeauties.com',
        };
        if (customerEmail) params.receipt_email = customerEmail;

        const intent = await stripePost('/payment_intents', params, SK);
        if (intent.error) return json({ error: intent.error.message }, 400);

        return json({ success: true, clientSecret: intent.client_secret, amount: cents });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // ── Confirm order after Stripe payment ────────────────────────────────────
    if (path === '/api/orders' && method === 'POST') {
      try {
        const { paymentIntentId, customer, items } = await req.json();

        const intent = await stripeGet(`/payment_intents/${paymentIntentId}`, SK);
        if (intent.status !== 'succeeded') {
          return json({ error: 'Payment not confirmed' }, 402);
        }

        const orderNumber = `CLC-${Date.now()}`;
        const subtotal    = parseFloat(
          items.reduce((s, i) => s + i.price * i.qty, 0).toFixed(2)
        );

        // Save to Supabase (non-blocking — payment already confirmed)
        try {
          await sbInsert(SUPA_URL, SUPA_SVC, 'orders', {
            order_number:      orderNumber,
            stripe_payment_intent: paymentIntentId,
            customer_email:    customer.email,
            customer_name:     `${customer.firstName} ${customer.lastName}`,
            customer_phone:    customer.phone || '',
            shipping_address:  customer.address,
            shipping_city:     customer.city,
            shipping_state:    customer.state,
            shipping_zip:      customer.zip,
            items,
            subtotal,
            status:            'paid',
          });
        } catch (saveErr) {
          console.error('Order save failed (payment still confirmed):', saveErr.message);
        }

        return json({ success: true, orderNumber, subtotal });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // ── Products: slider ─────────────────────────────────────────────────────
    if (path === '/api/products/slider' && method === 'GET') {
      try {
        const rows = await sbSelect(SUPA_URL, SUPA_ANON, 'products', 'is_slider=eq.true&limit=8', '*');
        return json({ products: rows.map(mapProduct) });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // ── Products: by category ─────────────────────────────────────────────────
    if (path.startsWith('/api/products/category/') && method === 'GET') {
      const cat = decodeURIComponent(path.split('/api/products/category/')[1] || '');
      try {
        const rows = await sbSelect(SUPA_URL, SUPA_ANON, 'products', `category=eq.${encodeURIComponent(cat)}`, '*');
        return json({ products: rows.map(mapProduct) });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // ── Products: all ─────────────────────────────────────────────────────────
    if (path === '/api/products/all' && method === 'GET') {
      try {
        const rows = await sbSelect(SUPA_URL, SUPA_ANON, 'products', '', '*');
        return json({ products: rows.map(mapProduct) });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    // ── Track order ───────────────────────────────────────────────────────────
    if (path.startsWith('/api/track/')) {
      const orderNum = path.split('/api/track/')[1];
      try {
        const order = await sbSelectOne(
          SUPA_URL, SUPA_SVC, 'orders',
          `order_number=eq.${encodeURIComponent(orderNum)}`,
          'order_number,status,created_at,shipping_city,shipping_state'
        );
        if (!order) return json({ error: 'Order not found' }, 404);
        return json({ success: true, order });
      } catch (e) {
        return json({ error: e.message }, 500);
      }
    }

    return json({ error: 'Not found' }, 404);
  },
};

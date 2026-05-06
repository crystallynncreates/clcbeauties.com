/**
 * CLC Beauties — Cloudflare Worker v4.0 FINAL
 * www.CLCBeauties.com · Crystal Lynn Creates
 * Target: Black women, 4C hair, kinky hair, Afro-American hair
 * 370+ products · 15% markup · Mobile friendly
 */

const CORS = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
  'Access-Control-Allow-Headers': 'Content-Type',
};
const CJ_BASE     = 'https://developers.cjdropshipping.com/api2.0/v1';
const MARKUP      = 1.15;
const OWNER_EMAIL = 'crystalynncreatess@gmail.com';

// Price ranges AFTER 15% markup applied
const PRICE_AFTER = {
  wigs:        { min: 35,  max: 350 },
  bundles:     { min: 25,  max: 350 },
  lashes:      { min: 2,   max: 80  },
  nails:       { min: 2,   max: 60  },
  accessories: { min: 1,   max: 100 },
};

// 15 targeted searches per category = 370+ total products
const SEARCHES = {
  wigs: [
    '4c kinky curly lace front wig',
    'kinky coily lace wig human hair',
    'afro kinky curly human hair wig',
    'deep wave lace front wig black women',
    'water wave human hair lace wig',
    'body wave lace wig natural black',
    'tight curly afro lace wig',
    'glueless lace wig kinky curly',
    'HD lace wig kinky curly human hair',
    'loose deep wave lace front wig',
    'short bob lace front wig human hair',
    'headband wig kinky curly human hair',
    'straight lace front wig human hair',
    'v part wig human hair curly',
    'coily afro human hair lace wig',
  ],
  bundles: [
    '4c kinky curly human hair bundles',
    'kinky coily human hair weave bundles',
    'afro kinky bulk human hair braiding',
    'deep wave human hair bundles black women',
    'water wave Brazilian hair bundles',
    'body wave human hair bundles weave',
    'tight curly human hair weft bundles',
    'natural afro kinky hair bundles',
    'loose deep wave hair bundles weft',
    'straight human hair bundles weave',
    'Peruvian kinky curly hair bundles',
    'Malaysian deep wave hair bundles',
    'raw Indian kinky curly hair bundles',
    'kinky straight human hair bundles',
    'natural wave human hair bundles weft',
  ],
  lashes: [
    '3D mink false eyelashes dramatic volume',
    'mink lashes wispy natural look',
    'false eyelashes fluffy faux mink',
    'cluster lash extensions DIY kit',
    'individual lash fans professional',
    'wispy dramatic false eyelashes set',
    'magnetic eyelashes natural mink',
    'human hair false lashes natural',
    'mega volume mink lashes set',
    'cat eye false eyelashes mink',
    'natural wispies false lashes',
    'reusable mink false eyelashes',
    'lash extension kit professional set',
    'demi wispies false eyelashes',
    'handmade mink lashes dramatic',
  ],
  nails: [
    'press on nails coffin long set',
    'false nails almond stiletto acrylic',
    'rhinestone press on nails coffin',
    'ombre glitter press on nails set',
    'gel press on nails long coffin',
    'black press on nails coffin set',
    'pink ombre press on nails almond',
    'french tip press on nails set',
    'acrylic nail tips full cover set',
    'nail art press on decoration set',
    'marble press on nails coffin',
    'holographic glitter press on nails',
    'butterfly nail art press on set',
    'matte black press on nails stiletto',
    'short square press on nails set',
  ],
  accessories: [
    'wig cap hairnet adjustable',
    'lace wig glue adhesive waterproof',
    'wig grip band non slip headband',
    'lash glue eyelash adhesive waterproof',
    'lash applicator tweezers tool kit',
    'nail glue false nail adhesive set',
    'nail art rhinestone decoration kit',
    'nail file buffer manicure set',
    'wig stand mannequin head holder',
    'lace wig install melting spray kit',
    'wig tape adhesive double sided',
    'nail art brush decoration tool',
    'lash sealer coating mascara',
    'wig comb pin tail styling',
    'satin bonnet wig sleep cap',
  ],
};

// Block non-beauty products
const BLOCKED = [
  'pet','dog','cat','hamster','rabbit','fish tank','aquarium',
  'shampoo','body wash','soap bar','detergent','cleaning spray','disinfect',
  'phone case','phone holder','laptop','usb hub','usb cable','data cable',
  'charger','power bank','bluetooth speaker','electronic','computer','keyboard','mouse pad',
  'kitchen','cooking','baking','food','snack','candy','beverage','drink',
  'plant pot','garden hose','seed','fertilizer','insect',
  'toy','board game','puzzle','video game','baby bottle','diaper','infant',
  'shoe','sneaker','boot','sandal','sock','underwear','bra','lingerie',
  'shirt','t-shirt','blouse','pants','trousers','jeans','jacket','coat','dress','sweater',
  'tablet stand','smartwatch','headphone','earphone','earbuds',
  'camera','printer','scanner','projector',
  'vitamin','supplement','medicine','pill','capsule','protein powder',
  'fishing','hunting','camping','bicycle','car seat','tire','motor','vehicle',
  'wallet','backpack','luggage','suitcase','briefcase',
  'exercise band','yoga mat','dumbbell',
];

// Required keywords per category
const REQUIRED = {
  wigs:        ['wig','lace front','closure','frontal','hairpiece'],
  bundles:     ['bundle','weave','weft','braiding hair','hair extension','hair bulk'],
  lashes:      ['lash','eyelash'],
  nails:       ['nail','press on','acrylic nail','manicure','nail tip'],
  accessories: ['wig cap','wig glue','lace glue','wig grip','wig stand','wig tape','wig comb','bonnet',
                'lash glue','lash applicator','lash sealer',
                'nail glue','nail art','rhinestone','nail file','nail brush'],
};

function detectCat(name = '') {
  const n = name.toLowerCase();
  if (n.includes('bundle') || n.includes('weave') || n.includes('weft') || (n.includes('braiding') && n.includes('hair'))) return 'bundles';
  if (n.includes('wig') || n.includes('lace front') || n.includes('closure wig') || n.includes('frontal wig')) return 'wigs';
  if (n.includes('lash') || n.includes('eyelash')) return 'lashes';
  if ((n.includes('nail') && !n.includes('nail glue') && !n.includes('nail art brush') && !n.includes('nail file')) || n.includes('press on') || n.includes('acrylic nail')) return 'nails';
  if (n.includes('wig cap') || n.includes('wig glue') || n.includes('lace glue') || n.includes('wig grip') ||
      n.includes('wig stand') || n.includes('wig tape') || n.includes('wig comb') || n.includes('bonnet') ||
      n.includes('lash glue') || n.includes('lash applicator') || n.includes('lash sealer') ||
      n.includes('nail glue') || n.includes('nail art') || n.includes('rhinestone') || n.includes('nail file') || n.includes('nail brush')) return 'accessories';
  return null;
}

function isBeautyOnly(name = '', cat) {
  const n = name.toLowerCase();
  if (BLOCKED.some(w => n.includes(w))) return false;
  const req = REQUIRED[cat] || [];
  return req.length === 0 || req.some(w => n.includes(w));
}

function mkPrice(raw) { return parseFloat((parseFloat(raw||0) * MARKUP).toFixed(2)); }

function inRange(price, cat) {
  const r = PRICE_AFTER[cat];
  return !r || (price >= r.min && price <= r.max);
}

function goodImg(url = '') {
  if (!url || url.length < 15) return false;
  const u = url.toLowerCase();
  return !['phone','laptop','box','icon','logo','default','placeholder','blank','no-image'].some(w => u.includes(w));
}

function toProduct(item, cat) {
  const name = item.productNameEn || item.productName || '';
  if (!name) return null;
  const detCat = cat || detectCat(name);
  if (!detCat) return null;
  const raw = parseFloat(item.sellPrice || item.productPrice || 0);
  if (raw <= 0) return null;
  const price = mkPrice(raw);
  if (!inRange(price, detCat)) return null;
  if (!isBeautyOnly(name, detCat)) return null;
  const img = item.productImage || item.productMainImage || '';
  if (!goodImg(img)) return null;
  return {
    id: item.pid, name, category: detCat,
    price, cjCost: parseFloat(raw.toFixed(2)),
    profit: parseFloat((price - raw).toFixed(2)),
    inventory: parseInt(item.inventory ?? 50),
    img, badge: item.isNew ? 'NEW' : item.isSale ? 'SALE' : '',
    variantId: item.vid || item.variantId || '', cjPid: item.pid,
  };
}

// CJ Auth
let _tok = '', _exp = 0;
async function getToken(key) {
  if (_tok && Date.now() < _exp - 3_600_000) return _tok;
  const r = await fetch(`${CJ_BASE}/authentication/getAccessToken`, {
    method: 'POST', headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ apiKey: key }),
  });
  const d = await r.json();
  if (d.code !== 200 || !d.data?.accessToken) throw new Error('CJ auth: ' + d.message);
  _tok = d.data.accessToken;
  _exp = new Date(d.data.accessTokenExpiryDate).getTime();
  return _tok;
}

async function cjGet(path, params, tok) {
  const u = new URL(`${CJ_BASE}${path}`);
  Object.entries(params).forEach(([k,v]) => u.searchParams.set(k, String(v)));
  return (await fetch(u.toString(), { headers: { 'CJ-Access-Token': tok } })).json();
}

async function cjPost(path, body, tok) {
  return (await fetch(`${CJ_BASE}${path}`, {
    method: 'POST', headers: { 'CJ-Access-Token': tok, 'Content-Type': 'application/json' },
    body: JSON.stringify(body),
  })).json();
}

// Fetch category sequentially — 15 searches × up to 50 each = up to 750 raw, filtered to max
async function fetchCat(cat, tok, max = 80) {
  const seen = new Set(), products = [];
  for (const kw of (SEARCHES[cat] || [])) {
    if (products.length >= max) break;
    try {
      const d = await cjGet('/product/list', { pageNum: 1, pageSize: 50, productNameEn: kw }, tok);
      if (d.code !== 200) continue;
      for (const item of (d.data?.list || [])) {
        if (seen.has(item.pid)) continue;
        seen.add(item.pid);
        const p = toProduct(item, cat);
        if (p) { products.push(p); if (products.length >= max) break; }
      }
    } catch(_) { continue; }
  }
  return products;
}

// Stripe
async function stripePost(path, data, sk) {
  return (await fetch(`https://api.stripe.com/v1${path}`, {
    method: 'POST', headers: { 'Authorization': `Bearer ${sk}`, 'Content-Type': 'application/x-www-form-urlencoded' },
    body: new URLSearchParams(data).toString(),
  })).json();
}
async function stripeGet(path, sk) {
  return (await fetch(`https://api.stripe.com/v1${path}`, { headers: { 'Authorization': `Bearer ${sk}` } })).json();
}

async function profitEmail(num, bd) {
  const html = `<h2 style="color:#db2777">CLC Beauties — Order ${num}</h2>
<table border="1" cellpadding="6" style="border-collapse:collapse;font-size:13px">
<thead style="background:#0f0f0f;color:#fff"><tr><th>Item</th><th>Qty</th><th>CJ Cost</th><th>Charged</th><th>Profit</th></tr></thead>
<tbody>${bd.items.map(i=>`<tr><td>${i.name.substring(0,40)}</td><td>${i.qty}</td><td>$${(i.cjCost*i.qty).toFixed(2)}</td><td>$${(i.price*i.qty).toFixed(2)}</td><td style="color:#16a34a">$${(i.profit*i.qty).toFixed(2)}</td></tr>`).join('')}</tbody>
<tfoot style="font-weight:bold;background:#fdf2f8"><tr><td colspan="2">TOTALS</td><td style="color:#dc2626">$${bd.cjTotal.toFixed(2)}</td><td style="color:#1d4ed8">$${bd.charged.toFixed(2)}</td><td style="color:#16a34a">$${bd.profit.toFixed(2)} ✨</td></tr></tfoot>
</table>`;
  try {
    await fetch('https://api.mailchannels.net/tx/v1/send', {
      method: 'POST', headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ personalizations:[{to:[{email:OWNER_EMAIL}]}], from:{email:'orders@clcbeauties.com',name:'CLC Beauties'}, subject:`💰 Order ${num} — Profit $${bd.profit.toFixed(2)}`, content:[{type:'text/html',value:html}] }),
    });
  } catch(_) {}
}

export default {
  async fetch(req, env) {
    const url = new URL(req.url), path = url.pathname, method = req.method;
    if (method === 'OPTIONS') return new Response(null, { headers: CORS });
    const CJ = env.CJ_API_KEY, SK = env.STRIPE_SECRET_KEY;
    const ok = (d, s=200) => new Response(JSON.stringify(d), { status:s, headers:{'Content-Type':'application/json',...CORS} });

    // GET /health
    if (path === '/health') return ok({ status:'ok', store:'www.CLCBeauties.com', worker:true, cj:!!CJ, stripe:!!SK, markup:'15%', version:'4.0', searches_per_cat:15 });

    // GET /api/auth-test
    if (path === '/api/auth-test') {
      try { const t = await getToken(CJ); return ok({ success:true, message:'CJ connected!', preview:t.substring(0,10)+'...' }); }
      catch(e) { return ok({ success:false, error:e.message }, 401); }
    }

    // GET /api/products/slider — 8 wigs for hero carousel
    if (path === '/api/products/slider') {
      try {
        const tok = await getToken(CJ);
        const seen = new Set(), products = [];
        const sliderKws = [
          '4c kinky curly lace front wig',
          'afro kinky curly human hair wig',
          'deep wave lace wig black women',
          'body wave lace wig natural black',
          'water wave human hair wig',
          'glueless lace wig kinky curly',
          'HD lace wig kinky human hair',
          'tight curly afro lace wig',
        ];
        for (const kw of sliderKws) {
          if (products.length >= 8) break;
          try {
            const d = await cjGet('/product/list', { pageNum:1, pageSize:20, productNameEn:kw }, tok);
            if (d.code !== 200) continue;
            for (const item of (d.data?.list || [])) {
              if (seen.has(item.pid)) continue;
              seen.add(item.pid);
              const p = toProduct(item, 'wigs');
              if (p) { products.push(p); if (products.length >= 8) break; }
            }
          } catch(_) {}
        }
        return ok({ success:true, total:products.length, products });
      } catch(e) { return ok({ error:e.message, products:[] }, 500); }
    }

    // GET /api/products/category/:cat — 80 products per tab
    if (path.startsWith('/api/products/category/')) {
      const cat = path.split('/api/products/category/')[1];
      if (!SEARCHES[cat]) return ok({ error:'Unknown category', products:[] }, 400);
      try {
        const tok = await getToken(CJ);
        const products = await fetchCat(cat, tok, 80);
        return ok({ success:true, category:cat, total:products.length, products });
      } catch(e) { return ok({ error:e.message, products:[] }, 500); }
    }

    // GET /api/products/all — homepage mix (75 per cat = 375 total)
    if (path === '/api/products/all') {
      try {
        const tok = await getToken(CJ);
        const all = [];
        for (const cat of ['wigs','bundles','lashes','nails','accessories']) {
          try { all.push(...await fetchCat(cat, tok, 75)); } catch(_) {}
        }
        return ok({ success:true, total:all.length, products:all });
      } catch(e) { return ok({ error:e.message, products:[] }, 500); }
    }

    // GET /api/products?keyword= — search
    if (path === '/api/products') {
      const kw = url.searchParams.get('keyword') || 'kinky curly wig';
      const ps = Math.min(parseInt(url.searchParams.get('pageSize')||'50'), 50);
      try {
        const tok = await getToken(CJ);
        const d = await cjGet('/product/list', { pageNum:1, pageSize:ps, productNameEn:kw }, tok);
        if (d.code !== 200) return ok({ error:d.message, products:[] }, 502);
        return ok({ success:true, products:(d.data?.list||[]).map(i=>toProduct(i)).filter(Boolean) });
      } catch(e) { return ok({ error:e.message, products:[] }, 500); }
    }

    // POST /api/create-payment-intent
    if (path === '/api/create-payment-intent' && method === 'POST') {
      try {
        const { items, customerEmail } = await req.json();
        if (!items?.length) return ok({ error:'Cart empty' }, 400);
        const cents = Math.round(items.reduce((s,i)=>s+i.price*i.qty,0)*100);
        if (cents < 50) return ok({ error:'Min $0.50' }, 400);
        const params = { amount:cents, currency:'usd', 'automatic_payment_methods[enabled]':'true', 'metadata[store]':'www.CLCBeauties.com' };
        if (customerEmail) params.receipt_email = customerEmail;
        const intent = await stripePost('/payment_intents', params, SK);
        if (intent.error) return ok({ error:intent.error.message }, 400);
        return ok({ success:true, clientSecret:intent.client_secret, amount:cents });
      } catch(e) { return ok({ error:e.message }, 500); }
    }

    // POST /api/orders
    if (path === '/api/orders' && method === 'POST') {
      try {
        const { paymentIntentId, customer, items } = await req.json();
        const intent = await stripeGet(`/payment_intents/${paymentIntentId}`, SK);
        if (intent.status !== 'succeeded') return ok({ error:'Payment not confirmed' }, 402);
        const tok = await getToken(CJ);
        const num = `CLC-${Date.now()}`;
        const cjRes = await cjPost('/order/create', {
          orderNumber:num, shippingZip:customer.zip, shippingCountryCode:'US',
          shippingCountry:'United States', shippingProvince:customer.state,
          shippingCity:customer.city, shippingAddress:customer.address, shippingAddress2:'',
          shippingCustomerName:`${customer.firstName} ${customer.lastName}`,
          shippingPhone:customer.phone||'0000000000', remark:'www.CLCBeauties.com',
          products:items.map(i=>({vid:i.variantId||i.cjPid,quantity:i.qty})),
        }, tok);
        if (cjRes.code !== 200) return ok({ error:'CJ order failed', detail:cjRes.message }, 502);
        const cjTotal = items.reduce((s,i)=>s+i.cjCost*i.qty,0);
        const charged = items.reduce((s,i)=>s+i.price*i.qty,0);
        const bd = { items:items.map(i=>({name:i.name,qty:i.qty,cjCost:i.cjCost,price:i.price,profit:i.price-i.cjCost})), cjTotal:parseFloat(cjTotal.toFixed(2)), charged:parseFloat(charged.toFixed(2)), profit:parseFloat((charged-cjTotal).toFixed(2)) };
        if (env.waitUntil) env.waitUntil(profitEmail(num, bd));
        return ok({ success:true, orderId:cjRes.data?.orderId, orderNumber:num, breakdown:bd });
      } catch(e) { return ok({ error:e.message }, 500); }
    }

    // GET /api/track/:orderId
    if (path.startsWith('/api/track/')) {
      try {
        const tok = await getToken(CJ);
        const d = await cjGet('/order/getOrderDetail', { orderId:path.split('/api/track/')[1] }, tok);
        if (d.code !== 200) return ok({ error:'Not found' }, 404);
        return ok({ success:true, order:d.data });
      } catch(e) { return ok({ error:e.message }, 500); }
    }

    return ok({ error:'Route not found' }, 404);
  },
};

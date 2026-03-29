# 💄 www.CLCBeauties.com — Cloudflare Deploy Guide
### Crystal Lynn Creates

---

## 📁 What's In This ZIP

```
CLCBeauties-Final/
├── frontend/
│   ├── index.html     ← Your full storefront — upload to Cloudflare Pages
│   ├── logo.png       ← Your logo
│   └── _redirects     ← Cloudflare routing (keep this file)
│
└── backend/
    ├── worker.js      ← Paste into Cloudflare Worker
    ├── wrangler.toml  ← Worker config
    ├── server.js      ← Node.js version (backup)
    ├── package.json
    └── .env.example
```

---

## 🚀 Deploy in 4 Steps

### Step 1 — Create the Worker
1. Go to dash.cloudflare.com
2. Workers & Pages → Create Application → Create Worker
3. Name it: `clcbeauties-api`
4. Click Edit Code → paste everything from `backend/worker.js`
5. Save and Deploy
6. Copy your Worker URL (e.g. `https://clcbeauties-api.YOURNAME.workers.dev`)

### Step 2 — Add Secret Keys to Worker
1. Your Worker → Settings → Variables and Secrets
2. Add Secret: `CJ_API_KEY` = your CJ API key
3. Add Secret: `STRIPE_SECRET_KEY` = your Stripe secret key (`sk_test_...`)

### Step 3 — Update index.html
Open `frontend/index.html` and update these 2 lines:
```
const API_BASE       = 'https://clcbeauties-api.YOURNAME.workers.dev';
const STRIPE_PUB_KEY = 'pk_test_...';
```

### Step 4 — Deploy Frontend
1. Workers & Pages → Create Application → Pages → Upload assets
2. Name: `clcbeauties`
3. Drag and drop the entire `frontend/` folder
4. Deploy site
5. Custom Domains → add `www.CLCBeauties.com`

---

*© 2025 Crystal Lynn Creates · www.CLCBeauties.com* 💄🩷🖤

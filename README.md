# Uptime Kuma

Uptime Kuma is a fancy, self-hosted monitoring tool — watch your websites, APIs, game servers, and TCP/DNS endpoints from one dashboard, with status pages and 90+ notification integrations (Telegram, Discord, Slack, email, webhooks, and more).

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/uptime-kuma-7?utm_campaign=uptime-kuma)

## Deploy and Host

Click **Deploy on Railway** above. There is nothing to configure: the deploy form is zero-field. Railway builds the pinned upstream image, attaches a persistent volume for the database, and gives the service a public domain. Open the domain, create your admin account on the first-run setup screen, and start adding monitors.

## Why Deploy

- **One service, one volume.** No companion database to babysit — Uptime Kuma stores everything in a single SQLite file on the Railway volume.
- **Always-on monitoring.** Monitors run around the clock, so downtime alerts and status pages keep working while you sleep.
- **Private by default.** Your monitor targets, uptime history, and notification tokens live in your own deployment, not a third-party SaaS account.
- **Zero-field deploy.** No secrets to invent, no database URL to wire — the template ships with sensible baked-in defaults.

## Common Use Cases

- Monitor a personal site, blog, or shop and get pinged the minute it goes down.
- Track API endpoints, game servers, and TCP/DNS services with per-monitor intervals and retries.
- Publish a public status page for your project or business.
- Watch SSL certificate expiry and get warned before a cert lapses.

## Configuration

The deployment consumes no required variables. Everything is baked in or injected by Railway:

| Variable | Default | What it does |
|---|---|---|
| `PORT` | injected by Railway | The port Uptime Kuma listens on. Read directly by the app; do not set it. |
| `DATA_DIR` | `/data` (baked in) | App state directory on the Railway volume; holds `kuma.db`. |
| `UPTIME_KUMA_PORT` | unset | Upstream override for `PORT`. Only relevant outside Railway. |
| `UPTIME_KUMA_HOST` | unset (all interfaces) | Bind address. |
| `UPTIME_KUMA_DISABLE_FRAME` | unset | Set to `1` to send `X-Frame-Options: DENY`. |
| `UPTIME_KUMA_SSL_KEY` / `UPTIME_KUMA_SSL_CERT` | unset | Upstream TLS key/cert paths. Leave unset on Railway — TLS terminates at the proxy. |

## Details

- **Runtime:** Node.js, single service, SQLite on a persistent volume.
- **Memory at rest:** roughly 150–300 MB; comfortably inside Railway's service limits.
- **Port:** Railway-injected `PORT` (upstream default 3001); the app honors it natively.
- **Persistence:** `/data` volume mount holds `kuma.db` and all app state.
- **Public URL:** Railway assigns a public domain automatically; the app needs no base-path or public-URL setting.
- **Upstream:** [louislam/uptime-kuma](https://github.com/louislam/uptime-kuma) 2.5.7 (MIT), pinned by digest.

### Deployment Dependencies

- A Railway project with one service and one 1 GB volume. No companion services, no paid add-ons required. Works on the Hobby plan.

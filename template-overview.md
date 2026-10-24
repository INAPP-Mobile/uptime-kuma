# Deploy and Host

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.com/deploy/uptime-kuma-7?utm_campaign=uptime-kuma)

Uptime Kuma is a fancy, self-hosted monitoring tool. Deploy it on Railway in one click — no configuration, no database to wire up. Railway builds the pinned upstream image, attaches a persistent volume, and hands you a public domain. Open it, create your admin account, and start monitoring.

## About Hosting

Uptime Kuma runs as a single Node.js service with a SQLite database on a Railway volume. It is always on, so monitors keep checking and alerts keep firing around the clock. Your monitor targets, history, and notification tokens stay in your own deployment.

## Why Deploy

- One service, one volume — no companion database to babysit.
- Always-on monitoring with status pages and 90+ notification integrations.
- Private by default: no third-party SaaS account holding your uptime data.
- Zero-field deploy: sensible defaults are baked in, so there is nothing to fill out.

## Common Use Cases

- Get alerted the minute your site, shop, or API goes down.
- Monitor game servers, TCP/DNS endpoints, and SSL certificate expiry.
- Publish a public status page for your project or business.

## Dependencies for

Uptime Kuma itself — a single service, SQLite-backed, no companion services.

### Deployment Dependencies

- One Railway service and one persistent volume (1 GB). No paid add-ons required; works on the Hobby plan.
- Environment variables consumed: `PORT` (injected by Railway), `DATA_DIR` (`/data`, baked in). Optional upstream tunables: `UPTIME_KUMA_PORT`, `UPTIME_KUMA_HOST`, `UPTIME_KUMA_DISABLE_FRAME`, `UPTIME_KUMA_SSL_KEY`, `UPTIME_KUMA_SSL_CERT` — all unset by default.

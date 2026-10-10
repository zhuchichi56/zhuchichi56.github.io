# hezhu.me hosting migration

## Current state (2026-10-10)

- Current site: <https://zhuchichi56.github.io/>.
- Migration source: published `origin/master` commit `84fbac3`.
- `hezhu.me` is listed as available by Namecheap; the one-year cart subtotal
  was CNY 73.48, with final charges in USD. Availability and price can change.
- No domain purchase, hosting subscription, DNS change, or production cutover
  has been completed. Registrar login, purchase authorization, and a hosting
  account/server are still required.
- <https://liyixia.me/> resolves to GitHub Pages addresses. A custom domain
  alone does not change the hosting network or ensure mainland accessibility.

## Recommended first deployment

Use a Hong Kong host with HTTPS and verify performance from mainland networks
before switching links. A mainland host/CDN generally requires identity
verification and ICP filing; confirm current `.me` domain eligibility with the
provider before buying if mainland hosting is required.

The site remains static HTML/CSS with local images, PDFs, and Lato fonts.
Google Fonts is no longer a page-load dependency. External destinations such
as Google Scholar and GitHub still follow the visitor's network availability.

## Option A: Existing static hosting

Run from the project root:

```bash
bash deploy/package.sh
```

Upload the contents of `dist/hezhu-site.tar.gz` to the host's document root,
not the archive itself. The package deliberately includes public site assets
and PDFs and excludes Git history, development notes, and LaTeX sources.
Follow the provider's custom-domain instructions for DNS and HTTPS; do not
add a GitHub Pages CNAME record if the destination is another host.

## Option B: Hong Kong server with Docker

The repository includes Caddy with automatic HTTPS. On the selected server,
install Docker from its official distribution, clone the approved migration
branch, and allow inbound TCP 80/443 (UDP 443 is optional for HTTP/3).
Point the domain's A record to that server. Add AAAA only if IPv6 is working.

From the repository root, after DNS resolves to the server:

```bash
SITE_DOMAIN=hezhu.me docker compose -f deploy/compose.yaml up -d --build
SITE_DOMAIN=hezhu.me docker compose -f deploy/compose.yaml logs --tail=50
curl --fail --head https://hezhu.me/
curl --fail --head https://hezhu.me/cv.pdf
```

The named Caddy volumes preserve certificates across container replacements.
Only `hezhu.me` is configured initially. If `www.hezhu.me` is also desired,
configure its DNS and add a separate HTTPS redirect in `deploy/Caddyfile`.

## Acceptance and rollback

Verify HTTPS, homepage, mobile layout, all local images/fonts, and both CVs.
Test from mainland mobile and broadband networks with no proxy before claiming
mainland accessibility. An international HTTP 200 is insufficient evidence.
Record the chosen provider, region, DNS, price/renewal terms, and actual test
results here after deployment. Keep the existing GitHub Pages endpoint live
during migration. This preparation does not change its domain or Pages settings.

To roll back a server release, rebuild the previously verified revision. Keep
certificate volumes. If DNS has been switched, restoring the previous target
still requires accounting for DNS caches and certificate validity.

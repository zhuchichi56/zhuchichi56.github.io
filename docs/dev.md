## 2026-10-10 — Prepare hezhu.me migration for mainland visitors

### Question

Migrate the existing academic homepage to `hezhu.me` with better access from
mainland China, and help register the domain.

### Analysis / Root Cause

GitHub Pages currently serves `master`. The reference `liyixia.me` also resolves
to GitHub Pages, so merely changing the domain does not change its host.
The existing stylesheet additionally imports Google Fonts. The local original
checkout has unpublished CV changes and is behind the deployed revision.
Use an isolated worktree based on `84fbac3` to preserve those user edits.

Namecheap lists `hezhu.me` as available. A one-year cart subtotal was CNY 73.48,
charged in USD; actual checkout and renewal terms require reconfirmation.
No registrar or cloud-host account is authenticated for this migration.

### Solution

Self-host all four existing Lato styles with their OFL license. Prepare a
public-assets archive and an optional Caddy/Docker deployment with automatic
HTTPS. Document host choices, DNS, acceptance checks, and rollback. Domain
purchase, hosting activation, DNS changes, and cutover remain pending user
account/purchase details. Mainland accessibility has not yet been verified.

### Files Changed

- `assets/style.css`, `assets/fonts/`
- `deploy/package.sh`, `deploy/Caddyfile`, `deploy/Dockerfile`, `deploy/compose.yaml`
- `.gitignore`, `.dockerignore`, `README.md`
- `docs/hosting-migration.md`, `docs/dev.md`

### Verification

Shell syntax, public-only archive contents, and all 17 local HTML references
passed verification. Browser inspection confirmed all 15 images and local fonts
load and the desktop layout is preserved. `git diff --check` passed. Docker
Compose validation was unavailable because the local Docker CLI lacks the
Compose plugin; server HTTPS and mainland network checks remain pending.

### Commit Hash

The preparation commit is identifiable with
`git log -1 --format=%H --grep='Prepare hezhu.me hosting migration'`.

## 2026-10-09 — Refresh Chinese CV

### Question
Update the outdated Chinese PDF and remove the internship-offer paragraph; retain Chinese source/PDF in the repository without adding a homepage entry.

### Analysis / Root Cause
The Chinese CV still described MSRA as the current role, omitted LongCat and recent papers, and included historical offer claims.

### Solution
Use the user-confirmed June 2026 Meituan and October 2025 MSRA starts, Chinese department labels with English names, default Gmail, September 2024 enrollment and June 2027 graduation. Synchronize publications with the updated English CV, retaining equal-contribution marks, links and actual publication status. Remove offer claims and stale publication counts. Keep the existing academic honors.

### Files Changed
- cv_cn.tex
- cv_cn.pdf
- docs/dev.md

### Verification
Tectonic compiled without warnings; PDF has two A4 pages, both visually reviewed. No homepage or English CV changes. Native editor compile was requested; repository assets require the project compiler for PDF export.

### Commit Hash
See the commit titled `Update Chinese CV and remove historical offer claims` in this branch.

# CV synchronization - 2026-10-08

## Question
Update the public English CV to match the academic homepage before JD TGT applications.

## Analysis / Root Cause
The published CV lagged behind index.html in current role, research framing, publications, projects, education and service. The original checkout contains pre-existing CV edits and remains untouched. Work starts from origin/master in an isolated feature branch.

## Solution
Synchronize the English LaTeX CV with homepage facts: LongCat Researcher / Top Talent Program, previous MSRA mentorship, three research directions, LongCat-DeepResearch co-first report, PlanBench preprints, KDD status, project deployments, Berkeley visit and service. Use homepage employment wording rather than inventing dates. Preserve the Chinese CV for a separate request.

## Files Changed
cv.tex, cv.pdf, docs/dev.md.

## Verification
Tectonic compilation passed without warnings. All two pages were rendered and visually checked. Expected graduation was updated to June 2027 based on user confirmation.

## Commit Hash
See the commit containing this entry.

---

# Development Log

## 2026-10-04 — Replace SIGSPATIAL 2022 publication figure

### Question

Use the user-provided image for Personalized Individual Trajectory Prediction
via Meta-Learning, not for the LongCat publication.

### Analysis / Root Cause

The attachment depicts the paper's support/query meta-learning framework.
The user explicitly identified the corresponding SIGSPATIAL 2022 entry.

### Solution

Add the supplied PNG under a new asset filename and update only that publication
image reference, retaining the existing inline responsive bounds and paper details.
The new filename avoids reusing the cached older figure.

### Files Changed

- `index.html`
- `assets/papers/sigspatial-meta-learning.png`
- `docs/dev.md`

### Verification

git diff --check passed. The replacement is a valid PNG and referenced once;
publication title, author list, venue, links, inline sizing, and the LongCat
image reference are preserved. Live asset verification follows deployment.

### Commit Hash

`588b167` — Replace SIGSPATIAL meta-learning publication figure.

## 2026-10-04 — Align education and simplify report news

### Question

Align Education and Experience logos/text, and announce the LongCat technical
report without the co-first-author phrase. The user withdrew the SenseTime
Research Institute rename; preserve Foundation Language Model Center.

### Analysis / Root Cause

Education used independent automatic tables with 15%/85% columns, whereas
Experience used fixed 25%/75% columns. Their logo centers and text starts differed.

### Solution

Reuse the existing fixed experience table layout for both education entries,
including explicit rows and inline column/image bounds. Simplify only the News
announcement; preserve publication author order and equal-contribution markers.
Leave the SenseTime department unchanged.

### Files Changed

- `index.html`
- `docs/dev.md`

### Verification

git diff --check and HTMLParser checks passed: five institution tables share
fixed 25%/75% columns, all local assets exist, and all nine paper images retain
inline bounds. SenseTime wording and publication author markers are unchanged.
Live content verification follows Pages deployment. Browser screenshot capture
was unavailable, so this is structural verification rather than visual proof.

### Commit Hash

`94c287a` — Align education with experience and simplify report news.

## 2026-10-04 — Recover layout from mixed HTML/CSS versions

### Question

The user reports the personal homepage layout is broken after the publication
alignment update. Repair it while preserving the requested content.

### Analysis / Root Cause

The previous alignment change removed width=200 from all nine paper images and
moved their constraints into newly added CSS rules. GitHub Pages serves CSS with
Cache-Control: max-age=600 and the stylesheet URL had not changed. New HTML paired
with the previously cached stylesheet has no matching sizing rules: the LongCat
image is intrinsically 1584x1014 and the other checked paper images are 700px wide.
That mixed-version failure mode can expand the nested tables and break the page.
Prior verification checked deployed HTML/CSS separately, missing this scenario.

### Solution

Version the stylesheet URL to force retrieval of the matching CSS. Restore
width=200 and inline responsive width constraints on every paper figure. Keep
critical publication and experience columns/table sizing inline as well as in CSS,
and give all three employer logos inline bounds. Thus cached or missing CSS cannot
remove the layout's essential image/column constraints. Retain all biography,
Top Talent, SUSTech, author order, and hidden Top 1% changes.

### Files Changed

- `index.html`
- `docs/dev.md`

### Verification

`git diff --check` passed. All nine paper images have a 200px fallback and inline
responsive bounds; all three employer logos have inline bounds; all 24 affected
cells retain widths without CSS. The versioned stylesheet, local references, and
requested content/order were verified. Live checks follow deployment.
Native browser capture returned a blank surface, so it is not treated as visual
proof of the layout. The former browser tab also contained an older cached page.

### Commit Hash

`604fb05` — Restore image bounds and invalidate cached homepage CSS.

## 2026-10-04 — Hide Top 1% and align publication entries

### Question

Hide Top 1% claims and align LongCat-DeepResearch with the publication entries below.

### Analysis / Root Cause

Top 1% appeared in both PlanGPT's news and publication entry. Publication tables
used automatic column sizing with nominal 25% figure columns and 200px images;
LongCat additionally constrained its figure with max-width:100%, unlike the other
papers. The independent sizing rules could shift the text-column starting point.

### Solution

Remove both Top 1% mentions while retaining Oral. Give all nine illustrated papers
the same fixed 30%/70% columns, shared responsive image sizing capped at 200px,
and explicit table rows. Keep the default 20px cell padding consistent.

### Files Changed

- `index.html`
- `assets/style.css`
- `docs/dev.md`

### Verification

`git diff --check` passed. HTML inspection confirmed nine shared publication
tables/figure/details columns, all local assets exist, and both Top 1% mentions
are absent while Oral remains. Live content/CSS checks follow deployment.
Full-page browser visual inspection is unavailable in this environment.

### Commit Hash

`612d861` — Align publication entries and hide Top 1% claims.

## 2026-10-04 — Put current role before research directions

### Question

Place the current Meituan role, previous Li Dong mentorship, and EMNLP Area Chair
paragraph above the three research directions.

### Analysis / Root Cause

The paragraph followed the research list. The user requested the reverse order.

### Solution

Move the paragraph intact to immediately precede the research introduction.
The biography now presents academic background, current role and mentorship,
then the three directions.

### Files Changed

- `index.html`
- `docs/dev.md`

### Verification

Verified the role paragraph occurs once and precedes the research introduction.
`git diff --check` and live-site verification accompany publication.

### Commit Hash

`6d6e280` — Move current role above research directions.

## 2026-10-04 — SUSTech name and homepage presentation refinements

### Question

Use SUSTech for the university name and finish the biography and experience
presentation refinements: Top Talent emphasis, simpler opening, and LongCat logo.

### Analysis / Root Cause

The user confirmed the preferred public school name is SUSTech. The opening
unnecessarily repeated degree majors; the research paragraph was dense and
the current Meituan entry lacked the logo column used by the other employers.

### Solution

Use SUSTech throughout the homepage and omit major names from the opening only.
Retain education details in the Education section and leave CV files untouched.
Highlight Researcher (Top Talent Program) in the biography and Meituan experience.
Present the three research directions as a compact list. Give Meituan, MSRA, and
Shanghai AI Laboratory the same logo/text columns and spacing. Retain Li Dong's
mentorship. Crop the green cat mark from the official LongCat repository logo.
Publish through a feature-branch pull request under the user's existing approval.

Logo source:
<https://github.com/meituan-longcat/LongCat-DeepResearch/blob/main/assets/longcat_logo.png>

### Files Changed

- `index.html`
- `assets/style.css`
- `assets/logos/longcat.png`
- `docs/dev.md`

### Verification

`git diff --check` passed. All 17 local asset/link references exist. HTML checks
confirmed three matching logo/text experience rows, two Top Talent mentions,
SUSTech naming, major-free opening, and retained mentorship and arXiv links.
The cropped logo was visually inspected. No connected browser was available for
a full-page visual preview; live content/assets will be checked after deployment.

### Commit Hash

`e0c9935` — Refine homepage biography and align experience entries.
Publication uses `feat/homepage-layout-20261004` and an approved pull-request merge;
no commit/ref is pushed directly to `master`.

## 2026-10-04 — Review biography and experience presentation

### Question

Review how to highlight the Top Talent program, simplify the opening academic
introduction, and align the current LongCat experience with the other entries.

### Analysis / Root Cause

The current biography omits Top Talent and includes both major names. Its research
paragraph contains many inline project links. The Meituan experience occupies a
full-width text row, whereas MSRA and Shanghai AI Laboratory use logo/text columns.
The public LongCat repository supplies a wide logo with a separable green cat mark.

### Solution

Propose Researcher (Top Talent Program) in the biography and experience section;
use M.Sc. at Peking University and B.E. at Southern University of Science and
Technology in the opening; retain the three research directions and Li Dong's
mentorship; use the official cat mark and consistent experience columns.
This turn is a review request, so no website changes or deployment were performed.

### Files Changed

- `docs/dev.md` (review record only)

### Commit Hash

The review record's commit is available via `git log -1 -- docs/dev.md`.

## 2026-10-04 — Research directions, current role, and arXiv link

### Question

Update the homepage research directions and current Meituan role, retain Li Dong's
mentorship, add the formal arXiv link, and publish the approved pull request.

### Analysis / Root Cause

The user clarified that the three research directions are data synthesis,
continual learning, and agent harnesses. UrbanClaw, systems around PlanGPT and
PlanGPT-VL, and LongCat-DeepResearch belong in the agent-harness discussion.
The current role is Researcher at Meituan LongCat; the former MSRA role must not
still be labeled current. No unconfirmed employment end/start month is invented.
The user emphasized Li Dong's mentorship and requested homepage edits only.
The official project page and arXiv API confirm report ID `2609.36071`.

### Solution

Rewrite the research biography around the three directions. Add the current
Meituan Researcher role, retain the previous MSRA internship, and write:
"Before that, I was very fortunate to be mentored by Dr. Li Dong...".
Use formal arXiv abstract/PDF links. CV files remain untouched.
The user approved merging and publishing PR #1.

### Files Changed

- `index.html`
- `docs/dev.md`

### Verification

`git diff --check` passed. All 16 local asset/link references exist. Content checks
confirmed the three directions, current Meituan role, Li Dong mentorship, and
co-first-author order. The formal arXiv abstract and PDF links returned HTTP 200.
Deployment verification follows the approved merge.

### Commit Hash

`e0adb2b` — Refresh research focus and Meituan role with arXiv links.
Published through the user-approved PR #1; final live-site checks are performed
after GitHub Pages finishes building the merge.

## 2026-10-04 — LongCat-DeepResearch homepage update

### Question

Identify the homepage repository and its file structure and storage footprint.
Add LongCat-DeepResearch to the first-author publications.

### Analysis / Root Cause

The homepage is a standalone static HTML/CSS repository. The original checkout
was behind the deployed `origin/master` and contained existing uncommitted CV
changes. A separate worktree based on the latest remote commit preserves those
changes and avoids reverting recently updated publications.

The public technical report's Appendix D lists He Zhu* and Yue Xu* first, with
the footnote identifying equal contribution. The project page dates the release
to September 2026. The homepage therefore uses co-first-author wording and keeps
He Zhu first in the displayed author list.

The original checkout is about 95 MB, of which about 92 MB is Git history.
Host storage was inventoried separately; experimental assets are not part of this
website repository. Existing employment dates need user confirmation before edits.

Sources:
- <https://meituan-longcat.github.io/LongCat-DeepResearch/>
- <https://github.com/meituan-longcat/LongCat-DeepResearch/blob/main/technical_report/LongCat-DeepResearch.pdf>

### Solution

Add a September 2026 news item, a short research introduction, and a publication
entry at the top of the first-author section. Use the official harness figure
and link the public report, code, and project page. Document the repository map,
local preview, storage footprint, and pull-request publishing workflow.

### Files Changed

- `index.html`
- `assets/papers/longcat-deepresearch.png`
- `README.md`
- `docs/dev.md`

### Verification

`git diff --check` passed. An HTMLParser check confirmed all 16 local asset/link
references exist and the new entry precedes ASFT in the first-author section.
The three new external destinations returned HTTP 200. Author order and equal
contribution were checked against Appendix D of the public technical report.
Interactive visual preview was unavailable: no connected browser was present,
and the native Safari connection timed out.

### Commit Hash

`aee0afa` — Add LongCat-DeepResearch co-first-author publication.
Prepared on `feat/homepage-longcat-deepresearch-20261004` for pull-request review;
the live Pages source remains `master` until the pull request is approved and merged.

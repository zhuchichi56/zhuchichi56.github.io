# Development Log

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

Pending commit; recorded by the subsequent deployment log entry.

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

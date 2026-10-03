# He Zhu's Academic Homepage

Public site: <https://zhuchichi56.github.io/>

This is a static HTML/CSS website. No package installation or build step is required.

## Repository structure

```text
index.html             Biography, news, publications, projects, and experience
assets/style.css       Shared typography and colors
assets/hezhu.jpg        Profile photo
assets/papers/          Publication figures
assets/logos/          Institution and link icons; cv/ contains CV logos
cv.tex / cv.pdf         English CV source and published PDF
cv_cn.tex / cv_cn.pdf   Chinese CV source and PDF
He Zhu.pdf             Additional existing PDF
docs/dev.md            Development decisions and verification history
```

## Editing and preview

Edit `index.html` for homepage content and `assets/style.css` for shared styles.
Put publication thumbnails in `assets/papers/` and reference them with relative paths.
Keep author order and equal-contribution markers consistent with the public paper.

Open `index.html` in a browser to preview the site locally. Alternatively, run
`uv run --no-project python -m http.server 8000` from the repository root and open
<http://localhost:8000/>.

## Publishing

GitHub Pages currently serves the repository root from `master`.
Prepare changes on a `feat/*` or `wip/*` branch and open a pull request.
After the approved pull request is merged, GitHub Pages publishes the updated files.
Never push directly to `master` from this workspace.

## Storage

At the October 2026 inventory, the original checkout occupied approximately 95 MB:
about 92 MB of Git history, 2 MB of assets, and less than 1 MB of root files.
The homepage contains no training datasets, checkpoints, or dependency directory.
Git history is not an asset folder; deleting `.git` would destroy the local repository.

# 1vs100.github.io
Docs

## Player docs

The player-facing docs site lives in `docs/` and is built with
[`properdocs`](https://github.com/properdocs) from `properdocs.yml`.

- Sources: `docs/` (Markdown pages, `CNAME`, `assets/`)
- Build locally: `properdocs build` (output goes to `site/`, zero warnings expected)
- Deploy: GitHub Actions publishes `site/` to GitHub Pages on the custom domain
  `docs.1vs100.fans` (see root `CNAME`)

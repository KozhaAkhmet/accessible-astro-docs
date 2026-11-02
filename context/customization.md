# Upstream leftovers and troubleshooting

These still point to Incluud and must be changed when rebranding:

| Location | Leftover |
|---|---|
| `astro.config.mjs` → `title`, `logo` | "Accessible Astro Documentation", `src/assets/logo-*.svg` |
| `astro.config.mjs` → `social` | Bluesky / GitHub / Open Collective of incluud |
| `astro.config.mjs` → `editLink.baseUrl` | `https://github.com/incluud/astro-docs/edit/main/` |
| `src/components/Head.astro` | OG/Twitter image URL on `accessible-astro.incluud.dev` |
| `public/_redirects` | Netlify redirect for `astro.incluud.dev` |
| `public/*-profile.png`, `WhoAreWe.astro`, `Mission.astro`, `Support.astro`, `Footer.astro` | Incluud team/homepage content |
| `src/components/Projects.astro` | hard-coded incluud repo list |
| `README.md`, existing content pages | Incluud ecosystem docs |

Removable if unused: `sentry()` integration + `@sentry/astro`; `Projects`/`GitHubStats` + `GITHUB_TOKEN`.

Known dead code: `src/components/index.js` exports files that do not exist; `Sponsor.astro` is empty.

## Troubleshooting
| Symptom | Fix |
|---|---|
| Build fails after editing MDX | check frontmatter, imports, `<!-- -->` comments, bare `<`/`{` (conventions.md) |
| Stale output / linked package not updating | `rm -rf node_modules/.astro node_modules/.vite`, restart dev |
| Still broken | `rm -rf node_modules && npm install`; Node 18+ |
| Homepage project cards fail | GitHub rate limit → set `GITHUB_TOKEN` |
| Search empty in dev | Pagefind index exists only after `npm run build`; use `npm run preview` |

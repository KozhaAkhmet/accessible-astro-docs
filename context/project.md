# Project: stack, commands, layout

## Stack
- Astro 6, Starlight 0.40 (`@astrojs/starlight`), MDX content.
- `accessible-astro-components` 5.8 — live component demos.
- `astro-icon` with `@iconify-json/ion` + `@iconify-json/mdi` only.
- Vue 3 (`@astrojs/vue`) for client islands; `@iconify/vue` for icons in Vue.
- `@sentry/astro`, `dotenv`, `sharp`. Prettier + `prettier-plugin-astro`.

## Commands
| Task | Command |
|---|---|
| Install | `npm install` |
| Dev (port 4321) | `npm run dev` |
| Build → `dist/` | `npm run build` |
| Preview build | `npm run preview` |
| Format | `npx prettier --write .` |
| Update diagram viewer (jgraph/drawio) | `npm run drawio:update -- <tag>` |

Verify any change with `npm run build` (must pass with no errors).

## Env (`.env`, all optional)
- `GITHUB_TOKEN` — GitHub API in `src/utils/github.ts` and `GitHubStats.vue`; injected via `vite.define` in `astro.config.mjs`. Without it the homepage `Projects` fetch may hit rate limits.
- `SENTRY_DSN`, `SENTRY_ENVIRONMENT`, `SENTRY_PROJECT`, `SENTRY_AUTH_TOKEN` — `sentry()` integration.

## Layout
```
astro.config.mjs        site config, SIDEBAR (manual), Starlight overrides, integrations
scripts/workspace-config.js  detects npm-linked accessible-astro-components, enables reload
src/content.config.ts   docs + i18n collections
src/content/i18n/en.json  Starlight UI strings ("On this page" → "Quick access")
src/content/docs/       pages; path = URL
  index.mdx             homepage, template: splash
  getting-started/ themes/ components/ contributing/ resources/
src/components/         site components + Starlight overrides  → components/site.md
src/assets/             logos, images (importable)
src/assets/diagrams/    .drawio files for <Diagram>             → components/site.md
src/styles/custom.css   global CSS                             → styling.md
src/styles/palette.css  brand colors and Starlight color tokens → styling.md
src/utils/github.ts     getRepository() etc.
public/                 static: favicon, profile PNGs, social image, _redirects (Netlify)
public/drawio/          vendored diagram viewer, Apache-2.0, not MIT (do not edit; see README.md there)
```

## Routing
`src/content/docs/a/b.mdx` → `/a/b/`. `index.mdx` → `/`.

## Deployment (upstream)
Netlify: build `npm run build`, publish `dist`, redirects in `public/_redirects`.

## Linked components package
```bash
cd ../accessible-astro-components && npm link
cd ../accessible-astro-docs && npm link accessible-astro-components
```
Dev server logs "Workspace detected" when the symlink is found.

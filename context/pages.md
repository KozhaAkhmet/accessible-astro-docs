# Adding and registering pages

## Steps
1. Create `src/content/docs/<section>/<slug>.mdx`.
2. Add frontmatter (both keys required by convention):
   ```mdx
   ---
   title: My page
   description: One sentence for SEO and previews.
   ---
   ```
3. Add the page to `sidebar` in `astro.config.mjs`. The sidebar is a manual list; unlisted pages are reachable by URL but not shown.
4. Body headings start at `##` (`title` renders the `h1`).
5. `npm run build`.

## Sidebar entry
```js
{
  label: 'Components',
  items: [
    { label: 'Drawer', link: '/components/drawer', badge: { text: 'new', variant: 'success' } },
  ],
}
```
- Links are root-relative, no trailing slash, no extension.
- Badge conventions: `new`→`success`, `beta`→`danger`, `updated`→`note`, `next`→`tip`, `tip`→`note`.
- Auto-filled group alternative: `{ label: 'Guides', autogenerate: { directory: 'guides' } }`.
- Component pages are listed alphabetically after `Overview`; keep that order.

## Optional frontmatter (Starlight)
| Key | Effect |
|---|---|
| `template: splash` | full-width, no sidebars (homepage) |
| `hero: { tagline, image: { file, alt }, actions: [{ text, link, icon, variant }] }` | hero block (splash pages) |
| `sidebar: { order, label, badge, hidden }` | only affects `autogenerate` groups |
| `tableOfContents: false` | hide right-hand TOC |
| `draft: true` | excluded from production build |
| `pagefind: false` | excluded from search |

## Homepage
`src/content/docs/index.mdx` composes `Mission`, `Support`, `Projects`, `WhoAreWe`, `Footer` (see components/site.md) plus `<div class="dot-pattern" aria-hidden="true"></div>`.

For a new component page use the skeleton in page-template.md.

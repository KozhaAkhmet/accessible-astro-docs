# Site components (`src/components/`) and Starlight overrides

| File | Purpose | Props | Used by |
|---|---|---|---|
| `Head.astro` | Override of Starlight `Head`; adds OG/Twitter image meta and the `data-toast-demo` click handler | Starlight props | `astro.config.mjs` `components.Head` |
| `PageFrame.astro` | Override of Starlight `PageFrame`; mounts global `<ToastProvider position="bottom-right" />` | — | `components.PageFrame` |
| `Mission.astro` | Homepage "Our mission" section | — | `index.mdx` |
| `Support.astro` | Homepage "Support us" section | — | `index.mdx` |
| `Projects.astro` | Build-time `getRepository()` calls → grid of `ProjectCard` + a "Coming soon" preview card | — | `index.mdx` |
| `ProjectCard.astro` | Repo card: Starlight `Badge`s, `GitHubStats`, `<pixel-canvas>` hover effect (`src/assets/scripts/pixel-canvas.js`) | `title`*, `href`, `description`, `repo: GitHubRepo`, `isPreview` | `Projects.astro` |
| `GitHubStats.vue` | Client island (`client:load`); refreshes stars/forks, 5-min localStorage cache | `owner`, `repo`, `initialStars`, `initialForks` | `ProjectCard.astro` |
| `ContentMedia.astro` | Two-column image + slot content, tilted image frame | `imgSrc`*, `reverseImg` | `WhoAreWe.astro` |
| `WhoAreWe.astro` | Team bios (`#who-we-are`) | — | `index.mdx` |
| `Diagram.astro` | Renders a `.drawio` file as an SVG `<img>` via the vendored viewer (see below) | `alt`*, `src` or `xml`, `caption`, `page`, `background`, `border`, `scale`, `loading`, `class` | `components/diagram.mdx` |
| `Footer.astro` | © year footer | — | `index.mdx` |
| `Sponsor.astro` | empty | — | — |
| `index.js` | dead: re-exports non-existent files; never import | — | — |

## Diagram (draw.io-format files)
```mdx
import Diagram from '../../../components/Diagram.astro';

<Diagram src="example.drawio" page={1} alt="What the diagram shows" caption="Optional" />
```
- Diagram files: `src/assets/diagrams/**/*.drawio`; `src` is the path relative to that folder. Unknown `src` fails the build and lists the available files.
- `xml` takes raw `<mxfile>` / `<mxGraphModel>` XML instead of `src`.
- `alt` is required and must describe the content. For complex diagrams, also write the key information as text.
- `page` is zero-based. `background` defaults to `#ffffff` (readable in dark mode); `'none'` = transparent.
- Pipeline: at build, the XML goes into `data-xml` on a `<figure>`. In the browser (lazy, IntersectionObserver, 200px margin), `/drawio/viewer-static.min.js` loads once per page. `GraphViewer.createViewerForElement` renders off-screen, `graph.getSvg(bg, scale, border, false, null, true)` exports the SVG, and the SVG goes onto the `<img>` as a blob URL with its width and height set.
- No JS: `<noscript>` shows the alt text. Render failure: the status text changes to an error and the error is logged to the console.
- The output is an `<img>`, so links inside the diagram are not clickable, and external images or fonts in the diagram do not load.
- Viewer: `public/drawio/viewer-static.min.js` (~4.4 MB, Apache-2.0, from github.com/jgraph/drawio). The tag is in `public/drawio/VERSION`. Update with `npm run drawio:update -- <tag>` (`scripts/update-drawio-viewer.sh`). Do not edit the vendored file.
- Licensing: component code is MIT; `public/drawio/` stays Apache-2.0 with its `LICENSE` and `README.md`. Never relicense, edit or strip notices from it.
- Trademark: "draw.io" is a JGraph Ltd trademark. Use it only to describe the file format or the upstream source. Never in component, page or sidebar names, never with its logo, never implying affiliation. Keep the disclaimer in the page's "Credits and trademark" section.
- Some uncommon stencils load from `viewer.diagrams.net` (`STENCIL_PATH`); basic shapes need no network.

## Using in MDX
Relative import from the page:
```mdx
import ContentMedia from '../../components/ContentMedia.astro';

<ContentMedia imgSrc="/mark-profile.png" reverseImg>
  ### Heading
  Text.
</ContentMedia>
```
Vue components need a hydration directive: `client:load` | `client:visible` | `client:idle`.

## New site component
- `.astro` for static/markup; `.vue` only when client state is needed.
- Typed `interface Props`; use `--sl-*` tokens (styling.md); scoped `<style>`.
- Section components use `<section>` + `<div class="container">` + `h2` sized `var(--sl-text-5xl)`.

## Adding a Starlight override
1. Create `src/components/X.astro` wrapping the default:
   ```astro
   ---
   import Default from '@astrojs/starlight/components/Footer.astro'
   ---
   <Default {...Astro.props}><slot /></Default>
   <p>Extra</p>
   ```
2. Register in `astro.config.mjs` → `starlight({ components: { Footer: './src/components/X.astro' } })`.
3. Overridable names: https://starlight.astro.build/reference/overrides/ (e.g. `Header`, `Footer`, `Sidebar`, `Hero`, `PageTitle`, `MarkdownContent`).
When overriding `PageFrame`, keep the `header` and `sidebar` named slots forwarded as in the current file.

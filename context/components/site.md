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
| `Footer.astro` | © year footer | — | `index.mdx` |
| `Sponsor.astro` | empty | — | — |
| `index.js` | dead: re-exports non-existent files; never import | — | — |

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

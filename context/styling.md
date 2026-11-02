# Styling: global helpers and tokens

Global CSS: `src/styles/custom.css` (registered via `customCss` in `astro.config.mjs`). Put site-wide rules there; component-specific rules in the component's `<style>`.

## Helper classes
| Class / rule | Use |
|---|---|
| `.not-content` | Starlight: disables prose styles. Wrap every live demo. |
| `.props-wrapper` | Wrap props tables; adds right-edge scroll fade. |
| `table td { white-space: nowrap }` | Global; keep table cells short. |
| `.dot-pattern` | Decorative dotted background + blurred gradient blobs on `.page`. Use with `aria-hidden="true"`. |
| `.skip-link a` | Makes SkipLink demos render inline. |
| `.sr-only` | Visually hidden, screen-reader text. |
| `.avatar .subtitle` | Spacing fix for Avatar demos. |

## Custom properties
- `--gradient-primary`, `--gradient-secondary` (defined in `custom.css`).
- Starlight tokens (theme-aware, prefer over hard-coded colors):
  - Colors: `--sl-color-accent`, `--sl-color-white`, `--sl-color-black`, `--sl-color-gray-1`…`-6`, `--sl-color-bg`, `--sl-color-bg-nav`
  - Type: `--sl-text-xs`…`--sl-text-5xl`, `--sl-text-h1`…`-h6`, `--sl-line-height`
  - Shadows: `--sl-shadow-sm`, `--sl-shadow-md`, `--sl-shadow-lg`

## Overriding library component styles in examples
Astro styles are scoped. Use `:global(.badge)` inside `<style>` or `<style is:global>`. Library components also accept `class` (Tailwind classes work in demos).

## Inline demo layout
Existing pages lay out demos with inline styles, e.g.
`<div style="display: flex; gap: 1rem; flex-wrap: wrap; align-items: center;">`.

# Styling: global helpers and tokens

Global CSS: `src/styles/custom.css` (registered via `customCss` in `astro.config.mjs`). Put site-wide rules there; component-specific rules in the component's `<style>`.

## Helper classes
| Class / rule | Use |
|---|---|
| `.not-content` | Starlight: disables prose styles. Wrap every live demo. |
| `.props-wrapper` | Wrap props tables. Table cells wrap and tables fill the column from `50rem` up. A table too wide to fit scrolls inside the wrapper, so always wrap tables with long code values. |
| `.dot-pattern` | Decorative dotted background + blurred gradient blobs on `.page`. Use with `aria-hidden="true"`. |
| `.skip-link a` | Makes SkipLink demos render inline. |
| `.sr-only` | Visually hidden, screen-reader text. |
| `.avatar .subtitle` | Spacing fix for Avatar demos. |

## Content width
`--sl-content-width` in `custom.css` sets the middle column's maximum (`56rem`; Starlight's default is `45rem`). On pages with a table of contents the column starts next to the left sidebar instead of being centered, and the header search box lines up with its left edge. `--main-pane-width` adds `3rem` of space between the column and the right sidebar, and `--quick-access-width` sets the right sidebar's minimum width. These rules replace Starlight's widths, so recheck them after a Starlight upgrade. `--__main-column-fr` is a private Starlight variable.

## Right sidebar
The table of contents is a "Quick access" card, styled in `custom.css` under `.right-sidebar-panel`. Links get a background on hover and on the current section (`a[aria-current='true']`). The label comes from `src/content/i18n/en.json`. The top "Overview" link is hidden on desktop by CSS, and it still shows in the mobile dropdown.

## Left sidebar breakpoint
The left sidebar collapses into the burger menu below `60rem` (960px); Starlight's default is `50rem`. Starlight hard-codes `50rem`, so the last media query in `custom.css` reproduces its mobile layout for `50rem`–`59.99rem`. To change the breakpoint, change `59.99rem` there. Between those widths the header keeps the social icons and theme switch, so they do not appear in the menu.

At all burger widths the button is flat and sits on the left of the header; the next media query in `custom.css` sets this, reserves header space for it and pushes the search bar to the right.

The menu opens as a drawer that slides in from the left over a backdrop. The drawer styles are in `custom.css`. The script in `src/components/PageFrame.astro` closes it on an outside click or when focus leaves it; Escape and the burger button close it through Starlight's own script.

## Palette
`src/styles/palette.css` (loaded before `custom.css`) holds the colors, copied from the KozhaAkhmet.github.io site. Change the four `--brand-*` values to recolor the site; the `--color-*` ramps and `--sl-color-*` tokens are derived from them. Dark accent = secondary (gold), light accent = primary (blue). Note asides use primary and caution asides use outline (rust). Tip, danger and success keep Starlight's colors. `ProjectCard.astro` repeats the brand colors in `data-colors`.

Keep light-mode link text at `--color-primary-500` or darker: `--color-primary-400` fails 4.5:1 on white.

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

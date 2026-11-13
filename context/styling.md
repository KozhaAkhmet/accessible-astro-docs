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
`--sl-content-width` in `custom.css` sets the middle column's maximum (`62rem`; Starlight's default is `45rem`). The homepage is not affected: its hero layout keeps Starlight's `67.5rem`. On pages with a table of contents the column starts next to the left sidebar instead of being centered, and the header search box lines up with its left edge. `--main-pane-width` adds `1rem` of space between the column and the right sidebar, and `.right-sidebar-panel` has a `0.5rem` inline-start padding, so the gap to the Quick access card is 48px on wide screens and 32px on laptops, and `--quick-access-width` sets the right sidebar's width (`clamp(14rem, 16vw, --sl-sidebar-width)`). Below about 1670px the sidebar width, not `--sl-content-width`, limits the column, so change both to widen it on laptops. Demos must not use fixed widths: use `repeat(auto-fit, minmax(min(100%, 20rem), 1fr))` grids. Form demos are capped at `40rem` in `custom.css`. These rules replace Starlight's widths, so recheck them after a Starlight upgrade. `--__main-column-fr` is a private Starlight variable.

## Right sidebar
The table of contents is a "Quick access" card, styled in `custom.css` under `.right-sidebar-panel`. Links match the left sidebar: the text turns `--sl-color-white` on hover and focus, and the current section (`a[aria-current='true']`) gets the accent background. Do not use `--sl-color-hairline` as a hover background: in dark mode it equals `--sl-color-bg-nav`, so it is invisible on the card and the header. The label comes from `src/content/i18n/en.json`. The top "Overview" link is hidden on desktop by CSS, and it still shows in the mobile dropdown. Starlight marks a link current only when its heading scrolls to just below the header, which the last heading cannot reach on tall screens; a script in `PageFrame.astro` marks the last link current when the page is scrolled to the bottom. A `MutationObserver` re-applies it whenever Starlight moves the highlight while the page is at the bottom, because Starlight's observer can report the previous section after the last scroll event (e.g. after clicking the last link). It uses the `current` setter of Starlight's `<starlight-toc>` element (internal, so recheck after a Starlight upgrade).

## Left sidebar breakpoint
The left sidebar collapses into the burger menu below `60rem` (960px); Starlight's default is `50rem`. Starlight hard-codes `50rem`, so the last media query in `custom.css` reproduces its mobile layout for `50rem`–`59.99rem`. To change the breakpoint, change `59.99rem` there. Between those widths the header keeps the social icons and theme switch, so they do not appear in the menu.

At all burger widths the button is flat and sits on the left of the header; the next media query in `custom.css` sets this, reserves header space for it and pushes the search bar to the right.

The menu opens as a drawer that slides in from the left over a backdrop. The drawer styles are in `custom.css`. The script in `src/components/PageFrame.astro` closes it on an outside click or when focus leaves it; Escape and the burger button close it through Starlight's own script.

## Palette and fonts
Colors and fonts are shared with the KozhaAkhmet.github.io site through the style guide (github.com/KozhaAkhmet/style-guide). They are fetched in the browser when a page renders, not at build time: `src/components/StyleGuide.astro` (rendered at the top of `PageFrame.astro`) adds links to the style guide's `fonts.css`, `tokens.css` and `starlight.css`. A change pushed to the style guide reaches the live site without a rebuild, after the CDN cache expires (up to 12 hours on jsDelivr). `PUBLIC_STYLE_GUIDE_URL` in `.env` overrides the base URL.

Defaults: `src/styles/palette.css` (loaded before `custom.css`) holds the default colors and applies until the style guide's CSS has loaded, or permanently when it cannot be reached. It sets no font, so the default is Starlight's system font. The docs font has its own field, `font.family.docs` in the style guide's `tokens.json` (`--font-family-docs`, mapped to `--sl-font` by `starlight.css`), separate from the personal website's `default`/`special` fonts. Headings have their own field too, `font.family.docs-heading` (`--font-family-docs-heading`), which `starlight.css` applies to `h1`–`h6`. Code has `font.family.docs-code` (`--font-family-docs-code`, mapped to `--sl-font-mono`, which Expressive Code and inline code use). Currently: body and headings Ubuntu Sans, code Ubuntu Sans Mono. A new font also needs its files and `font.faces` entries there; a face may set `unicodeRange` so subset files (latin, latin-ext, cyrillic…) share one family and download only when used. To recolor the site, change `tokens.json` in the style guide; change the four `--brand-*` values in `palette.css` as well so the defaults match. The links must stay inside `<body>`: they have to follow the site's own stylesheets to win over the defaults. `ProjectCard.astro` repeats the brand colors in `data-colors` and does not follow the style guide.

Dark accent = secondary (gold), light accent = primary (blue). Note asides use primary and caution asides use outline (rust). Tip, danger and success keep Starlight's colors.

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

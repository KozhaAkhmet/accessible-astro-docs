# Writing, MDX and code conventions

## Prose
- Sentence-case headings (`## When to use`).
- Start body headings at `##`; do not skip levels.
- `Aside` usage: `tip` = best practice, `caution` = accessibility pitfall / breaking risk, `note` = context, `danger` = data loss / security.
- Internal links root-relative: `[Button](/components/button#animated-buttons)`.
- Images: `public/x.png` → `/x.png`; `src/assets/x.png` → import for optimization.

## MDX pitfalls
- Comments: `{/* ... */}`. `<!-- -->` breaks the build.
- Bare `<` or `{` in prose breaks parsing → backticks or `&lt;` / `&#123;`.
- Blank lines around markdown inside JSX blocks (e.g. tables inside `<div class="props-wrapper">`) when markdown does not render.
- Indent content inside `<Steps>` list items by 3 spaces.
- Name collisions (`Tabs`, `Card`, `Badge` exist in both Starlight and the library) → alias: `import { Tabs as AccessibleTabs } from 'accessible-astro-components'`.
- Imports go directly after frontmatter. Existing pages use `;` on MDX import lines.

## Code style (`.prettierrc`)
No semicolons, single quotes, 2-space indent, printWidth 100, `prettier-plugin-astro` for `.astro`.

CSS: logical properties (`margin-block`, `inline-size`), `light-dark()` or `--sl-*` tokens for colors, wrap motion in `@media (prefers-reduced-motion: no-preference)`, `:where()` for low specificity.

Astro components: typed `interface Props` with JSDoc per prop, destructure `Astro.props` with defaults.

## Git
- Conventional commits: `type(scope): subject`. Types `feat fix docs style refactor test chore`; scope = section or component (`docs(button): add variant examples`).
- Branches: `type/description` (`docs/improve-examples`).

## Pre-finish checklist
- `npm run build` passes.
- New page is in the sidebar.
- Demos are wrapped in `not-content` and keyboard-usable; icon-only controls have labels.
- `npx prettier --write` on touched files.

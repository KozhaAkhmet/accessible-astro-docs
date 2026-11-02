# Starlight built-in components

Import from `@astrojs/starlight/components`. Usage counts are from current pages.

## Aside (~180 uses)
```mdx
<Aside type="tip" title="Optional title">Markdown body.</Aside>
```
`type`: `note` (default) | `tip` | `caution` | `danger`. No-import shorthand: `:::tip[Title]` … `:::`.

## Tabs / TabItem (~35 uses)
```mdx
<Tabs syncKey="pkg">
  <TabItem label="npm" icon="seti:npm">...</TabItem>
  <TabItem label="pnpm">...</TabItem>
</Tabs>
```
`syncKey` syncs all tab groups with the same key. Common pages use labels "Custom CSS" / "Tailwind Classes". Fenced code inside a TabItem must be indented consistently.

## Steps (~17 uses)
```mdx
<Steps>
1. First step
   ```bash
   npm install
   ```
2. Second step
</Steps>
```
Child must be exactly one ordered list; nested content indented 3 spaces.

## FileTree
```mdx
<FileTree>
- src/
  - components/
    - **Button.astro** highlighted, trailing text is a comment
  - …
- astro.config.mjs
</FileTree>
```
Directories end with `/`; `…` = omitted entries.

## Badge
`<Badge text="Yet to be implemented" variant="caution" size="small" />`
`variant`: `default` | `note` | `tip` | `caution` | `danger` | `success`. Not the same as the library `Badge`.

## Card, CardGrid, LinkCard, LinkButton
```mdx
<CardGrid>
  <Card title="Fast" icon="rocket">Text</Card>
</CardGrid>
<LinkCard title="Quick start" href="/getting-started/quick-start/" description="..." />
<LinkButton href="/x/" variant="primary" icon="right-arrow">Go</LinkButton>
```
`icon` here = Starlight's built-in icon names, not astro-icon names.

## Other available
`Code` (programmatic code block), `Icon` (Starlight set), `Kbd`, `Card` variants — see https://starlight.astro.build/components/using-components/.

## Code blocks (Expressive Code, no import)
````mdx
```astro title="src/pages/index.astro" {3} ins={5} del={6}
```
````
- `title="file"` → tab header; `frame="terminal"` / `frame="none"`.
- `{2,4-6}` highlight, `ins={..}` / `del={..}` diff marks, `"text"` highlights a string.
- Languages used: `astro`, `bash`, `css`, `typescript`, `js`, `mdx`.
- Showing a block that itself contains ``` → outer fence with 4 backticks.

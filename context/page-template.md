# Component page skeleton

All pages in `src/content/docs/components/` use this section order. Copy it for new component docs; drop sections that do not apply.

````mdx
---
title: Widget
description: A fully accessible widget for ...
---

import { Aside, Tabs, TabItem } from '@astrojs/starlight/components';
import { Widget } from 'accessible-astro-components';

## Introduction
One paragraph: what it is. Optional <Aside type="note">.

## When to use
- Use case bullets

## Quick example
<div class="not-content">
  <Widget />
</div>

## Usage
### Basic
```astro
---
import { Widget } from 'accessible-astro-components'
---
<Widget />
```
### <Variant name>
(one subsection per variant, snippet each)

## Props
<div class="props-wrapper">
| Prop | Type | Default | Description |
|------|------|---------|-------------|
| `size` | `'sm' \| 'md' \| 'lg'` | `'md'` | Size |
| `class` | `string` | `''` | Additional CSS classes |
</div>

## Accessibility
- Semantic element, ARIA, keyboard, reduced motion, screen reader notes

## Styling
<Tabs>
  <TabItem label="Custom CSS">
    `:global(.widget)` in a style block, or `<style is:global>`
  </TabItem>
  <TabItem label="Tailwind Classes">
    `<Widget class="..." />`
  </TabItem>
</Tabs>

## Interactive examples
### <Realistic scenario>
<div class="not-content">...</div>
````

## Rules
- Every component gets a live demo **and** a source snippet.
- Snippets inside the page use the real import path `accessible-astro-components`.
- Multiple sub-components → one `###` props table each (`### Accordion`, `### AccordionItem`).
- Slots → separate table `| Slot | Description |`.
- Complex tables (DataTable) may use raw `<table>` HTML inside `props-wrapper`; escape `{` as `&#123;`.
- Reference example: `src/content/docs/components/badge.mdx`.

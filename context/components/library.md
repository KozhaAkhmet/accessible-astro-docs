# accessible-astro-components (live demos)

Package: `accessible-astro-components` ^5.8. Import by name: `import { Badge } from 'accessible-astro-components';`.
Full prop tables: `src/content/docs/components/<kebab-name>.mdx` (`## Props`). Read that file before documenting or changing a component.

## Demo pattern (mandatory)
```mdx
<div class="not-content">
  <div style="display: flex; gap: 1rem; flex-wrap: wrap; align-items: center;">
    <Badge type="success">Success</Badge>
  </div>
</div>
```
Without `not-content`, Starlight prose styles alter the component.

## Cheat sheet
All accept `class`. `*` = required.

| Component(s) | Doc page | Key props |
|---|---|---|
| `Accordion`, `AccordionItem` | accordion | item: `title`*, `name` (same name = exclusive), `open`, `variant: default\|chevron`, `headingLevel`, `headingSize` |
| `Avatar`, `AvatarGroup` | avatar | `img`, `initials`, `type`, `shape: round\|square`, `size: sm\|md\|lg\|string`, `title`, `subtitle`, `label`; group: `display: condensed\|grid`, `gridItemsSize`, `gridGap`, `overlapAmount` |
| `Badge` | badge | `type: default\|info\|success\|warning\|error`, `size`, `isPill`, `isCircular`, `isButton`, `animateOnHover`, `animationType: rotate\|boop\|bouncing\|none`, `animationIntensity`, `pulse`, `label` |
| `Breadcrumbs`, `BreadcrumbsItem` | breadcrumbs | `ariaLabel`; item: `href`, `label`, `currentPage`, `hasIcon` |
| `Button` | button | `htmlType: button\|submit\|reset`, `variant: filled\|outlined`, `type: default\|primary\|secondary\|info\|success\|warning\|error`, `size`, `disabled`, `animateOnHover`, `animationType` (+`nudge`), `animationIntensity`, `pulse`, `ariaLabel`, `ariaDescribedby`, `id` |
| `Card` | card | `url`, `img`, `imageComponent`, `imageAlt`, `width`, `height`, `inferSize`, `title`, `headingLevel`, `headingSize`, `footer`, `fullHeight` |
| `DarkMode` | dark-mode | `initialMode: light\|dark\|auto`, `label`; slots `light`, `dark`; persists in localStorage |
| `HighContrast` | high-contrast | `label`; slots `off`, `on` |
| `ReducedMotion` | reduced-motion | `initialMode: on\|off\|auto`, `label`; slots `off`, `on` |
| `DataTable`, `DataTableHeader`, `DataTableColumn`, `DataTableBody`, `DataTableRow`, `DataTableCell`, `DataTableSearch`, `DataTableInfo`, `DataTablePagination` | data-table | table: `caption`*, `id`, `captionHidden`, `pageSize`, `initialPage`, `labels`; column: `sortable`, `sorted`, `numeric`, `sortKey`, `width`; cell: `as: td\|th`, `scope`, `numeric`, `sortValue`, `filterable`; search: `label`, `showLabel`, `placeholder`; info: `start`*, `end`*, `total`*, `template`; pagination: `client`, `baseUrl`, `pageTemplate` |
| `Drawer` | drawer | `triggerId`*, `title`*, `position: right\|left\|top\|bottom`, `closeText`, `headingSize`, `showFooter`; slot `footer` |
| `Modal` | modal | `triggerId`*, `title`*, `headingSize`, `closeText`, `closeIcon`; native `<dialog>` |
| `Form`, `Input`, `Textarea`, `Checkbox`, `Radio`, `Fieldset` | forms | form: `action`, `method`, `name`, `errorSummaryMessage`; input: `name`*, `label`*, `type: text\|email\|password\|tel\|url`, `required`, `requiredText`, `*ValidationMessage`, `data-validation-pattern`, `data-validation-fn`; fieldset: `name`*, `legend`*, `required`, `variant: default\|minimal`. Submit via `<Button htmlType="submit">` |
| `Switch` | switch | `name`*, `label`*, `id`, `value`, `checked`, `disabled`; native checkbox, no JS |
| `Heading` | heading | `level: h1–h6` (semantic), `size: h1–h6` (visual, default = level) |
| `Link` | link | `href`*, `isExternal`, `hideIcon`, `isButton` + Button style props (`type` adds `ghost`), `ariaLabel`, `title`, `rel` |
| `Media` | media | `src`, `alt`, `ratio: 1:1\|4:3\|16:9\|21:9\|auto`, `loading`, `decoding`, `fetchpriority` |
| `Video` | video | `src`*, `title`*, `ratio`, `loading`; responsive iframe |
| `Notification` | notification | `type`, `variant: default\|accent`, `element: div\|aside`, `role: none\|alert\|log\|marquee\|status\|timer\|region`, `message` |
| `Pagination` | pagination | `firstPage`/`previousPage`/`nextPage`/`lastPage` (falsy = disabled), `currentPage`, `totalPages`, `ariaLabel`, `*PageLabel`, `renderProgress`, `renderPageLabel` |
| `SkipLink` | skip-link | `text`, `target` (default `#main-content`) |
| `Tabs`, `TabsList`, `TabsTab`, `TabsPanel` | tabs | tab: `id`*, `controls`* (= panel id), `selected`; panel: `id`*, `labelledby`* (= tab id), `selected` |
| `Toast`, `ToastProvider` | toast | provider: `position`, `duration`, `maxToasts`, `ariaLabel`, `zIndex`, `portal`; see below |
| `Tooltip` | tooltip | `id`*, `position: top\|bottom\|left\|right`, `offset`, `triggerLabel`, `showIcon`; Popover API + CSS anchor positioning |
| `Launcher*` | launcher | separate package `accessible-astro-launcher`, **not installed**; page shows code only, do not import |

## Name collisions with Starlight
`Tabs`, `Card`, `Badge` exist in both. When both are needed, alias the library one (`Tabs as AccessibleTabs`).

## ID-linked components
`Modal`/`Drawer` open from the element whose `id` equals `triggerId`; `Tabs` pair `controls`↔`id`↔`labelledby`. IDs must be unique per page.

## Toasts
`ToastProvider position="bottom-right"` is already mounted globally in `src/components/PageFrame.astro`. Do not add another.
Trigger from MDX without scripts (handler in `src/components/Head.astro`):
```mdx
<button data-toast-demo="success" data-toast-message="Saved!">Show toast</button>
```
`data-toast-demo`: `success` | `error` | `info` | `warning` | `default` | `persistent` | `dismiss-all`. Add a new value by extending the `switch` in `Head.astro`.

JS API: `window.toast?.success(msg, ms?)`, `.error`, `.info`, `.warning`, `.show({ message, type, duration })` (returns id; `duration: 0` = persistent), `.dismiss(id, immediate?)`, `.dismissAll()`.

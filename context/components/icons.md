# Icons

## In `.mdx` / `.astro`
```mdx
import { Icon } from 'astro-icon/components';

<Icon name="ion:notifications" size="1.5rem" />
```
- Installed sets only: `ion:*` (Ionicons), `mdi:*` (Material Design Icons). Any other prefix fails the build.
- Common names in this repo: `ion:notifications`, `ion:mail`, `ion:chatbubble`, `ion:refresh`, `ion:checkmark`, `ion:checkmark-circle`, `ion:information-circle`, `ion:trash`, `mdi:github`, `mdi:linkedin`, `mdi:link`, `mdi:star`, `mdi:source-fork`.
- Lookup: https://icon-sets.iconify.design/ion/ and /mdi/.
- Decorative icons: no label needed. Icon-only controls: add `aria-label` / `label` prop or `<span class="sr-only">`.

## In `.vue`
```vue
import { Icon } from '@iconify/vue'
<Icon icon="mdi:star" :width="24" />
```

## Starlight `icon` props
`Card`, `LinkButton`, `TabItem`, hero `actions` take Starlight icon names (`rocket`, `right-arrow`, `external`, `seti:github`, `blueSky`, `openCollective`), not astro-icon names.

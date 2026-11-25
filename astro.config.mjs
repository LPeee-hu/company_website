// astro.config.mjs
// @ts-check
import { defineConfig } from 'astro/config';

export default defineConfig({
  site: 'https://lpwave.hu',
  trailingSlash: 'always',
  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'hu'],
    routing: { prefixDefaultLocale: false },
  },
});

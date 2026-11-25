// src/i18n/ui.ts
export const locales = ['en', 'hu'] as const;
export type Locale = (typeof locales)[number];

export const ui = {
  en: {
    'nav.products': 'Products',
    'nav.contact': 'Contact',
    'hero.line1': 'We build',
    'hero.line2': 'digital',
    'hero.line3': 'products.',
    'hero.sub': 'Applications designed for everyday life.',
    'hero.cta': 'Explore products',
    'contact.label': 'Contact',
    'contact.title': 'Let’s talk.',
    'contact.text': 'Questions, feedback or an idea? Write to us – we reply to every message.',
    'meta.title': 'LP Wave – We build digital products',
    'meta.desc': 'LP Wave is an independent software studio. Makers of MyRate and Zumi.',
  },
  hu: {
    'nav.products': 'Termékek',
    'nav.contact': 'Kapcsolat',
    'hero.line1': 'Digitális',
    'hero.line2': 'termékeket',
    'hero.line3': 'építünk.',
    'hero.sub': 'Alkalmazások, amelyeket a mindennapokra tervezünk.',
    'hero.cta': 'Termékek megtekintése',
    'contact.label': 'Kapcsolat',
    'contact.title': 'Beszéljünk.',
    'contact.text': 'Kérdésed, visszajelzésed vagy ötleted van? Írj nekünk – minden levélre válaszolunk.',
    'meta.title': 'LP Wave – Digitális termékeket építünk',
    'meta.desc': 'Az LP Wave független szoftverstúdió. A MyRate és a Zumi készítője.',
  },
} as const;

export const t = (l: Locale) => (k: keyof (typeof ui)['en']) => ui[l][k];
export const href = (l: Locale, path = '') => (l === 'en' ? `/${path}` : `/hu/${path}`);

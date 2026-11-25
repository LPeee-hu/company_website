// src/data/products.ts – termékadatok; új termék = új bejegyzés, a UI nem változik
import type { Locale } from '../i18n/ui';

type L10n = Record<Locale, string>;

export interface Product {
  id: 'myrate' | 'zumi';
  name: string;
  accent: string; // csak apró jelölő
  tagline: L10n;
  desc: L10n;
  platforms: string[];
  // 'screenshots': valódi képek src/assets/<id>/<locale>/NN.webp; 'wordmark': kép nélküli, tipográfiai blokk
  visual: 'screenshots' | 'wordmark';
  web?: string; // webes app címe, ha van
  detail?: boolean; // van-e saját projektoldala
  shots?: number[]; // melyik képek látszanak a főoldalon
}

export const products: Product[] = [
  {
    id: 'myrate',
    name: 'MyRate',
    accent: '#3867ff',
    tagline: {
      en: 'Your money, every journey.',
      hu: 'A pénzed, minden úton.',
    },
    desc: {
      en: 'Instant currency conversion, expense logging with GPS & photos, trip budget tracking, and a rate calculator to see what you actually got at the exchange office.',
      hu: 'Azonnali devizakonverzió, kiadásnapló GPS-szel és fotóval, utazási büdzsé követés, és bukó-kalkulátor a ténylegesen kapott árfolyamhoz.',
    },
    platforms: ['iOS', 'Android'],
    visual: 'screenshots',
    detail: true,
    shots: [1, 6, 10],
  },
  {
    id: 'zumi',
    name: 'Zumi',
    accent: '#ff7a3d',
    tagline: {
      en: 'The operating system for modern families.',
      hu: 'Az operációs rendszer modern családoknak.',
    },
    desc: {
      en: 'Zumi unifies chores, finances, and schedules into one simple, playful interface.',
      hu: 'A Zumi egy helyen egyesíti a házi teendőket, a kiadásokat és a naptárakat – egyszerű, játékos felületen.',
    },
    platforms: ['iOS', 'Android', 'Web'],
    visual: 'wordmark',
    web: '/zumi/app/',
    detail: true,
  },
];

export const productsUi = {
  en: { title: 'Digital Products', sub: 'Applications designed to be useful, simple and enjoyable.', explore: 'Details', placeholder: 'Screenshot coming soon', web: 'Try it on the web' },
  hu: { title: 'Digitális termékek', sub: 'Hasznos, egyszerű és élvezetes alkalmazások.', explore: 'Részletek', placeholder: 'Képernyőkép hamarosan', web: 'Kipróbálom a weben' },
} as const;

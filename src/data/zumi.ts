// src/data/zumi.ts – a Zumi projektoldal tartalma (kép nélküli változat)
// Forrás: task_2 modulok (lib/features), ADR 0002 (árazás). Csak meglévő funkció szerepelhet.
import type { Locale } from '../i18n/ui';

type L10n = Record<Locale, string>;

export interface TextProject {
  id: string;
  name: string;
  accent: string;
  tagline: L10n;
  intro: L10n;
  platforms: string[];
  web: string;
  modules: { title: L10n; desc: L10n }[];
  pricing: { title: L10n; desc: L10n }[];
}

export const zumi: TextProject = {
  id: 'zumi',
  name: 'Zumi',
  accent: '#ff7a3d',
  tagline: {
    en: 'The operating system for modern families.',
    hu: 'Az operációs rendszer modern családoknak.',
  },
  intro: {
    en: 'Tasks, calendar, money and shopping in one shared space – so everyone in the family sees the same picture.',
    hu: 'Feladatok, naptár, pénzügyek és bevásárlás egy közös helyen – hogy a családban mindenki ugyanazt lássa.',
  },
  platforms: ['iOS', 'Android', 'Web'],
  web: '/zumi/app/',
  modules: [
    {
      title: { en: 'Tasks', hu: 'Feladatok' },
      desc: {
        en: 'Assign chores, split them into steps and set them to repeat. Everyone knows what’s theirs.',
        hu: 'Kioszthatod a teendőket, lépésekre bonthatod és ismétlődővé teheted. Mindenki tudja, mi az övé.',
      },
    },
    {
      title: { en: 'Calendar', hu: 'Naptár' },
      desc: {
        en: 'A shared family calendar with events and countdowns you can share with a link.',
        hu: 'Közös családi naptár eseményekkel és linkkel megosztható visszaszámlálókkal.',
      },
    },
    {
      title: { en: 'Finances', hu: 'Pénzügyek' },
      desc: {
        en: 'Shared expenses, recurring items and savings goals – the family budget at a glance.',
        hu: 'Közös kiadások, ismétlődő tételek és megtakarítási célok – a családi büdzsé egy pillantásra.',
      },
    },
    {
      title: { en: 'Shopping list', hu: 'Bevásárlólista' },
      desc: {
        en: 'One list for the whole family, updated in real time while you shop.',
        hu: 'Egy lista az egész családnak, ami vásárlás közben is valós időben frissül.',
      },
    },
    {
      title: { en: 'Contacts', hu: 'Névjegyek' },
      desc: {
        en: 'The family phone book: the numbers everyone needs, in one place.',
        hu: 'A család telefonkönyve: a mindenkinek fontos számok egy helyen.',
      },
    },
    {
      title: { en: 'Notifications & widgets', hu: 'Értesítések és widgetek' },
      desc: {
        en: 'Reminders when something is due, and home-screen widgets for the day ahead.',
        hu: 'Emlékeztető, ha valami esedékes, és kezdőképernyő-widgetek a napodhoz.',
      },
    },
  ],
  pricing: [
    {
      title: { en: '30-day free trial', hu: '30 napos ingyenes próba' },
      desc: { en: 'Every feature, from day one.', hu: 'Minden funkció, az első naptól.' },
    },
    {
      title: { en: 'One family subscription', hu: 'Egy családi előfizetés' },
      desc: {
        en: 'Monthly or yearly. One payer, the whole family included.',
        hu: 'Havi vagy éves. Egy fizető, az egész család benne van.',
      },
    },
  ],
};

// src/data/project.ts – a projektoldal adatmodellje; minden termék ezt tölti ki
import type { Locale } from '../i18n/ui';

export type L10n = Record<Locale, string>;
export type L10nPair = Record<Locale, [string, string]>;

export interface Feature { title: L10n; desc: L10n; shot: number }
export interface PlanRow { label: L10n; free: L10n; pro: L10n }

export interface ProjectData {
  id: string; // = URL szegmens és src/assets/<id>/<locale>/NN.webp mappa
  name: string;
  accent: string;
  tagline: L10n;
  intro: L10n;
  heroShots: number[];
  shotCount: number; // a galériában szereplő képernyők száma (1..n)
  idea: L10n;
  problem: L10n;
  solution: L10n;
  features: Feature[];
  steps: L10nPair[];
  tech: string[];
  extras: Record<Locale, string[]>;
  platforms: string[];
  plans?: { rows: PlanRow[] }; // csak ott, ahol van Free/Pro bontás
}

export const projectUi = {
  en: {
    back: 'Products', idea: 'The idea', problem: 'The problem', solution: 'The solution',
    features: 'Key features', how: 'How it works', screens: 'Screenshots', built: 'Built with',
    available: 'Availability', free: 'Free', pro: 'Pro', plansNote: 'Start for free. Unlock everything with a one-time purchase.',
    soon: 'Store links coming soon', next: 'Next project', also: 'Also included', privacy: 'Privacy policy',
  },
  hu: {
    back: 'Termékek', idea: 'Az ötlet', problem: 'A probléma', solution: 'A megoldás',
    features: 'Fő funkciók', how: 'Hogyan működik', screens: 'Képernyők', built: 'Ezzel készült',
    available: 'Elérhetőség', free: 'Ingyenes', pro: 'Pro', plansNote: 'Kezdd ingyenesen. Mindent feloldasz egyetlen vásárlással.',
    soon: 'Áruházi linkek hamarosan', next: 'Következő projekt', also: 'Továbbá', privacy: 'Adatvédelmi irányelvek',
  },
} as const;

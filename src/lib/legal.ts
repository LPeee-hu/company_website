// src/lib/legal.ts – jogi dokumentumok feloldása a src/content/legal/<scope>/<doc>.<locale>.md fájlokból
// scope: 'studio' (LP Wave: /privacy/) vagy egy projekt id (/myrate/privacy/)
import type { Locale } from '../i18n/ui';

export type LegalDoc = 'privacy' | 'terms' | 'legal' | 'delete-account';

interface Entry { scope: string; doc: string; locale: Locale; mod: any }

const files = import.meta.glob('../content/legal/*/*.*.md', { eager: true });

const entries: Entry[] = Object.entries(files).map(([path, mod]) => {
  const m = path.match(/legal\/([^/]+)\/([^.]+)\.([a-z]{2})\.md$/)!;
  return { scope: m[1], doc: m[2], locale: m[3] as Locale, mod };
});

/** Egy dokumentum az adott nyelven; ha nincs, az angol (fallback = true). */
export function findLegal(scope: string, doc: string, locale: Locale) {
  const exact = entries.find((e) => e.scope === scope && e.doc === doc && e.locale === locale);
  if (exact) return { ...exact, fallback: false };
  const en = entries.find((e) => e.scope === scope && e.doc === doc && e.locale === 'en');
  return en ? { ...en, fallback: true } : undefined;
}

/** Az összes (scope, doc) pár – mindkét nyelven legenerálandó. */
export const legalPairs = [...new Set(entries.map((e) => `${e.scope}/${e.doc}`))].map((k) => {
  const [scope, doc] = k.split('/');
  return { scope, doc };
});

export const legalPath = (scope: string, doc: string) => (scope === 'studio' ? `${doc}/` : `${scope}/${doc}/`);

/** A scope-hoz tartozó dokumentumok (lábléc-linkekhez). */
export const docsOf = (scope: string) => legalPairs.filter((p) => p.scope === scope).map((p) => p.doc);

export const docLabel: Record<Locale, Record<string, string>> = {
  en: { privacy: 'Privacy Policy', terms: 'Terms of Use', legal: 'Legal notice', 'delete-account': 'Delete account' },
  hu: { privacy: 'Adatvédelem', terms: 'Felhasználási feltételek', legal: 'Impresszum', 'delete-account': 'Fiók törlése' },
};

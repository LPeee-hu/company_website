// src/lib/shots.ts – screenshot feloldás termék + nyelv + sorszám alapján
import type { Locale } from '../i18n/ui';

const all = import.meta.glob<{ default: ImageMetadata }>('../assets/*/*/*.webp', { eager: true });

export const shot = (id: string, locale: Locale, n: number) =>
  all[`../assets/${id}/${locale}/${String(n).padStart(2, '0')}.webp`]?.default;

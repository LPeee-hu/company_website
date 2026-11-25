# Nyitóoldal újratervezés – megvalósítási terv (B változat)

Státusz: **elhalasztva** (2026-10-15). Kód még nem módosult.

## Döntések

- Választott terv: **B – fehér, több effekt**.
  Vászon: https://claude.ai/artifact/3VH5ExEj43PSP22AJSYTkM (artboard: `MainLightFx.dc.html`).
- Hosting: GitHub Pages (ingyenes), domain: `lpwave.hu`. A régi oldal repóját erre cseréljük.
- A termékszekció (MyRate, Zumi) a `/apps` aloldalra költözik, a nyitóoldalon csak az irányok maradnak.
- Készüljenek egyszerű aloldalak: `/apps`, `/games`, `/custom`.
- Új csomag mehet: `@fontsource-variable/jetbrains-mono`.
- A játék és az egyedi fejlesztés részhez mintatartalom mehet, jelölve.

## Színek (B)

| Irány | Kitöltés | Szöveg fehéren |
|---|---|---|
| Appok | `#3867FF` | `#3867FF` |
| Játékok | `#E2601A` | `#C2520F` |
| Egyedi fejlesztés | `#0E9A72` | `#0B7F5F` |

Szöveg `#0E1116`, másodlagos szöveg `#5B6270`, keret `#E6E8EC`, háttér `#FFFFFF` / `#F7F8FA`.

## Lépések

1. **Alapok és navigáció**
   - `src/styles/tokens.css`: fehér háttér, irányszínek tokenként, nagyobb térközök
     (hat a jogi oldalakra és a MyRate projektoldalra is – csak szín/térköz).
   - `@fontsource-variable/jetbrains-mono` telepítése, betöltés a `src/layouts/Base.astro`-ban.
   - `src/components/Nav.astro`: logójel; linkek `/apps/`, `/games/`, `/custom/`, `#contact`
     (megszűnnek a `#products`, `#about` horgonyok).
   - `src/i18n/ui.ts`: új HU/EN kulcsok.
2. **Hero** – új `HomeHero.astro`: pasztell fényfoltok, kurzort követő fény, váltakozó szó
   (appokat / játékokat / egyedi szoftvert), logó körül keringő ikonok. Kis vanilla JS.
3. **Irányválasztó** – új `Directions.astro` + `src/data/directions.ts` (HU/EN);
   egeret követő 3D dőlés kis scripttel.
4. **Többi szekció** – technológia-szalag, „Hogyan dolgozunk”, kapcsolatfelvétel;
   `Wave.astro` → szaggatott, mozgó hullám (a projektoldalon is változik);
   `Footer.astro` új stílus, jogi linkek maradnak.
5. **/apps aloldal** – a mostani termékszekció (`ProductBlock`, MyRate-képek) ide költözik
   HU/EN-ben; csak ekkor kerül le a nyitóoldalról.
6. **/games és /custom aloldal** – egyszerű, fehér, B-stílusú oldalak; játékoknál jelölt mintatartalom.

## Megjegyzés

A görgetésre beúszó elemekhez a tervben szereplő `animation-timeline` helyett a
`Base.astro` meglévő `.reveal` + IntersectionObserver megoldását használjuk
(minden böngészőben működik).

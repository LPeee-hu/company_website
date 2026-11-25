// src/data/myrate.ts – MyRate projektoldal tartalma (piszkozat, a végleges copy még nyitott)
import type { ProjectData } from './project';

export const myrate: ProjectData = {
  id: 'myrate',
  name: 'MyRate',
  accent: '#3867ff',
  tagline: { en: 'Your money, every journey.', hu: 'A pénzed, minden úton.' },
  intro: {
    en: 'MyRate is your travel finance companion. Convert currencies instantly, log every expense with a tap, and track your trip budget – so you always know exactly where your money goes.',
    hu: 'A MyRate az utazás pénzügyi kísérője. Konvertálj devizát azonnal, naplózd a kiadásokat egy érintéssel, és kövesd az utazási büdzsét – hogy mindig tudd, hova megy a pénzed.',
  },
  heroShots: [1, 7, 10],
  shotCount: 10,
  idea: {
    en: 'Abroad, the same questions keep coming back: how much is that really, and what have I spent so far? MyRate answers both in the same place.',
    hu: 'Külföldön újra és újra ugyanazok a kérdések jönnek: ez valójában mennyi, és eddig mennyit költöttem? A MyRate mindkettőre ugyanazon a helyen válaszol.',
  },
  problem: {
    en: 'Exchange rates, receipts and trip budgets end up scattered across a calculator, a notes app and a spreadsheet. And at the exchange office you rarely learn the rate you actually got.',
    hu: 'Az árfolyamok, számlák és utazási büdzsék szétszóródnak egy számológép, egy jegyzetalkalmazás és egy táblázat között. A pénzváltónál pedig ritkán derül ki, mekkora árfolyamon váltottál valójában.',
  },
  solution: {
    en: 'One app: convert, save the amount to your journal, and see the whole trip against its budget. The rate calculator shows the real rate you got, in percent against your stored one.',
    hu: 'Egyetlen alkalmazás: konvertálsz, a kiadást a naplóba mented, és az egész utazást a büdzséhez mérve látod. A bukó-kalkulátor megmutatja a tényleges árfolyamot, a mentetthez képest százalékban.',
  },
  features: [
    { shot: 1, title: { en: 'Instant converter', hu: 'Azonnali konverzió' }, desc: { en: 'Type any amount and get the result immediately. Switch direction with one tap.', hu: 'Írd be az összeget és azonnal megkapod az eredményt. Egy érintéssel megfordítható az irány.' } },
    { shot: 2, title: { en: 'Rate calculator', hu: 'Bukó-kalkulátor' }, desc: { en: 'Enter what you handed over and what you got back. MyRate calculates the real rate and the difference in percent.', hu: 'Add meg, mennyit adtál be és mennyit kaptál vissza. A MyRate kiszámolja a ténylegesen kapott árfolyamot és az eltérést százalékban.' } },
    { shot: 3, title: { en: 'Expense log', hu: 'Kiadásnapló' }, desc: { en: 'Save an expense in one tap. Add category, note, GPS location and photo. Filter, summarize and export to CSV.', hu: 'Egy érintéssel mentheted a kiadást. Adj hozzá kategóriát, megjegyzést, GPS-helyszínt és fotót. Szűrj, összesíts, exportálj CSV-be.' } },
    { shot: 7, title: { en: 'Trip budget', hu: 'Utazási büdzsé' }, desc: { en: 'Create a trip with destination, dates and budget. Track spending against your plan and see how much is left.', hu: 'Hozz létre utazást célországgal, dátumokkal és büdzsével. Kövesd a költést a tervhez képest, és lásd, mennyi maradt.' } },
    { shot: 8, title: { en: 'Expense map', hu: 'Kiadástérkép' }, desc: { en: 'See all your GPS-tagged expenses on a map. Tap a pin for amount, category and note.', hu: 'Lásd az összes GPS-szel rögzített kiadást a térképen. Koppints egy jelölőre az összeg, kategória és megjegyzés megtekintéséhez.' } },
    { shot: 9, title: { en: 'Group trips', hu: 'Csoportos utazások' }, desc: { en: 'Split expenses between travelers and see who owes whom in a settlement report.', hu: 'Oszd meg a kiadásokat az útitársak között, és az elszámolásban lásd, ki kinek tartozik.' } },
  ],
  steps: [
    { en: ['Convert', 'Enter an amount and see the value in your own currency.'], hu: ['Konvertálj', 'Írd be az összeget, és azonnal látod saját devizádban.'] },
    { en: ['Save', 'Add it to your journal with category, place and a photo.'], hu: ['Mentsd', 'Vedd fel a naplóba kategóriával, helyszínnel és fotóval.'] },
    { en: ['Review', 'Follow the trip against its budget, on the list or on the map.'], hu: ['Kövesd', 'Nézd az utazást a büdzséhez képest, listában vagy térképen.'] },
  ],
  tech: ['Flutter', 'Supabase'],
  extras: { en: ['Home screen widget', 'CSV export'], hu: ['Kezdőképernyő widget', 'CSV export'] },
  platforms: ['iOS', 'Android'],
  plans: {
    rows: [
      { label: { en: 'Saved exchange rates', hu: 'Mentett árfolyamok' }, free: { en: 'up to 2', hu: 'max. 2' }, pro: { en: 'Unlimited', hu: 'Korlátlan' } },
      { label: { en: 'Expense log entries', hu: 'Kiadásbejegyzések' }, free: { en: 'up to 3', hu: 'max. 3' }, pro: { en: 'Unlimited', hu: 'Korlátlan' } },
      { label: { en: 'Trips', hu: 'Utazások' }, free: { en: '1', hu: '1' }, pro: { en: 'Unlimited', hu: 'Korlátlan' } },
    ],
  },
};

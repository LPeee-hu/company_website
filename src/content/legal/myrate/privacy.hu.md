---
title: "Adatvédelmi tájékoztató – MyRate"
updated: "Hatályos: 2026. október 3."
todo: "PISZKOZAT – a kódból kiolvasott tények alapján (lásd docs/legal-sources.md). Élesítés előtt: adatkezelő azonosítása (impresszum), jogász általi átnézés, Supabase DPA/adattovábbítás ellenőrzése, gyermekkorhatár megerősítése, kapcsolati e-mail csere."
---

*MyRate: Utazási devizaváltó és kiadáskövetés*

## 1. Ki az adatkezelő?

A MyRate-et az LP Wave üzemelteti (adatkezelő, „mi”). Elérhetőség: [support@lpwave.hu](mailto:support@lpwave.hu). A szolgáltató teljes adatai az [impresszumban](/hu/legal/) találhatók.

> Röviden: a MyRate használatához fiók kell. Amit beírsz, az nagyrészt az eszközödön marad. A szervereinken csak akkor tároljuk, ha felhőszinkront (előfizetőknek) vagy csoportos utazást használsz. Nincs reklám, nincs analitikai SDK, és soha nem adjuk el az adataidat.

## 2. Mit kezelünk, és miért?

**Fiók.** E-mail-cím és jelszó (vagy Google / Apple belépés), megjelenített név, opcionális profilkép, valamint a csomagod (Ingyenes, Lifetime, Előfizetés). A fiók működtetéséhez szükséges (GDPR 6. cikk (1) b)).

**Utazási adataid.** Árfolyamok, kiadások (összeg, deviza, dátum, kategória, megjegyzés), utazások és büdzsék, beállítások. Opcionálisan **GPS-helyszín** (csak ha engedélyezed, és csak a kiadás mentésének pillanatában), valamint a kiadáshoz csatolt **fotók**. Alapértelmezetten ezek csak az eszközödön vannak.

**Felhőszinkron (csak előfizetőknek).** Aktív előfizetés esetén az utazásaid, kiadásaid, árfolyamaid, beállításaid, fotóid és az utazások borítóképei szinkronizálódnak a szerverünkre, hogy több eszközön is elérd őket. Előfizetés nélkül semmi nem szinkronizálódik.

**Csoportos utazások.** Ha csoportos utazást hozol létre vagy csatlakozol egyhez, a csoport adatai megoszlanak a tagok között: nevek, kiadások és azok megosztása, elszámolások, vendégek, a csoportos kiadások helyszíne (ha rögzítetted), tevékenységnapló és az alkalmazáson belüli értesítések. A többi tag látja, amit a csoportban rögzítesz. A csatlakozási kérelmeket a szervező hagyja jóvá. Tartalmat jelenthetsz, felhasználót tilthatsz le; a jelentéseket eltároljuk, hogy felülvizsgálhassuk (6. cikk (1) f), a biztonságos szolgáltatáshoz fűződő érdekünk).

**Vásárlások.** A fizetést teljes egészében az Apple vagy a Google kezeli, a kártyaadataidat nem látjuk. Ellenőrző adatokat kapunk (áruház, termék, tranzakció-azonosító, állapot, lejárat), hogy feloldhassuk a csomagodat (6. cikk (1) b)).

**Visszajelzés.** Ha a Beállítások visszajelző űrlapját használod, amit beírsz (és az opcionális e-mail-címed), egy Google Űrlapon keresztül érkezik hozzánk, az alkalmazás verziójával és az eszköz típusával együtt.

## 3. Igénybe vett szolgáltatások

| Szolgáltatás | Mit kap | Miért |
|---|---|---|
| Supabase (adatbázis, hitelesítés, fájltárolás), a projekt Londonban (Egyesült Királyság) fut | A fiók és a 2. pontban leírt adatok | A háttérrendszer üzemeltetése |
| Apple / Google | Belépés, alkalmazáson belüli vásárlás, az eszköz beépített címfeloldása helynevekhez (a koordinátákat az operációs rendszer oldja fel) | Belépés, fizetés, helynevek |
| FreeCurrencyAPI, Frankfurter, Open Exchange Rates | Devizakódok (pl. EUR, HUF) és az IP-címed | Árfolyamok |
| OpenFreeMap, OpenStreetMap | Térképcsempe-kérések (az IP-címed és a megtekintett térképterület) | Térképek megjelenítése |
| Nominatim (OpenStreetMap) | A térképes keresőbe beírt hely- vagy címszöveg és az IP-címed | Helykeresés |
| Google Űrlapok | A beküldött visszajelzés | Visszajelzés |

Ezek a szolgáltatók a saját feltételeik szerint kezelik az adatokat. Az Egyesült Királyságra uniós megfelelőségi határozat vonatkozik, ezért a londoni tárhely ennek hatálya alá esik.

## 4. Mit nem csinálunk?

- Nincs reklám, és nem adunk át adatot hirdetési hálózatoknak
- Nincs analitikai vagy összeomlás-jelentő SDK
- Nem követjük a tartózkodási helyedet a háttérben
- Nem adjuk el a személyes adataidat

## 5. Meddig őrizzük az adatokat?

A fiók és a felhőben tárolt adatok a fiók törléséig maradnak meg. A csak az eszközön lévő adatok addig, amíg törlöd őket vagy eltávolítod az alkalmazást. Az Apple-nél és a Google-nél lévő vásárlási nyilvántartásokra azok saját szabályai vonatkoznak.

## 6. Fiók törlése

A fiókodat az alkalmazásban törölheted. Ez eltávolítja a profilodat, utazásaidat, kiadásaidat, árfolyamaidat, értesítéseidet és vásárlási nyilvántartásodat a szervereinkről. Ha csoportos utazások tagja vagy, a tulajdonjog lehetőség szerint átszáll egy másik aktív tagra; ha nincs ilyen, a csoport megszűnik. A kilépett csoportokban rögzített kiadásaid egy névtelen helyettesítő résztvevő alatt megmaradnak, hogy a többiek elszámolása továbbra is kiegyenlítődjön; ezek már nem köthetők a személyedhez.

## 7. Jogaid

Kérhetsz hozzáférést, helyesbítést, törlést, korlátozást, adathordozhatóságot, és tiltakozhatsz a jogos érdekünkön alapuló kezelés ellen. Fordulj hozzánk a fenti címen. Panasszal élhetsz a Nemzeti Adatvédelmi és Információszabadság Hatóságnál (NAIH, [www.naih.hu](https://www.naih.hu)) vagy a lakóhelyed szerinti felügyeleti hatóságnál.

## 8. Gyermekek

A MyRate nem 16 év alatti gyermekeknek készült.

## 9. Változások

A tájékoztatót frissítjük, ha az alkalmazás változik. A legfrissebb változat dátuma az oldal tetején látható.

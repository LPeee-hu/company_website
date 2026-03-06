# TravelRate – Felhasználói dokumentáció

## Tartalom

1. [Az alkalmazásról](#1-az-alkalmazásról)
2. [Első indítás – Beállítási varázsló](#2-első-indítás--beállítási-varázsló)
3. [Navigáció](#3-navigáció)
4. [Számító képernyő](#4-számító-képernyő)
5. [Napló képernyő](#5-napló-képernyő)
6. [Utazások képernyő](#6-utazások-képernyő)
7. [Térkép képernyő](#7-térkép-képernyő)
8. [Árfolyamok képernyő](#8-árfolyamok-képernyő)
9. [Bukó-kalkulátor](#9-bukó-kalkulátor)
10. [Beállítások](#10-beállítások)
11. [Pro verzió](#11-pro-verzió)
12. [Kezdőképernyő widget](#12-kezdőképernyő-widget)

---

## 1. Az alkalmazásról

A TravelRate egy utazási devizaváltó és kiadásnapló alkalmazás. Fő funkciói:

- Valutakonverzió mentett vagy élő árfolyammal
- Kiadások naplózása kategóriával, helyszínnel és fotóval
- Utazások kezelése büdzsével és statisztikákkal
- Kiadások térképes megtekintése
- Árfolyamok tárolása, archiválása
- Bukó-kalkulátor: a ténylegesen kapott árfolyam kiszámítása

---

## 2. Első indítás – Beállítási varázsló

Az alkalmazás első indításakor egy háromoldalas varázsló vezeti végig a kezdeti beállításokon:

### 1. oldal – Saját deviza kiválasztása

Meg kell adni az otthoni devizát (pl. HUF – forint). Ez az az összeg, amibe végeredményben mindent átváltasz. A deviza kiválasztása után az összes konverzió ehhez viszonyítva jelenik meg.

> **Fontos:** A saját deviza megváltoztatása az összes mentett árfolyamot törli.

### 2. oldal – Céldeviza és árfolyam megadása

Kiválasztod, melyik külföldi devizában szeretnél váltani (pl. EUR). Megadhatsz kézi árfolyamot, vagy üresen hagyva az alkalmazás automatikusan lekéri az aktuális árfolyamot az internetről.

### 3. oldal – Összefoglalás

Az összefoglalón láthatod a beállított saját devizát és az első árfolyampárt. Az „Indulás" gombra kattintva az alkalmazás elindul.

---

## 3. Navigáció

Az alkalmazás alján öt tab található:

| Ikon | Neve | Funkció |
|------|------|---------|
| Számológép | Számító | Valutakonverzió |
| Blokk | Napló | Kiadások listája |
| Bőrönd | Utazások | Utazások kezelése |
| Térkép | Térkép | Kiadások térképen |
| Deviza | Árfolyamok | Árfolyamok kezelése |

---

## 4. Számító képernyő

Ez az alkalmazás főképernyője, ahol a valutaváltás elvégezhető.

### Devizaválasztó

A képernyő tetején egy sáv mutatja az aktív devizapárt (külföldi deviza ↔ saját deviza). Ha több árfolyam van mentve, erre koppintva megjelenik egy lista, amelyből kiválasztható a kívánt devizapár.

### Irányváltás

A két deviza között lévő nyílra koppintva megfordítható a konverzió iránya:
- Normál mód: külföldi devizában adsz meg összeget, és megkapod a saját devizában a megfelelőt.
- Fordított mód: saját devizában adsz meg összeget, és megkapod a külföldi összeget.

### Eredmény megjelenítése

- A beírt összeg és a számított eredmény egy kártyán jelenik meg.
- Ha a beállításokban be van kapcsolva a "mindkettő mutatása" opció, a pontos (nem kerekített) érték is látható az eredmény alatt.

### Numerikus billentyűzet

Az összeget a képernyő alján lévő numerikus billentyűzettel lehet beírni. Egyes devizáknál (ahol nagy névértékű bankjegyekkel fizetnek) ezer-gomb is megjelenik a gyors bevitelhez.

### Mentés a naplóba

A konverzió elvégzése után a „Mentés naplóba" gombra koppintva az összeg elmenthető a kiadásnaplóba. A megjelenő párbeszédablakban:

- **Megjegyzés** – opcionális szöveges leírás
- **Kategória** – egy választható a hat kategória közül (Szállás, Étkezés, Közlekedés, Szórakozás, Vásárlás, Egyéb)
- **Helyszín** – ha a GPS engedélyezett, az alkalmazás automatikusan menti az aktuális helyszínt
- **Fotó** – csatolható fotó a kameráról vagy a galériából

> Ingyenes verzióban legfeljebb 3 kiadás menthető a naplóba.

---

## 5. Napló képernyő

A naplóban az összes elmentett kiadás listázható, szűrhető és exportálható.

### Kiadások listája

Minden kiadás kártyán jelenik meg, amelyen látható:
- Kategória ikonja és színe
- Külföldi összeg és deviza
- Saját devizában mutatott összeg
- Megjegyzés (ha van)
- Dátum
- GPS-koordináta jelzése (ha rögzített)
- Csatolt fotó bélyegképe (ha van)

### Szűrés

A napló szűrhető:
- **Kategória szerint** – az ikonsor bármelyik kategóriájára koppintva
- **Dátum szerint** – előre definiált időszakok: Ma, Ez a hét, Ez a hónap, vagy egyedi tartomány

### Összesítő

A lista tetején a szűrt időszakra vonatkozó összesítő jelenik meg: az összes kiadás saját devizában.

### Kiadás szerkesztése és törlése

Egy kiadásra koppintva megnyílik a szerkesztő párbeszédablak, ahol módosítható a megjegyzés, a kategória, és törölhető a fotó. A kiadás törléséhez hosszan kell rá nyomni, vagy a szerkesztő ablakban a törlés gombot megnyomni.

### Exportálás

A jobb felső sarokban lévő menüből a napló exportálható:
- **CSV** formátumban (táblázatkezelőbe importálható)
- **Fotók exportálása** – a csatolt képek zipbe csomagolva menthetők

### Utazáshoz rendelés

Kiadások hozzárendelhetők egy adott utazáshoz, így az utazás statisztikáiban is megjelennek.

---

## 6. Utazások képernyő

Az utazások képernyőn kezelhetők az utazások adatai és követhető a büdzsé.

### Új utazás létrehozása

A „+" gombra koppintva megnyílik az utazás-szerkesztő, ahol megadható:
- **Utazás neve** – kötelező
- **Célország** – opcionális
- **Kezdő és záró dátum** – kötelező
- **Büdzsé összege és devizája** – opcionális; ha megadják, az alkalmazás kiszámolja a napi keretet

### Utazáskártyák

Minden utazás kártyán jelenik meg, amelyen látható:
- Borítókép (ha van)
- Utazás neve (koppintható – megnyitja a statisztikákat)
- Célország
- Dátumok és napok száma
- Büdzsé és napi keret
- „Aktív" jelvény, ha az aktuális dátum az utazás időszakára esik

### Statisztikák

Az utazás nevére vagy a „Statisztikák" gombra koppintva megnyílik a részletes nézet:
- Az utazáshoz rendelt kiadások listája
- Összesített kiadás saját devizában
- Büdzsé felhasználtsága

### Utazás szerkesztése és törlése

A kártya jobb felső sarkában lévő menüből az utazás szerkeszthető vagy törölhető.

> Ingyenes verzióban legfeljebb 1 utazás hozható létre.

---

## 7. Térkép képernyő

A térkép képernyőn azok a kiadások jelennek meg, amelyekhez GPS-koordináta van mentve.

- Minden kiadást egy jelölő (pin) mutat a térképen.
- A jelölőre koppintva megjelenik a kiadás összege, kategóriája és megjegyzése.
- A térkép szabadon mozgatható és nagyítható.

> A térkép csak akkor tartalmaz adatokat, ha a GPS engedélyezett volt a kiadás mentésekor.

---

## 8. Árfolyamok képernyő

Az árfolyamok képernyőn kezelhetők a mentett devizapárok.

### Saját deviza

A lista tetején mindig a saját deviza kártyája látható. A jobb oldali menüből megváltoztatható a saját deviza – ez azonban törli az összes mentett árfolyamot és visszaállítja a varázslót.

### Aktív árfolyamok

Az aktív árfolyamok a saját deviza kártya alatt listázódnak. Minden árfolyam-elem mutatja:
- A deviza zászlaját és kódját
- „LIVE" jelvényt, ha az árfolyamot az alkalmazás az internetről kérte le
- Az aktuális árfolyamot (1 külföldi egység = X saját deviza)
- Opcionális megjegyzést

Az árfolyamok fogd és vidd mozdulattal átrendezhetők.

### Új árfolyam hozzáadása

A „+ Hozzáad" gombra koppintva megjelenik a devizakereső. A kívánt devizát kiválasztva megadható a kézi árfolyam. Ha a mezőt üresen hagyja, az alkalmazás automatikusan letölti az aktuális árfolyamot.

### Árfolyam frissítése

A fejlécben lévő szinkronizálás ikonra koppintva az összes aktív árfolyam egyszerre frissíthető az internetről.

### Árfolyam műveletek

Minden árfolyam jobb oldali menüjéből:
- **Bukó-kalkulátor** – megnyitja a Bukó-számítót ehhez az árfolyamhoz
- **Szerkesztés** – módosítható az árfolyam értéke és a megjegyzés
- **Archiválás** – az árfolyam inaktívvá válik (nem törlődik, visszaállítható)
- **Törlés** – véglegesen törli az árfolyamot

### Archivált árfolyamok

Az archivált árfolyamok a lista alján egy összecsukható szekcióban jelennek meg. Innen visszaállíthatók aktívvá, vagy véglegesen törölhetők.

> Ingyenes verzióban legfeljebb 2 aktív árfolyam tárolható.

---

## 9. Bukó-kalkulátor

A Bukó-kalkulátor segítségével kiszámítható a ténylegesen kapott árfolyam (pl. pénzváltónál), és összehasonlítható a mentett árfolyammal.

### Megnyitás

Az árfolyam-kártyán a menüből a „Bukó-kalkulátor" pontot kell kiválasztani.

### Használat

1. **Beadtam** mezőbe írja be, mennyi saját devizát adott be (pl. 10 000 HUF).
2. **Kaptam** mezőbe írja be, mennyi külföldi devizát kapott (pl. 25 EUR).
3. Az alkalmazás azonnal kiszámolja a ténylegesen kapott árfolyamot.
4. Ha az árfolyamhoz mentett (nem „live") árfolyam tartozik, az összehasonlítás is megjelenik: hány százalékkal jobb vagy rosszabb az árfolyam a mentett értékhez képest.

### Árfolyam mentése

A „Mentés" gombbal a kiszámított tényleges árfolyam felülírja a mentett értéket. Ez hasznos, ha a pénzváltón kapott árfolyamot szeretné a jövőbeli konverziókhoz használni.

---

## 10. Beállítások

A beállítások képernyő bármely tab fejlécéből elérhető a fogaskerék ikonra koppintva.

### Megjelenítés

| Beállítás | Leírás |
|-----------|--------|
| Színséma | Az alkalmazás vizuális témája választható: Vibráló, Pasztel, Sötét, Világos, Férfias, Nőies, Játékos |
| Nyelv | Az alkalmazás nyelve: rendszer szerinti, vagy manuálisan: Magyar, Angol, Német, Francia, Spanyol, Olasz |
| Kerekítés | Az eredmény kerekítési pontossága: nincs, 10-re, 100-ra, 500-ra |
| Pontos érték mutatása | Ha a kerekítés be van kapcsolva, a pontos (nem kerekített) érték is látható legyen-e az eredmény alatt |

### Napló

| Beállítás | Leírás |
|-----------|--------|
| GPS helymeghatározás | Ha be van kapcsolva, a kiadások mentésekor az alkalmazás rögzíti az aktuális helyszínt |

### Pro

A Pro verzió vásárlása és a korábbi vásárlás visszaállítása itt érhető el. Részletek a [Pro verzió](#11-pro-verzió) fejezetben.

### Veszélyes műveletek

- **Saját deviza megváltoztatása** – az összes mentett árfolyam törlésével visszaállítja a varázslót
- **Napló törlése** – az összes kiadást véglegesen törli

---

## 11. Pro verzió

A Pro verzió egyszeri vásárlással aktiválható az alkalmazáson belül (Beállítások > Pro).

### Ingyenes verzió korlátai

| Funkció | Ingyenes | Pro |
|---------|----------|-----|
| Aktív árfolyamok száma | legfeljebb 2 | korlátlan |
| Kiadások a naplóban | legfeljebb 3 | korlátlan |
| Utazások száma | legfeljebb 1 | korlátlan |

### Vásárlás

A paywall képernyőn a „Pro megvásárlása" gombra koppintva indítható a vásárlási folyamat az appáruházon keresztül.

### Visszaállítás

Ha korábban már megvásárolta a Pro verziót, a „Vásárlás visszaállítása" gombbal újra aktiválható anélkül, hogy újra kellene fizetni.

---

## 12. Kezdőképernyő widget

Az alkalmazás kezdőképernyő widigetet biztosít iOS és Android rendszeren.

### Funkciók

- Megjeleníti az aktuális devizapárt és árfolyamot
- Mutatja az utolsó konverzió eredményét
- Több aktív árfolyam esetén az előző/következő gombokkal lapozható közöttük
- A widgetre koppintva az alkalmazás a Számító képernyőn nyílik meg
- A widgetről közvetlenül indítható a kiadás mentése is

> A widget adatai automatikusan frissülnek minden alkalmazásindításkor és árfolyamváltozáskor.

# Adatvédelmi tájékoztató

**Alkalmazás neve:** TravelRate (MyRate)
**Fejlesztő:** lpwave.hu
**Hatályos:** 2026. március 6.

---

## Bevezetés

Köszönjük, hogy a TravelRate alkalmazást használja. Ez az adatvédelmi tájékoztató átlátható és közérthető módon ismerteti, hogy az alkalmazás milyen adatokat kezel, hogyan és miért.

A legfontosabb tudnivaló egy mondatban: **minden adata kizárólag az Ön eszközén tárolódik. Semmilyen személyes adatot nem gyűjtünk, nem tárolunk szerveren és nem adunk át harmadik félnek.**

---

## Milyen adatokat kezel az alkalmazás?

### Amit Ön ad meg

Az alkalmazás az Ön által bevitt adatokat helyi adatbázisban tárolja az eszközén:

- **Deviza-árfolyamok** – a mentett devizapárok és értékeik, opcionális megjegyzéssel (pl. „Bangkok Airport")
- **Kiadásbejegyzések** – összeg, devizakód, dátum, kategória, opcionális megjegyzés
- **Utazások** – utazás neve, célország, dátumok, tervezett büdzsé
- **Beállítások** – saját deviza, felületnyelv, megjelenítési preferenciák

### Amit az alkalmazás opcionálisan rögzít (csak az Ön jóváhagyásával)

- **GPS-helyszín** – kizárólag akkor, ha a beállításokban engedélyezte, és kizárólag egy kiadás mentésekor, egyszeri alkalommal. Az alkalmazás nem követi folyamatosan a tartózkodási helyét.
- **Fotó** – saját döntése alapján csatolhat képet egy-egy kiadáshoz. A fotók az eszközén maradnak.

---

## Mit nem csinál az alkalmazás?

- Nem gyűjt analitikai adatokat (nincs Firebase, Crashlytics vagy hasonló SDK)
- Nem jelenít meg reklámokat, és nem oszt meg adatot hirdetési hálózatokkal
- Nem követi az Ön viselkedését vagy szokásait
- Nem küld személyes adatot semmilyen szerverre
- Nem szükséges regisztráció vagy fiók létrehozása

---

## Internetkapcsolat – mikor és miért?

Az alkalmazás kizárólag devizaárfolyamok lekéréséhez csatlakozik az internethez. Ilyenkor csak devizakódokat küld (pl. `EUR`, `HUF`) – semmi mást.

Három nyilvános, ingyenes árfolyamszolgáltatót használ egymás után, ha az előző nem elérhető:

- FreeCurrencyAPI (freecurrencyapi.com)
- Frankfurter (frankfurter.app)
- Open Exchange Rates (open.er-api.com)

A lekért árfolyamokat az alkalmazás 24 óráig helyi gyorsítótárban tartja, hogy felesleges lekéréseket elkerüljön.

---

## Vásárlás (Pro verzió)

A Pro verzió az Apple App Store-on vagy a Google Play-en keresztül vásárolható meg. A fizetési folyamatot és a vásárlási adatokat teljes egészében az Apple, illetve a Google kezeli – ezekre a saját adatvédelmi irányelveik vonatkoznak. Az alkalmazás csupán egyetlen jelzőértéket tárol helyi szinten arról, hogy a vásárlás megtörtént-e.

---

## Kezdőképernyő widget

A widget megjelenítéséhez az alkalmazás az eszköz widgetrendszerébe (iOS: App Group, Android: SharedPreferences) szinkronizálja az aktív árfolyamokat és az utolsó konverzió eredményét. Ezek az adatok nem hagyják el az eszközt.

---

## Az Ön jogai

Mivel az adatok kizárólag az eszközén találhatók, Ön teljes körűen rendelkezik felettük:

- **Megtekintés** – az összes adat az alkalmazáson belül látható
- **Exportálás** – a kiadásnapló CSV formátumban exportálható
- **Módosítás** – bármely bejegyzés szerkeszthető az alkalmazásban
- **Törlés** – az egyes bejegyzések, a teljes napló, vagy az összes adat törölhető; a GPS és fotó engedély az eszköz beállításaiban visszavonható
- **Teljes törlés** – az alkalmazás eltávolításával az összes helyi adat törlődik

---

## Gyermekek

Az alkalmazás nem irányul 16 év alatti felhasználóknak, és nem gyűjt tudatosan gyermekektől adatot.

---

## Kapcsolat

Adatvédelemmel kapcsolatos kérdés vagy megkeresés esetén:

**Web:** https://lpwave.hu/myrate/

---

## A tájékoztató módosítása

Ha az alkalmazás adatkezelési gyakorlata megváltozik, a tájékoztató frissül, és az oldal tetején feltüntetjük az új hatályossági dátumot.

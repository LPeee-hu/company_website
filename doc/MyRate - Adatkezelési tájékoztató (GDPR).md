# TravelRate – Adatkezelési tájékoztató

**Hatályos:** 2026. március 6.
**Alkalmazás neve:** TravelRate (MyRate)
**Fejlesztő:** lpwave.hu
**Kapcsolat:** https://lpwave.hu/myrate/
**Adatvédelmi oldal:** https://lpwave.hu/myrate/privacy/

---

## 1. Bevezető

Ez a tájékoztató ismerteti, hogy a TravelRate alkalmazás milyen adatokat kezel, azokat hol tárolja, milyen célból használja, és milyen jogok illetik meg a felhasználót az Európai Unió általános adatvédelmi rendeletének (GDPR – 2016/679/EU rendelet) megfelelően.

A tájékoztató kizárólag a forráskód alapján, az alkalmazás tényleges működéséből lett összeállítva.

---

## 2. Az adatkezelő

| | |
|--|--|
| **Neve** | lpwave.hu |
| **Weboldala** | https://lpwave.hu/myrate/ |
| **Adatvédelmi kapcsolat** | https://lpwave.hu/myrate/privacy/ |

---

## 3. Az alkalmazás adatkezelési alapelvei

- **Helyi tárolás elve:** Az összes személyes jellegű adat kizárólag a felhasználó eszközén kerül tárolásra. Semmilyen személyes adat nem kerül az alkalmazás fejlesztőjének szerverére.
- **Adatminimalizálás:** Az alkalmazás csak a működéséhez feltétlenül szükséges adatokat kezeli.
- **Felhasználói kontroll:** A felhasználó az alkalmazáson belül teljes körűen törölheti adatait.
- **Nincs nyomkövetés:** Az alkalmazás nem tartalmaz analitikai, hirdetési vagy felhasználói viselkedést nyomkövető komponenst.

---

## 4. Kezelt adatok és azok célja

### 4.1 Alkalmazásbeállítások

**Tárolás helye:** Eszközön lévő helyi adatbázis (Isar)
**Törlés:** Alkalmazás eltávolításakor automatikusan; vagy saját deviza megváltoztatásakor részlegesen

| Adat | Cél |
|------|-----|
| Saját deviza (pl. HUF) | Az összes konverzió alapdevizájának meghatározása |
| Felhasználói felület nyelve | Az alkalmazás megjelenítési nyelvének beállítása |
| Kerekítési mód | Eredmény megjelenítési pontosságának beállítása |
| Utolsó használt devizapár azonosítója | Gyors visszatérés az utolsó konverzióhoz |
| Onboarding elvégzettségi jelzője | Az első indítás varázsló megjelenítésének vezérlése |
| GPS engedély kapcsoló | Helyszínalapú kiadásrögzítés be/kikapcsolása |
| Fotó méretkorlát beállítás | Csatolt képek tömörítési szintjének meghatározása |
| Színtéma beállítás | Az alkalmazás vizuális megjelenésének tárolása |

**Jogalap:** Az érintett hozzájárulása (az alkalmazás telepítésével és használatával); az adatkezelés az alkalmazás rendeltetésszerű működéséhez szükséges.

---

### 4.2 Deviza-árfolyamok

**Tárolás helye:** Eszközön lévő helyi adatbázis (Isar)
**Törlés:** Felhasználó általi törlés; saját deviza megváltoztatásakor teljes törlés; alkalmazás eltávolításakor automatikusan

| Adat | Cél |
|------|-----|
| Külföldi devizakód (pl. EUR) | Konverzió elvégzéséhez |
| Árfolyam értéke | Konverzió elvégzéséhez |
| Árfolyam típusa (kézi/live) | A forrás megkülönböztetéséhez |
| Opcionális megjegyzés (pl. "Budapest Airport") | Felhasználói azonosítás céljából |
| Aktív/archivált állapot | Az árfolyam láthatóságának kezeléséhez |
| Megjelenítési sorrend | A lista sorrendjének tárolásához |
| Létrehozás és módosítás dátuma | Felhasználói tájékoztatáshoz |

Ezek az adatok nem személyes adatok a GDPR értelmében, azonban a felhasználó által bevitt megjegyzés személyes jellegű lehet (pl. helyszínnév).

---

### 4.3 Kiadásnapló

**Tárolás helye:** Eszközön lévő helyi adatbázis (Isar); fotók az eszköz dokumentum könyvtárában
**Törlés:** Felhasználó általi törlés (tételenként vagy az egész napló egyszerre); alkalmazás eltávolításakor automatikusan

| Adat | Cél | Személyes adat? |
|------|-----|----------------|
| Tranzakció dátuma és időpontja | Naplózáshoz és szűréshez | Nem |
| Külföldi és saját devizaösszeg | Pénzügyi nyilvántartáshoz | Nem |
| Devizakódok | Konverzióhoz | Nem |
| Alkalmazott árfolyam | Utólagos ellenőrzéshez | Nem |
| Megjegyzés | Felhasználó által megadott szöveges leírás | Igen (opcionális) |
| Kategória (pl. Étkezés, Szállás) | Szűréshez és statisztikához | Nem |
| GPS szélességi és hosszúsági fok | Helyszínalapú térképes megjelenítéshez | Igen (opcionális) |
| Fotó elérési útja | Számla vagy bizonyíték csatolásához | Igen (opcionális) |
| Utazás-azonosító | Utazáshoz rendeléshez | Nem |

**GPS adatgyűjtés részletei:**
- A helymeghatározás kizárólag a felhasználó által, a kiadás mentésekor, egyetlen alkalommal aktiválódik.
- Az alkalmazás nem gyűjt folyamatos tartózkodási helyadatot.
- A GPS lekérdezés csak akkor fut, ha a GPS engedélyezve van a beállításokban.
- A helymeghatározáshoz az operációs rendszer engedélye szükséges; ez bármikor visszavonható az eszköz beállításaiban.
- A koordináták kizárólag az eszközön kerülnek tárolásra.

**Fotók részletei:**
- A fotók kizárólag az eszköz belső tárhelyén tárolódnak.
- A fejlesztő szerverére nem kerülnek fel.
- A fotó melléklet opcionális; a felhasználó bármikor törölheti.

**Jogalap:** Az érintett hozzájárulása az egyes adattípusok (GPS, fotó) megadásakor.

---

### 4.4 Utazások

**Tárolás helye:** Eszközön lévő helyi adatbázis (Isar); borítóképek az eszköz dokumentum könyvtárában
**Törlés:** Felhasználó általi törlés; alkalmazás eltávolításakor automatikusan

| Adat | Személyes adat? |
|------|----------------|
| Utazás neve | Igen (opcionális) |
| Célország, célváros | Nem |
| Kezdő és záró dátum | Nem |
| Büdzsé összege és devizája | Nem |
| Borítókép | Igen (opcionális) |

---

### 4.5 Élő árfolyam cache

**Tárolás helye:** Eszköz SharedPreferences (kulcs-érték tároló)
**Törlés:** 24 óránként automatikusan érvénytelenedik; alkalmazás eltávolításakor automatikusan

Az alkalmazás az internetről lekért árfolyamokat legfeljebb 24 óráig cache-eli az eszközön, hogy felesleges hálózati lekéréseket elkerüljön. A cache kizárólag devizakódokat és árfolyamértékeket tartalmaz – személyes adatot nem.

---

### 4.6 Pro vásárlás státusza

**Tárolás helye:** Eszköz SharedPreferences
**Törlés:** Alkalmazás eltávolításakor automatikusan

Az alkalmazás egyetlen boolean értéket (`is_pro_purchased`) tárol helyi szinten annak jelzésére, hogy a felhasználó megvásárolta-e a Pro verziót. A tényleges fizetési tranzakciót és a vásárlási rekordot az Apple App Store, illetve a Google Play kezeli – ezekre a fejlesztő adatvédelmi tájékoztatója nem terjed ki.

---

### 4.7 Kezdőképernyő widget adatok

**Tárolás helye:** iOS: App Group UserDefaults (`group.com.lpwave.myrate`); Android: SharedPreferences
**Törlés:** Alkalmazás eltávolításakor automatikusan

A widget megjelenítéséhez az alkalmazás az eszköz widgetrendszerébe szinkronizálja az alábbi adatokat:

| Adat |
|------|
| Aktív árfolyamok devizakódjai és értékei |
| Opcionális megjegyzések az árfolyamokhoz |
| Saját devizakód |
| Az utolsó konverzió összege és devizakódja (formázott szövegként) |

Ezek az adatok nem hagyják el az eszközt; az operációs rendszer widgetrendszerén belül maradnak.

---

## 5. Hálózati kommunikáció

Az alkalmazás kizárólag devizaárfolyamok lekéréséhez kommunikál külső szerverekkel. Személyes adatot egyetlen hálózati kérés sem tartalmaz.

### 5.1 Árfolyam-szolgáltatók (fallback lánc)

Az alkalmazás sorban próbálja az alábbi ingyenes, nyilvános szolgáltatókat; az első sikeres választ használja:

| Szolgáltató | URL | Küldött adatok |
|-------------|-----|----------------|
| FreeCurrencyAPI | `api.freecurrencyapi.com` | Devizakódok (pl. `EUR`, `HUF`) |
| Frankfurter | `api.frankfurter.app` | Devizakódok |
| Open.ER-API | `open.er-api.com` | Devizakódok |

A hálózati kommunikáció kizárólag az alábbi esetekben történik:
- Új árfolyam hozzáadásakor, ha a felhasználó nem adott meg kézi értéket
- Az árfolyamok kézi frissítésekor (fejléc gomb)
- Ha a helyi cache 24 óránál régebbi

**Az alkalmazás soha nem küld:** felhasználói azonosítót, eszközazonosítót, helyszínadatot, kiadási adatokat, fotókat vagy bármilyen személyes adatot a hálózaton.

---

## 6. Harmadik felek

Az alkalmazás az alábbi harmadik fél szolgáltatásokat veszi igénybe:

| Szolgáltatás | Cél | Adatátadás |
|-------------|-----|------------|
| Apple App Store | Pro vásárlás feldolgozása (iOS) | Apple adatvédelmi irányelve szerint |
| Google Play | Pro vásárlás feldolgozása (Android) | Google adatvédelmi irányelve szerint |
| FreeCurrencyAPI | Árfolyamok lekérése | Csak devizakódok |
| Frankfurter | Árfolyamok lekérése (fallback) | Csak devizakódok |
| Open.ER-API | Árfolyamok lekérése (fallback) | Csak devizakódok |

Az alkalmazás **nem tartalmaz** reklámhálózatot, analitikai SDK-t (pl. Firebase Analytics, Crashlytics), közösségi média beépülőt vagy egyéb nyomkövető komponenst.

---

## 7. Adatexport

A felhasználó a kiadásnaplót bármikor exportálhatja:

- **CSV formátumban:** tartalmazza a tranzakciók dátumát, összegét, kategóriáját, megjegyzését, GPS koordinátáit és a fotó fájlnevét. Az export a megosztó rendszeren keresztül menthető vagy továbbítható – a célállomást a felhasználó választja meg.
- **Fotók exportálása:** a csatolt fotók zip-fájlba csomagolva exportálhatók.

Az export során az adatok nem kerülnek a fejlesztő szerverére.

---

## 8. Adatmegőrzési idő

Az összes helyi adat addig tárolódik, amíg:
- a felhasználó manuálisan nem törli (tételenként vagy kategóriánként), vagy
- az alkalmazást el nem távolítja az eszközről.

Az alkalmazás nem alkalmaz automatikus adatmegőrzési határidőt a felhasználói tartalmakra (kiadások, utazások, árfolyamok).

Az élő árfolyam cache 24 óra után automatikusan érvénytelen lesz, és a következő lekéréskor felülíródik.

---

## 9. Gyermekek adatai

Az alkalmazás nem gyűjt tudatosan 16 év alatti személyektől adatot, és nem irányul kifejezetten gyermekeknek. Az alkalmazás nem tartalmaz olyan mechanizmust, amely életkort ellenőrizne.

---

## 10. A felhasználó jogai

A GDPR alapján a felhasználót az alábbi jogok illetik meg:

| Jog | Érvényesítés módja |
|-----|-------------------|
| **Hozzáférés joga** – megismerheti, milyen adatok vannak róla tárolva | Az adatok az alkalmazáson belül megtekinthetők; export CSV-vel lehetséges |
| **Törlés joga** – kérheti adatai törlését | Beállítások > Napló törlése; egyes tételek törlése a naplóból; alkalmazás eltávolítása |
| **Helyesbítés joga** – pontatlan adatokat kijavíttathat | Kiadás szerkesztő párbeszédablak; árfolyam szerkesztő |
| **Adathordozhatóság joga** – adatait strukturált formátumban megkaphatja | CSV export a napló képernyőn |
| **Visszavonás joga** – hozzájárulása bármikor visszavonható | GPS: Beállítások > GPS kikapcsolás; fotó: egyenként törölhető; alkalmazás teljes eltávolítása |
| **Tiltakozás joga** | Kapcsolat: https://lpwave.hu/myrate/privacy/ |

Mivel az adatok kizárólag az eszközön tárolódnak, és a fejlesztő szerverén nem szerepelnek, az adatrögzítési és törlési műveletek közvetlenül az alkalmazáson és az eszközön hajthatók végre.

---

## 11. Adatbiztonság

- Az alkalmazás az Isar beágyazott adatbázist használja, amely az operációs rendszer fájlrendszerének védelmét örökli.
- A fotók és borítóképek az alkalmazás dokumentum könyvtárában tárolódnak, amely más alkalmazások számára nem hozzáférhető.
- A hálózati kommunikáció HTTPS protokollon keresztül zajlik.
- Az alkalmazás nem implementál saját titkosítást az adatbázis szintjén; az eszköz szintű titkosítás (pl. iOS Data Protection, Android Full Disk Encryption) védi az adatokat.

---

## 12. Változások a tájékoztatóban

A tájékoztató tartalma az alkalmazás fejlesztésével párhuzamosan változhat. A hatályos verzió mindig a fenti „Hatályos" dátummal és az adatvédelmi oldalon érhető el.

---

## 13. Kapcsolat

Adatvédelemmel kapcsolatos kérdéssel, megkereséssel kérjük, forduljon hozzánk:

**Adatvédelmi oldal:** https://lpwave.hu/myrate/privacy/
**Weboldal:** https://lpwave.hu/myrate/

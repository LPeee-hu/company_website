# MyRate Privacy – állítások forrásai (ellenőrzéshez, nem publikus)

Kód: `/Users/lpeee/Development/travelrate`

| Állítás | Forrás |
|---|---|
| Fiók szükséges; e-mail+jelszó, Google, Apple belépés | `pubspec.yaml` (google_sign_in, sign_in_with_apple), `lib/data/repositories/auth_repository.dart`, `doc/előfizetés/…`, feature-statusok.md (Onboarding: regisztráció/bejelentkezés) |
| Profil: e-mail, megjelenített név, profilkép (avatars storage) | `lib/data/models/user_profile.dart`, `auth_repository.dart` (`storage.from('avatars')`) |
| Szinkron csak előfizetőknek | `doc/szinkron-logika.md` ("Subscription-only"), `supabase/migrations/F30_cloud_sync_push_gate.sql` |
| Szinkronizált adatok: utazás, kiadás, árfolyam, preferenciák, fotók | `doc/feature-statusok.md` (Cloud szinkron, F36, F38, F39) |
| Csoportos utazás: tagok, vendégek, elszámolás, tevékenységnapló, értesítések, GPS | `group_trip_repository.dart`, migrációk F41–F50, `F50_group_expenses_gps.sql` |
| Csatlakozás jóváhagyáshoz kötött | `F42_group_join_approval.sql` |
| Jelentés + letiltás | `F51_account_deletion_and_ugc_moderation.sql` (`content_reports`, `blocked_users`) |
| Vásárlás: tranzakció-azonosító, állapot, lejárat, kártyaadat nincs | `F22_iap_transactions.sql`, `supabase/functions/verify-purchase`, `iap-webhook` |
| Fiók törlése (tulajdon átadás, ghost, cascade) | `F51_…sql` → `delete_own_account()` |
| Nincs analitika/összeomlás SDK | `pubspec.yaml` (nincs firebase/sentry/crashlytics) |
| Visszajelzés: Google Form + verzió + eszköztípus + e-mail | `lib/presentation/screens/settings/widgets/feedback_tile.dart` |
| Nominatim: csak a beírt keresőszöveg (`q`) + IP | `map_picker_maplibre_screen.dart:146`, `expense_map_maplibre_screen.dart:592`, `expense_map_screen.dart:113`, `map_picker_screen.dart:213` |
| Csempék: OpenFreeMap, OpenStreetMap | `offline_region_repository_impl.dart`, `map_picker_screen.dart:289`, `expense_map_screen.dart:567` |
| Fordított geokódolás az OS-en (koordináta Apple/Google felé), lokális cache | `lib/data/services/geocoding_service.dart`, `lib/data/models/cached_geocode.dart` |
| Árfolyam-API-k | `doc/Privacy Policy (web).md` (három szolgáltató) |
| Supabase régió: London (eu-west-2) | Supabase dashboard (a felhasználó képernyőképe, 2026-10-03) |

## Nyitott / nem a kódból igazolt
- Adatkezelő pontos azonosítása (impresszum) – a felhasználó később adja meg.
- Supabase DPA / SCC / adatfeldolgozói megállapodás ellenőrzése.
- Gyermekkorhatár (16) – megerősítendő.
- Alkalmazáson belüli értesítés van, push nincs (feature-statusok.md) – a szöveg ezt tükrözi.
- A fotók és a GPS helyi tárolása szinkron nélkül – kódolvasás alapján, nem tesztelve.
- A MyRate app saját adatvédelmi linkje (`lpwave.hu/myrate/privacy/`) változatlan marad.

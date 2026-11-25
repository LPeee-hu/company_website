// s/share.js – zumi nyilvános megosztási link megjelenítése
// (task_2: docs/MEGOSZTASI_LINK.md, supabase/migrations/20261123120000_public_shares.sql)
//
// - Csak a get_public_share / report_public_share RPC-t hívja a publikus
//   (publishable) kulccsal; a táblákhoz nincs anon jog.
// - A felhasználói szöveg kizárólag textContent-tel kerül az oldalra
//   (nincs HTML, nincs linkesítés).
(function () {
    'use strict';

    var SUPABASE_URL = 'https://wekssjmhbupuedlegalt.supabase.co';
    var SUPABASE_KEY = 'sb_publishable_Apq0b_jXjU_aLpjVyOoWzg_oYJbsUXk';
    var LANGS = ['en', 'de', 'hu'];

    var T = {
        en: {
            loading: 'Loading…',
            days: 'days', hours: 'hours', minutes: 'min', seconds: 'sec',
            sharedBy: '{name} shared this with you',
            sharedAnon: 'Shared with you on Zumi',
            remaining: 'left until the date',
            elapsed: 'since the date',
            done: 'It\'s here! 🎉',
            contact: 'Who to contact',
            addToCalendar: 'Add to calendar',
            googleCalendar: 'Google Calendar',
            unavailableTitle: 'This link is no longer available',
            notFound: 'The link is invalid or was mistyped.',
            expired: 'The link has expired.',
            revoked: 'The sender has withdrawn the link.',
            blocked: 'The link has been disabled.',
            loadError: 'The countdown could not be loaded. Check your connection and try again.',
            promoTitle: 'Organize your family with Zumi',
            promoText: 'Tasks, calendar, countdowns, shopping and family finance – shared with the people who matter.',
            promoMore: 'Get Zumi',
            promoWeb: 'Open the web app',
            report: 'Report this link',
            reportLabel: 'What is wrong with it? (optional)',
            reportSend: 'Send report',
            reportThanks: 'Thank you, we will review it.',
            privacy: 'Privacy',
            pageTitle: '{title} – Zumi'
        },
        de: {
            loading: 'Wird geladen…',
            days: 'Tage', hours: 'Std.', minutes: 'Min.', seconds: 'Sek.',
            sharedBy: '{name} hat das mit dir geteilt',
            sharedAnon: 'Mit dir über Zumi geteilt',
            remaining: 'bis zum Termin',
            elapsed: 'seit dem Termin',
            done: 'Es ist so weit! 🎉',
            contact: 'Ansprechperson',
            addToCalendar: 'Zum Kalender hinzufügen',
            googleCalendar: 'Google Kalender',
            unavailableTitle: 'Dieser Link ist nicht mehr verfügbar',
            notFound: 'Der Link ist ungültig oder falsch eingegeben.',
            expired: 'Der Link ist abgelaufen.',
            revoked: 'Der Absender hat den Link zurückgezogen.',
            blocked: 'Der Link wurde deaktiviert.',
            loadError: 'Der Countdown konnte nicht geladen werden. Prüfe deine Verbindung und versuche es erneut.',
            promoTitle: 'Organisiere deine Familie mit Zumi',
            promoText: 'Aufgaben, Kalender, Countdowns, Einkauf und Familienfinanzen – gemeinsam mit den Menschen, die dir wichtig sind.',
            promoMore: 'Zumi holen',
            promoWeb: 'Web-App öffnen',
            report: 'Diesen Link melden',
            reportLabel: 'Was stimmt nicht? (optional)',
            reportSend: 'Meldung senden',
            reportThanks: 'Danke, wir prüfen es.',
            privacy: 'Datenschutz',
            pageTitle: '{title} – Zumi'
        },
        hu: {
            loading: 'Betöltés…',
            days: 'nap', hours: 'óra', minutes: 'perc', seconds: 'mp',
            sharedBy: '{name} osztotta meg veled',
            sharedAnon: 'Zumiban osztották meg veled',
            remaining: 'van hátra',
            elapsed: 'telt el azóta',
            done: 'Megtörtént! 🎉',
            contact: 'Kit keress',
            addToCalendar: 'Hozzáadás a naptárhoz',
            googleCalendar: 'Google Naptár',
            unavailableTitle: 'Ez a link már nem elérhető',
            notFound: 'A link érvénytelen, vagy elírták.',
            expired: 'A link lejárt.',
            revoked: 'A küldő visszavonta a linket.',
            blocked: 'A linket letiltották.',
            loadError: 'A számlálót nem sikerült betölteni. Ellenőrizd a kapcsolatot, és próbáld újra.',
            promoTitle: 'Szervezd a családot a Zumival',
            promoText: 'Feladatok, naptár, visszaszámlálók, bevásárlás és családi pénzügyek – együtt azokkal, akik fontosak.',
            promoMore: 'Zumi letöltése',
            promoWeb: 'Webes app megnyitása',
            report: 'Link bejelentése',
            reportLabel: 'Mi a gond vele? (nem kötelező)',
            reportSend: 'Bejelentés küldése',
            reportThanks: 'Köszönjük, átnézzük.',
            privacy: 'Adatvédelem',
            pageTitle: '{title} – Zumi'
        }
    };

    var $ = function (id) { return document.getElementById(id); };
    var lang = 'en';
    var timer = null;

    function t(key, vars) {
        var s = (T[lang] && T[lang][key]) || T.en[key] || '';
        if (vars) Object.keys(vars).forEach(function (k) { s = s.replace('{' + k + '}', vars[k]); });
        return s;
    }

    function pickLang(senderLocale) {
        var browser = (navigator.language || '').slice(0, 2).toLowerCase();
        if (LANGS.indexOf(browser) >= 0) return browser;
        if (LANGS.indexOf(senderLocale) >= 0) return senderLocale;
        return 'en';
    }

    function applyStatic() {
        document.documentElement.lang = lang;
        document.querySelectorAll('[data-t]').forEach(function (el) {
            el.textContent = t(el.dataset.t);
        });
    }

    function show(id) {
        ['loading', 'share', 'unavailable'].forEach(function (s) { $(s).hidden = s !== id; });
    }

    function getToken() {
        var p = new URLSearchParams(window.location.search);
        var tok = p.get('t') || window.location.hash.replace(/^#/, '');
        return tok && /^[A-Za-z0-9_-]{10,64}$/.test(tok) ? tok : null;
    }

    function rpc(name, body) {
        return fetch(SUPABASE_URL + '/rest/v1/rpc/' + name, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'apikey': SUPABASE_KEY,
                'Authorization': 'Bearer ' + SUPABASE_KEY
            },
            body: JSON.stringify(body)
        });
    }

    function pad(n) { return n < 10 ? '0' + n : String(n); }

    function renderCounter(target, stopAtZero) {
        var diff = target.getTime() - Date.now();
        var past = diff <= 0;

        if (past && stopAtZero) {
            $('counter').hidden = true;
            $('counterLabel').hidden = true;
            $('done').hidden = false;
            $('done').textContent = t('done');
            if (timer) { clearInterval(timer); timer = null; }
            return;
        }

        var s = Math.floor(Math.abs(diff) / 1000);
        $('cDays').textContent = Math.floor(s / 86400);
        $('cHours').textContent = pad(Math.floor((s % 86400) / 3600));
        $('cMinutes').textContent = pad(Math.floor((s % 3600) / 60));
        $('cSeconds').textContent = pad(s % 60);
        $('counterLabel').textContent = t(past ? 'elapsed' : 'remaining');
    }

    function icsDate(d) {
        return d.toISOString().replace(/[-:]/g, '').replace(/\.\d{3}/, '');
    }

    function icsEscape(s) {
        return String(s).replace(/\\/g, '\\\\').replace(/;/g, '\\;').replace(/,/g, '\\,').replace(/\r?\n/g, '\\n');
    }

    function setupCalendar(snap, target, token) {
        var end = new Date(target.getTime() + 60 * 60 * 1000);
        var details = [snap.message, snap.contact_name ? t('contact') + ': ' + snap.contact_name : null]
            .filter(Boolean).join('\n');

        var ics = [
            'BEGIN:VCALENDAR',
            'VERSION:2.0',
            'PRODID:-//LP Wave//Zumi share//EN',
            'CALSCALE:GREGORIAN',
            'BEGIN:VEVENT',
            'UID:' + token + '@lpwave.hu',
            'DTSTAMP:' + icsDate(new Date()),
            'DTSTART:' + icsDate(target),
            'DTEND:' + icsDate(end),
            'SUMMARY:' + icsEscape(snap.title),
            details ? 'DESCRIPTION:' + icsEscape(details) : null,
            'END:VEVENT',
            'END:VCALENDAR'
        ].filter(Boolean).join('\r\n');

        var blob = new Blob([ics], { type: 'text/calendar;charset=utf-8' });
        $('icsBtn').href = URL.createObjectURL(blob);

        var g = new URL('https://calendar.google.com/calendar/render');
        g.searchParams.set('action', 'TEMPLATE');
        g.searchParams.set('text', snap.title);
        g.searchParams.set('dates', icsDate(target) + '/' + icsDate(end));
        if (details) g.searchParams.set('details', details);
        $('googleBtn').href = g.toString();
    }

    function renderShare(data, token) {
        var snap = data.snapshot || {};
        var target = new Date(snap.target_date);

        document.title = t('pageTitle', { title: snap.title });
        $('title').textContent = snap.title;
        $('targetDate').textContent = target.toLocaleString(lang, {
            year: 'numeric', month: 'long', day: 'numeric', weekday: 'long',
            hour: '2-digit', minute: '2-digit'
        });

        $('sharedBy').hidden = false;
        $('sharedBy').textContent = snap.sender_name
            ? t('sharedBy', { name: snap.sender_name })
            : t('sharedAnon');

        if (snap.contact_name) {
            $('contactBox').hidden = false;
            $('contactName').textContent = snap.contact_name;
        }
        if (snap.message) {
            $('message').hidden = false;
            $('message').textContent = snap.message;
        }

        setupCalendar(snap, target, token);
        renderCounter(target, !!snap.stop_at_zero);
        timer = setInterval(function () { renderCounter(target, !!snap.stop_at_zero); }, 1000);

        $('reportBox').hidden = false;
        $('reportForm').addEventListener('submit', function (e) {
            e.preventDefault();
            var btn = e.target.querySelector('button');
            btn.disabled = true;
            rpc('report_public_share', { p_token: token, p_reason: $('reportReason').value })
                .finally(function () {
                    $('reportThanks').hidden = false;
                    $('reportReason').disabled = true;
                });
        });

        show('share');
    }

    function renderUnavailable(key) {
        $('unavailableText').textContent = t(key);
        show('unavailable');
    }

    function start() {
        lang = pickLang(null);
        applyStatic();

        var token = getToken();
        if (!token) { renderUnavailable('notFound'); return; }

        rpc('get_public_share', { p_token: token })
            .then(function (res) {
                if (!res.ok) throw new Error('HTTP ' + res.status);
                return res.json();
            })
            .then(function (data) {
                var newLang = pickLang(data && data.locale);
                if (newLang !== lang) { lang = newLang; applyStatic(); }

                switch (data && data.status) {
                    case 'ok': renderShare(data, token); break;
                    case 'expired': renderUnavailable('expired'); break;
                    case 'revoked': renderUnavailable('revoked'); break;
                    case 'blocked': renderUnavailable('blocked'); break;
                    default: renderUnavailable('notFound');
                }
            })
            .catch(function () { renderUnavailable('loadError'); });
    }

    start();
})();

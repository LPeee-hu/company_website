/**
 * LP Wave – shared i18n engine
 * Usage: load this file + a page-specific translations file,
 * then call I18n.init(translations) with the translations object.
 */
const I18n = {
    lang: null,
    _t: {},

    init(translations) {
        this._t = translations;
        const stored = localStorage.getItem('lpwave_lang');
        const browser = navigator.language && navigator.language.startsWith('hu') ? 'hu' : 'en';
        this.lang = stored || browser;
        this._apply();
    },

    set(lang) {
        this.lang = lang;
        localStorage.setItem('lpwave_lang', lang);
        this._apply();
    },

    _apply() {
        const T = this._t[this.lang] || this._t['en'];

        document.documentElement.lang = this.lang;

        document.querySelectorAll('[data-i18n]').forEach(el => {
            const v = T[el.dataset.i18n];
            if (v !== undefined) el.textContent = v;
        });

        document.querySelectorAll('[data-i18n-html]').forEach(el => {
            const v = T[el.dataset.i18nHtml];
            if (v !== undefined) el.innerHTML = v;
        });

        document.querySelectorAll('[data-i18n-attr]').forEach(el => {
            // format: "attr:key"
            const [attr, key] = el.dataset.i18nAttr.split(':');
            const v = T[key];
            if (v !== undefined) el.setAttribute(attr, v);
        });

        if (T['page.title']) document.title = T['page.title'];

        const meta = document.querySelector('meta[name="description"]');
        if (meta && T['meta.desc']) meta.content = T['meta.desc'];

        document.querySelectorAll('[data-lang-btn]').forEach(btn => {
            btn.classList.toggle('active', btn.dataset.langBtn === this.lang);
        });
    }
};

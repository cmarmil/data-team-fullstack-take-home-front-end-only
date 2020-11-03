module.exports = {
    extends: ['stylelint-config-standard'],
    rules: {
        'at-rule-no-unknown': [true, { ignoreAtRules: ['at-root', 'function', 'include', 'mixin', 'return'] }],
        'font-family-no-missing-generic-family-keyword': [true, { ignoreFontFamilies: 'Font Awesome 5 Free' }],
        'selector-pseudo-class-no-unknown': [true, { ignorePseudoClasses: ['export', 'global'] }],
        'unit-blacklist': ['px'],
        indentation: [4, { severity: 'error' }],
    },
};

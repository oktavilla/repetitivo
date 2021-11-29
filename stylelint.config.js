module.exports = {
  plugins: ['stylelint-prettier'],
  extends: [
    'stylelint-config-recommended-scss',
    'stylelint-config-rational-order',
    'stylelint-prettier/recommended',
  ],
  rules: {
    'order/properties-order': [],
    'plugin/rational-order': [
      true,
      {
        'border-in-box-model': false,
        'empty-line-between-groups': true,
      },
    ],
  },
};

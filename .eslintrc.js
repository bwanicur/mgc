// https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb
module.exports = {
  "parser": "babel-eslint",
  "extends":  [
    "plugin:react/recommended",
    "airbnb-base"
  ],
  "rules": {
    "semi": 0,
    "import/no-unresolved": 0,
    "import/prefer-default-export": 0,
    "object-shorthand": 0,
    "class-methods-use-this": 0,
    "func-names": 0,
    
  }
};

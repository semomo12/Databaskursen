// import globals from "globals";
// import pluginJs from "@eslint/js";


// /** @type {import('eslint').Linter.Config[]} */
// export default [
//   {files: ["**/*.js"], languageOptions: {sourceType: "commonjs"}},
//   {languageOptions: { globals:{...globals.browser, ...globals.node}}},
//   pluginJs.configs.recommended,
// ];




import globals from "globals";
import js from "@eslint/js";

/** @type {import("eslint").FlatConfig[]} */
export default [
  js.configs.recommended, // ESLint:s rekommenderade regler
  {
    files: ["**/*.js"],
    languageOptions: {
      sourceType: "module",
      ecmaVersion: 2021, // Stödjer moderna JavaScript-funktioner
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
    rules: {
      "indent": [2, 4, { "SwitchCase": 1 }],
      "linebreak-style": [2, "unix"],
      "eol-last": 2,
      "no-trailing-spaces": 2,
      "semi": [2, "always"],
      "camelcase": [2, { "properties": "never" }],
      "curly": [2, "all"],
      "brace-style": [2, "1tbs", { "allowSingleLine": true }],
      "no-with": 2,
      "keyword-spacing": [2, {}],
      "space-before-blocks": [2, "always"],
      "space-before-function-paren": [2, { "anonymous": "ignore", "named": "never" }],
      "comma-spacing": [2, { "after": true, "before": false }],
      "semi-spacing": [2, { "before": false, "after": true }],
      "key-spacing": [2, { "beforeColon": false, "afterColon": true, "mode": "minimum" }],
      "padded-blocks": [2, "never"],
      "newline-after-var": [2, "always"],
      "max-len": [2, 100],
      "comma-style": [2, "last"],
      "no-multi-str": 2,
      "wrap-iife": [2, "any"],
      "no-console": 0
    }
  }
];

import reactPlugin from 'eslint-plugin-react';
import typescriptPlugin from '@typescript-eslint/eslint-plugin';
import importPlugin from 'eslint-plugin-import';
export default [
  {
    ignores: ["node_modules"], // Ignoring node_modules folder
  },
  {
    languageOptions: {
      ecmaVersion: 2021,       // ECMAScript 2021 support
      sourceType: "module",     // ES Modules (used for imports/exports)
      parserOptions: {
        ecmaFeatures: {
          jsx: true            // Enable JSX support
        }
      }
    },
    plugins: {
      react: reactPlugin,                // ESLint React plugin
      "@typescript-eslint": typescriptPlugin, // TypeScript ESLint plugin
      import: importPlugin              // Import plugin for module imports
    },
    rules: {
      "no-console": "warn",                           // Warn on console.log statements
      "react/prop-types": "off",                      // Disable prop-types checking for React
      "@typescript-eslint/no-unused-vars": ["error", { "argsIgnorePattern": "^_" }], // Ignore unused vars starting with "_"
      "import/order": [
        "error",
        {
          "groups": ["builtin", "external", "internal", "parent", "sibling", "index"],
          "newlines-between": "always"
        }
      ],
      "import/no-unresolved": "off"                   // Disable unresolved import error (can vary based on your project setup)
    },
    settings: {
      react: {
        version: "detect"                             // Auto-detect the version of React
      }
    },
    files: ["*.ts", "*.tsx"],                         // Apply these rules only to TypeScript files
    rules: {
      "@typescript-eslint/explicit-module-boundary-types": "off" // Disable enforcing explicit return types for module boundaries
    }
  }
];

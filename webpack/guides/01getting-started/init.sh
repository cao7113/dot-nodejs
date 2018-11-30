#!/usr/bin/env bash
set -e

npm init -y
npm install webpack webpack-cli --save-dev
npm install --save lodash

# npx webpack
# npx webpack --config webpack.config.js
# npm run build -- --colors

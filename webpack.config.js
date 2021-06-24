const path = require('path');
const mode = 'development'
module.exports = {
  entry: {
    app: './index.js'
  },
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist')
  },

  module: {
    rules: [{
      test: /\.js$/, // include .js files
      enforce: "pre", // preload the jshint loader
      exclude: /node_modules/, // exclude any and all files in the node_modules folder
      use: [{
        loader: "jshint-loader",
        // more options in the optional jshint object
        options: {  // ⬅ formally jshint property
          camelcase: true,
          emitErrors: false,
          failOnHint: false
        }
      }]
    }]
  },
  node: {
    global: false,
    __filename: false,
    __dirname: false,
  },
};
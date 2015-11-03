webpack = require 'webpack'
ngAnnotatePlugin = require 'ng-annotate-webpack-plugin'

module.exports =
  entry:
    './bootstrap'
  output:
    path: __dirname + "/dist"
    filename: "bundle.js"
  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee" }
      { test: /\.css$/, loader: "style!css" }
      { test: /\.png$/, loader: "url-loader?limit=100000" }
      { test: /\.jpg$/, loader: "file-loader" }

      # Bootstrap stuff
        test: /\.woff(\?v=\d+\.\d+\.\d+)?$/
        loader: "url?limit=10000&mimetype=application/font-woff"
      ,
        test: /\.woff2(\?v=\d+\.\d+\.\d+)?$/
        loader: "url?limit=10000&mimetype=application/font-woff"
      ,
        test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/,
        loader: "url?limit=10000&mimetype=application/octet-stream"
      ,
        test: /\.eot(\?v=\d+\.\d+\.\d+)?$/,
        loader: "file"
      ,
        test: /\.svg(\?v=\d+\.\d+\.\d+)?$/,
        loader: "url?limit=10000&mimetype=image/svg+xml"
    ]
  resolve:
    extensions: ["", ".coffee", ".js"]

  plugins: [
      new ngAnnotatePlugin
        add: true
  ]

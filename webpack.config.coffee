module.exports =
  entry:
    './bootstrap'
  output:
    path: __dirname
    filename: "bundle.js"
  module:
    loaders: [
      { test: /\.coffee$/, loader: "coffee" }
    ]
  resolve:
    extensions: ["", ".coffee", ".js"]

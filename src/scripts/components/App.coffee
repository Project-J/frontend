React = require "react"
Product = require("./Product.coffee")

App = React.createClass
  render: () ->
    React.DOM.div {className: 'main'},
      Product {name: 'Project J FLUX / React App'}

module.exports = App

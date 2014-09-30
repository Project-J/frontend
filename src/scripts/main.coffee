# Bring in jQuery and React as a Bower component in the global namespace
React = require "react"
require("script!jquery/jquery.js")

App = require("./components/App.coffee")
API   = require('./utils/API.coffee')
ProductActionCreators   = require('./actions/ProductActionCreators.coffee')
ProductActionCreators.receivedProduct(API.getProduct(1))

React.renderComponent(App({}), document.getElementById('app'))

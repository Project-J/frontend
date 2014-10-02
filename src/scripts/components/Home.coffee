React = require 'react'

Home = React.createClass

  render: ->
    React.DOM.div {className: 'bs-masthead'},
      React.DOM.div {className: 'container'},
        React.DOM.h1 {},
          "You are Home"

module.exports = Home

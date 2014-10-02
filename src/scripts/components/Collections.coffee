React = require 'react'

Collections = React.createClass

  render: ->
    React.DOM.div {className: 'bs-masthead'},
      React.DOM.div {className: 'container'},
        React.DOM.h1 {},
          "You are in Collections"

module.exports = Collections

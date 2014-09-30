React = require 'react'

NotFound = React.createClass
  render: ->
    React.DOM.div {className: 'bs-masthead'},
      React.DOM.div {className: 'container'},
        React.DOM.div {className:'Image'},
          React.DOM.h1 {},
            'Nothing to See here'

module.exports = NotFound

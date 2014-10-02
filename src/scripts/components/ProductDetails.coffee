React = require('react')
ProductStore = require('../stores/ProductStore.coffee')

ProductDetails = React.createClass

  getInitialState: ->
    ProductStore.get()

  render: ->
    unless ProductStore.showProductDetails()
      React.DOM.div {className: 'pd-container'}
    else
      React.DOM.div {className: 'pd-container'},
        React.DOM.h3 {},
          @state.master.name
        React.DOM.p {}
          @state.master.description

module.exports = ProductDetails

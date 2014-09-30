React = require 'react'
Router = require 'react-router'
Link = Router.Link

Nav = React.createClass

  render: ->
    React.DOM.div {className: 'main'},
      React.DOM.nav {className: 'navbar navbar-default navbar-fixed-top', role: 'navigation'},
        React.DOM.div {className: 'container'},
          React.DOM.ul {className: 'nav navbar-nav'},
            React.DOM.li {},
              Link {to: 'home'},
                "Home"
            React.DOM.li {},
              Link {to: 'collections'},
                "Collections"
            React.DOM.li {},
              Link {to: 'discover'},
                "Discover"
            React.DOM.li {},
              Link {to: 'me'},
                "Me"
            React.DOM.li {},
              Link {to: 'product', params: {productId: 1}},
                "Product 1"
      this.props.activeRouteHandler()

module.exports = Nav

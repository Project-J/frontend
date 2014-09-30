React = require 'react'
Router = require 'react-router'

Nav = require './components/Nav.coffee'
Home = require './components/Home.coffee'
Me = require './components/Me.coffee'
Discover = require './components/Discover.coffee'
Collections = require './components/Collections.coffee'
Product = require './components/Product.coffee'
NotFound = require './components/NotFound.coffee'

Routes = Router.Routes
Route = Router.Route
Link = Router.Link
NotFoundRoute = Router.NotFoundRoute
DefaultRoute = Router.DefaultRoute

routes =
  Routes {},
    Route {handler: Nav},
      DefaultRoute {handler: Home}
      Route {name: 'home', handler: Home, addHandlerKey: true}
      Route {name: 'collections', handler: Collections, addHandlerKey: true}
      Route {name: 'discover', handler: Discover, addHandlerKey: true}
      Route {name: 'me', handler: Me, addHandlerKey: true}
      Route {name: 'product', path:'product/:productId', handler: Product, addHandlerKey: true}
      NotFoundRoute {handler: NotFound}

React.renderComponent(routes, document.getElementById('app'))

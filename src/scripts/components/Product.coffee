React = require('react')
ProductStore = require('../stores/ProductStore.coffee')
ProductActionCreators   = require('../actions/ProductActionCreators.coffee')
ProductDetails   = require('./ProductDetails.coffee')

Product = React.createClass

  getInitialState: ->
    ProductStore.get()

  componentWillMount: ->
    ProductStore.addChangeListener @_onChange
    ProductActionCreators.getProduct this.props.params.productId, 'IamAuserToken'
    return

  componentWillUnmount: ->
    ProductStore.removeChangeListener @_onChange
    return

  render: ->
    imagePath = 'http://localhost:3000' + @state.master
      .images[ProductStore.getCurrentImageIndex()].large_url
    productDetailSVGOptions =
      version: '1.1'
      xmlns: 'http://www.w3.org/2000/svg'
      x: '0px'
      y: '0px'
      width: '50px'
      height: '50px'
      viewBox: '0 0 100 100'
      'enable-background': 'new 0 0 100 100'
      onClick: @_toggleDetails
    heartSVGOptions =
      version: '1.1'
      xmlns: 'http://www.w3.org/2000/svg'
      x: '0px'
      y: '0px'
      width: '50px'
      height: '50px'
      viewBox: '0 0 35 35'
      'enable-background': 'new 0 0 100 100'
      onClick: @_toggleLike
    React.DOM.div {className: 'bs-masthead'},
      React.DOM.div {className: 'container'},
        React.DOM.h1 {},
          @.props.name
        React.DOM.p {className: 'lead'},
          @.state.name
        React.DOM.button {onClick: @_previousImage, className: 'btn btn-primary'},
          "<-"
        React.DOM.img {src: imagePath},
        React.DOM.button {onClick: @_nextImage, className: 'btn btn-primary'},
          "->"
        React.DOM.div {},
          React.DOM.p {},
            if ProductStore.showProductDetails()
              'Product Details on'
            else
              'Product Details off'
          ProductDetails {className: 'product-details'}
          React.DOM.svg productDetailSVGOptions,
            React.DOM.path {d: 'M49.999,9.001C27.392,9.001,9.001,27.393,9.001,50s18.391,40.999,40.998,40.999s41-18.392,41-40.999
                                S72.606,9.001,49.999,9.001z M49.999,86.999c-20.4,0-36.998-16.598-36.998-36.999s16.598-36.999,36.998-36.999
                                c20.402,0,37,16.598,37,36.999S70.401,86.999,49.999,86.999z M61.794,72.349v5.428c0,0.228-0.186,0.411-0.41,0.411H41.458
                                c-0.227,0-0.41-0.184-0.41-0.411v-5.428c0-0.227,0.184-0.411,0.41-0.411h5.74v-28.93h-5.799c-0.227,0-0.408-0.184-0.408-0.409
                                v-5.551c0-0.228,0.182-0.41,0.408-0.41h13.596c0.227,0,0.41,0.183,0.41,0.41v34.89h5.979C61.608,71.938,61.794,72.122,61.794,72.349
                                z M43.685,26.502c0-3.452,2.797-6.25,6.25-6.25c3.451,0,6.25,2.798,6.25,6.25s-2.799,6.25-6.25,6.25 C46.481,32.752,43.685,29.954,43.685,26.502z'}
        React.DOM.div {},
          React.DOM.p {},
            if ProductStore.isProductLiked()
              'Liked'
            else
              'Dislike'
          React.DOM.svg heartSVGOptions,
            React.DOM.path {'fill-rule': 'evenodd', 'clip-rule': 'evenodd', fill: '#333333', d: 'M29.193,5.265c-3.629-3.596-9.432-3.671-13.191-0.288 C12.242,1.594,6.441,1.669,2.81,5.265c-3.741,3.704-3.741,9.709,0,13.415c1.069,1.059,11.053,10.941,11.053,10.941
                 c1.183,1.172,3.096,1.172,4.278,0c0,0,10.932-10.822,11.053-10.941C32.936,14.974,32.936,8.969,29.193,5.265z M27.768,17.268
                 L16.715,28.209c-0.393,0.391-1.034,0.391-1.425,0L4.237,17.268c-2.95-2.92-2.95-7.671,0-10.591
                 c2.844-2.815,7.416-2.914,10.409-0.222l1.356,1.22l1.355-1.22c2.994-2.692,7.566-2.594,10.41,0.222
                 C30.717,9.596,30.717,14.347,27.768,17.268z'}
        React.DOM.div {},
          React.DOM.p {},
            if ProductStore.boughtProduct()
              "YAY You now own this product"
          React.DOM.button {onClick: @_buy, className: 'btn btn-success btn-lg'},
            "BUY" + @.state.master.display_price

  _buy: ->
    # TODO: (@helveticafire) Check if they recently purchase this same item
    ProductActionCreators.buyProduct(@.state.master.id, 'IamAuserToken')
    return

  _nextImage: ->
    ProductActionCreators.nextProductImage()
    return

  _previousImage: ->
    ProductActionCreators.previousProductImage()
    return

  _toggleDetails: ->
    ProductActionCreators.toggleProductDetails()
    return

  _toggleLike: ->
    # TODO: (@helveticafire) Add user login/ User creation view
    if ProductStore.isProductLiked()
      ProductActionCreators.dislikeProduct(@.state.master.id, 'IamAuserToken')
    else
      ProductActionCreators.likeProduct(@.state.master.id, 'IamAuserToken')
    return

  _onChange: ->
    @setState(ProductStore.get())

module.exports = Product

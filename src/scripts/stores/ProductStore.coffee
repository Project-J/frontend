AppDispatcher    = require('../dispatcher/AppDispatcher.coffee')
EventEmitter     = require('events').EventEmitter
ProductConstants = require('../constants/ProductConstants.coffee')
merge            = require('react/lib/merge')

CHANGE_EVENT = 'change'

_product = {}

_currentImageIndex = 0
_imageCount = 0
_showProductDetails = false
_showProductLike = false
_boughtProduct = false
_changeListerCB = null

ProductStore = merge(EventEmitter::,

  emitChange: ->
    @emit CHANGE_EVENT

  addChangeListener: (callback) ->
    @on CHANGE_EVENT, callback

  removeChangeListener: (callback) ->
    @removeListener CHANGE_EVENT, callback

  get: ->
    _product

  getCurrentImageIndex: ->
    _currentImageIndex

  showProductDetails: ->
    _showProductDetails

  isProductLiked: ->
    _showProductLike

  boughtProduct: ->
    _boughtProduct
)

ProductStore.dispatchToken = AppDispatcher.register((payload) ->
  switch payload.action.type
    when ProductConstants.RECEIVE_RAW_PRODUCT
      _product = payload.action.product
      _imageCount = _product.master.images.length
    when ProductConstants.NEXT_PRODUCT_IMAGE
      if _currentImageIndex + 1 >= _imageCount
        _currentImageIndex = 0
      else
        _currentImageIndex = _currentImageIndex + 1
    when ProductConstants.PREVIOUS_PRODUCT_IMAGE
      if _currentImageIndex - 1 >= 0
        _currentImageIndex = _currentImageIndex - 1
      else
        _currentImageIndex = _imageCount - 1
    when ProductConstants.TOGGLE_PRODUCT_DETAILS
      _showProductDetails = !_showProductDetails
    when ProductConstants.LIKE_PRODUCT
      _showProductLike = true
    when ProductConstants.DISLIKE_PRODUCT
      _showProductLike = false
    when ProductConstants.BUY_PRODUCT
      _boughtProduct = true
      # TODO BEN Stores something in a cookie or SessionStorage or LocalStorage
    else
      return console.log "Action not registered "

  ProductStore.emitChange()
)

module.exports = ProductStore

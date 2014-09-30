AppDispatcher     = require('../dispatcher/AppDispatcher.coffee')
ProductConstants  = require('../constants/ProductConstants.coffee')
API   = require('./../utils/API.coffee')

module.exports =

  receivedProduct: (product) ->
    AppDispatcher.handleViewAction
      type: ProductConstants.RECEIVE_RAW_PRODUCT
      product: product

  nextProductImage: ->
    AppDispatcher.handleViewAction
      type: ProductConstants.NEXT_PRODUCT_IMAGE

  previousProductImage: ->
    AppDispatcher.handleViewAction
      type: ProductConstants.PREVIOUS_PRODUCT_IMAGE

  toggleProductDetails: ->
    AppDispatcher.handleViewAction
      type: ProductConstants.TOGGLE_PRODUCT_DETAILS

  likeProduct: (variantId, UserToken) ->
    AppDispatcher.handleViewAction
      type: ProductConstants.LIKE_PRODUCT
    API.userLikedVariant variantId, UserToken

  dislikeProduct: (variantId, UserToken) ->
    AppDispatcher.handleViewAction
      type: ProductConstants.DISLIKE_PRODUCT
    API.userDislikedVariant variantId, UserToken

  buyProduct: (variantId, UserToken) ->
    AppDispatcher.handleViewAction
      type: ProductConstants.BUY_PRODUCT
    API.buyVariant variantId, UserToken

  getProduct: (variantId, userToken) ->
    AppDispatcher.handleViewAction
      type: ProductConstants.RECEIVE_RAW_PRODUCT
      product: API.getVariant variantId, userToken

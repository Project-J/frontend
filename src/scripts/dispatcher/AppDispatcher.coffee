Dispatcher     = require('Flux').Dispatcher
copyProperties = require('react/lib/copyProperties')

AppDispatcher  = copyProperties(new Dispatcher(),

  ###*
  @param {object} action The details of the action, including the action's
  type and additional data coming from the view.
  ###
  handleViewAction: (action) ->
    @dispatch(
      source: 'VIEW_ACTION'
      action: action)

)
module.exports = AppDispatcher

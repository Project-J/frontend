`/** @jsx React.DOM */`

Product = require("./Product.coffee")

ReactTransitionGroup = React.addons.TransitionGroup
imageURL = ""


StarterApp = React.createClass
  render: () ->
    `(
      <div className='main'>
        <Product name="Project J FLUX / React App">
        </Product>
        <ReactTransitionGroup transitionName="fade">
          <div className="container">
            <img className="center-block" src={imageURL} />
          </div>
        </ReactTransitionGroup>
      </div>
    )`

module.exports = StarterApp

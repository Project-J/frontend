`/** @jsx React.DOM */`

Masthead = require("./Masthead.coffee")

ReactTransitionGroup = React.addons.TransitionGroup
imageURL = ""


StarterApp = React.createClass
  render: () ->
    `(
      <div className='main'>
        <Masthead title="Project J FLUX & React App">
          Gulp is used for orchastrating the build process, and Webpack is used to combine the Javascripts together.
        </Masthead>
        <ReactTransitionGroup transitionName="fade">
          <div className="container">
            <img className="center-block" src={imageURL} />
          </div>
        </ReactTransitionGroup>
      </div>
    )`

module.exports = StarterApp

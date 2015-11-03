module.exports = (app) ->

  # Configuration - step by step


  # Total pages in demo app

  app.constant 'totalPages', 10
  app.constant 'backendDelay', 1000       # <- Emulate slow backend

  # Deferring state recognition

  app.config ($urlRouterProvider) ->
    # do $urlRouterProvider.deferIntercept
    # Add/remove $urlRouter.listen() together with this

  # Catching unknown locations

  app.config ($urlRouterProvider) ->
    $urlRouterProvider
      .when("/page?id", "page:id")
      .otherwise '/'

  # Generating dummy pages

  app.config (totalPages, $stateProvider) ->
    [0..totalPages].map (i) ->
      $stateProvider.state
        name: "page#{i}"
        url: "/page#{i}"
        templateProvider: ->
          "<div class=\"starter-template\">
            <h1>Page #{i}</h1>
            <p class=\"lead\">Content for this page</p>
          </div>"

  # Generating special pages

  app.config ($stateProvider) ->

    # Home page

    $stateProvider.state
      name: "home"
      url: "/"
      templateProvider: ->
        "<div class=\"starter-template\">
          <h1>Homepage</h1>
          <p class=\"lead\">If you are lost - you belong here</p>
        </div>"

    # Not Authroized

    $stateProvider.state
      name: "noauth"
      template: require "jade!./templates/NoAuth.jade"

    # Waiting page

    $stateProvider.state
      name: "wait"
      templateProvider: ->
        "<div class=\"starter-template\">
          <h1>Waiting</h1>
          <p class=\"lead\">Getting data from server</p>
        </div>"

    # RedAlert page

    $stateProvider.state
      name: "alert"
      templateProvider: ->
        "<div class=\"starter-template\">
          <h1>Critical error</h1>
          <p class=\"lead\">Game over</p>
        </div>"

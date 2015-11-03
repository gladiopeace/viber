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
          "You are at page #{i}"

  # Generating special pages

  app.config ($stateProvider) ->

    # Not Authroized

    $stateProvider.state
      name: "NoAuth"
      url: "/noath"
      template: require "jade!./templates/NoAuth.jade"

    # Waiting page

    $stateProvider.state
      name: "Wait"
      template: "Waiting for data from server"

    # Starting page

    $stateProvider.state
      name: "Start"
      template: "Starting page"

    # RedAlert page

    $stateProvider.state
      name: "RedAlert"
      template: "Critical Error. Game over"

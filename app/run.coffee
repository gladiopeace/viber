module.exports = (app) ->
  app.run ($rootScope, $state, AuthService, $urlRouter, $interval) ->

    $rootScope.$state = $state
    $rootScope.AuthService = AuthService

    $rootScope.$on '$stateChangeStart', (event, toPage) ->
      console.log "$stateChangeStart", toPage

      return if toPage.name in ["noauth", "home", "alert", "wait"]

      # Check if auth was called and call it if not

      if not AuthService.promise?

        do event.preventDefault
        $state.go "wait"

        AuthService.auth().then ->
          if toPage.name in AuthService.pages
            $state.go toPage.name
          else
            $state.go "noauth"
        , ->
          $state.go "alert"

      else

        if toPage.name not in AuthService.pages
          do event.preventDefault
          $state.go "noauth"

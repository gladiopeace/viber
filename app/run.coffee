module.exports = (app) ->
  app.run ($rootScope, $state, AuthService, $urlRouter, $interval) ->

    $rootScope.$state = $state
    $rootScope.AuthService = AuthService

    # check Authorization Per Page

    checkAuthorizationPerPage = (pageId) ->
      pageId in AuthService.pages or
        pageId in ["NoAuth", "Start", "RedAlert", "Wait"]


    $rootScope.$on '$stateChangeStart', (event, toPage) ->

      # If authentication is finished - sync check

      if AuthService.loaded

        if not checkAuthorizationPerPage toPage.name

          # Intercept and redirect

          do event.preventDefault
          $state.go "NoAuth", {}, location: no

      else

        # Wait for authorization

        AuthService.auth.then ->
          if checkAuthorizationPerPage(toPage.name) is true
            $state.go toPage.name
          else
            $state.go "NoAuth", {}, location: no

        # Activate waiting state meanwhile


        do event.preventDefault
        $state.go "Wait", {}, {location: no, notify: false, reload:true}

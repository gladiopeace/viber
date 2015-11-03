module.exports = (app) ->
  app.service "AuthService", ($timeout, $http, backendDelay) ->
    @pages = []
    @loaded = false

    success = (res) =>
      $timeout =>
        @pages = res.data.map (one) ->
          "page#{one.authPage}"
        @loaded = true
      , backendDelay

    fail = (err) =>
      @loaded = true

    url = "https://www.filltext.com/?callback=JSON_CALLBACK" +
          "&rows=5&authPage={randomNumber}"

    @auth = =>
      console.log "Authenticating"
      @promise = $http.jsonp url
      @promise.then success, fail
      @promise

    @

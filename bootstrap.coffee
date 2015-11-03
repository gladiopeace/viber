angular = require 'angular'
router = require 'angular-ui-router'

# Watch this, css is bundled into JS. No CSS request on network

require "!style!css!bootstrap/dist/css/bootstrap.css"
require "!style!css!./app/css/main.css"

require "./app/viber"

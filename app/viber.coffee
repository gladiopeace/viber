app = angular.module "viber", ["ui.router"]

require('./config')(app)
require('./AuthService')(app)
require('./run')(app)

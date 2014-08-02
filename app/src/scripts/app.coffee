angular.module('app', [
    'ngRoute'
    'ngTouch'
    'ngAnimate'
    'util.directives'
    'mobile.directives'
])
.config ($routeProvider) ->
    $routeProvider.when '/',
        name: 'home'
        templateUrl: 'views/home.html'

.run ($rootScope, $location) ->
    $rootScope.l = $location
    $rootScope.inHome = -> $location.path() isnt '/'

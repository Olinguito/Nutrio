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
        controller: 'HomeCtrl'
    .when '/login',
        name: 'login'
        templateUrl: 'views/login.html'
    .when '/child/:id',
        name: 'child'
        templateUrl: 'views/child.html'
        controller: 'ChildCtrl'
    .when '/register',
      name: 'register'
      templateUrl: 'views/register.html'
      controller: 'RegisterCtrl'
    .when '/child/new',
        name: 'child-new'
        templateUrl: 'views/child-new.html'

.factory 'User', (Tutor) -> Tutor.get(123)

.run ($rootScope, $location, User) ->
    $rootScope.l = $location
    $rootScope.inHome = -> $location.path() isnt '/'
    $rootScope.btnVisible = yes
    $rootScope.loading = no
    $rootScope.controles = nom: ->

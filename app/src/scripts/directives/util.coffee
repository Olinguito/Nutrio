angular.module('util.directives', ['ngRoute'])
.directive 'content', ->
    restrict: 'C'
    link: (scope,element) ->
        scope.$on '$routeChangeSuccess', (e,current) ->
            element.attr 'id', current.name
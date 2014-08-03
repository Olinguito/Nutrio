angular.module('app')
.controller 'HomeCtrl', ($scope) ->
    $scope.children = [
            weight: 0.9
            height: 1
            name: 'Juan'
        ,
            weight: 1
            height: 0.6
            name: 'Pepito'
        ,
            weight: 0.5
            height: 0.8
            name: 'Lucas'
        ,
            weight: 0.7
            height: 0.8
            name: 'Mateo'
    ]
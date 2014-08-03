angular.module('app')
.controller 'RegisterCtrl', ($scope,$location,$http) ->

    $scope.usuarioNuevo={}
    $scope.step=1
    $scope.controles.avanzar = ->
        if($scope.step<3)
          $scope.step++
        else
          request = $http({
            method: "post",
            url: "http://localhost:3000/tutors",
            data: $scope.usuarioNuevo
          }).then (resp) ->
            $location.path('/home')
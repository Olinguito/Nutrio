angular.module('app')

.service 'Tutor', ($http) ->
    class Tutor
        constructor: (data) ->
            @[name] = prop for name, prop of data if data 
        children: -> $http.get "/tutors/#{@id}/children"
        child: (id) -> $http.get "/tutors/#{@id}/children/#{id}"

    get: (id) -> $http.get("/tutors/#{id}").then (data) -> new Tutor data
    create: (data) -> $http.post "/tutors", data

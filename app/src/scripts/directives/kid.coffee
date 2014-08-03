angular.module('app')
.directive 'kid', ->
    template:
        """
        <div class='head'>
          <div class='eye'></div>
          <div class='eye'></div>
        </div>
        <div class='body'></div>
        <div class='arms'>
          <div class='arm'></div>
          <div class='arm'></div>
        </div>
        <div class='leg'></div>
        <div class='leg'></div>
        """
    restrict: 'C'
    scope:
        h: '=height'
        w: '=weight'
    link: (scope, element, attrs) ->
        domEle = element[0]
        element.css height: "#{domEle.offsetWidth * 1.5}px"
        cont =
            h: domEle.offsetHeight
            w: domEle.offsetWidth
        element.children().css position: 'absolute'

        # Head
        head = angular.element domEle.getElementsByClassName('head')[0]
        console.log scope
        head.css
            bottom: "#{(cont.h-(cont.w/2))*scope.h}px" # headHeight-contHeight * height
            left: "#{cont.w/2 - (cont.w/2*0.8)/2 }px"
            height: "#{cont.w/2}px"
            width: "#{cont.w/2*0.8}px"
            'border-radius': "#{cont.w*scope.w*0.15}px"

        body = angular.element domEle.getElementsByClassName('body')[0]
        body.css
            bottom: "#{(cont.h-(cont.w/2))*scope.h - cont.w/2}px"
            left: "#{cont.w/2 - (cont.w/2*0.8)/2 }px"
            height: "#{cont.w/2 * scope.h}px"
            width: "#{cont.w/2*0.8}px"
            'border-radius': "#{cont.w*scope.w*0.15}px"



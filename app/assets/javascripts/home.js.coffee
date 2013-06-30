window.App = angular.module('RpgRules', ['ngResource'])

App.factory 'Rule', ['$resource', ($resource) ->
  $resource '/rules/:id ', {id: '@id'}
]

App.directive 'markdown', ->
  converter = new Showdown.converter()
  return {
    restrict: 'E',
    link: (scope, element, attrs) ->
      debugger
      htmlText = converter.makeHtml(element.text())
      element.html(htmlText)
  }

App.config ( $routeProvider) ->
  $routeProvider
    .when "/rules",
      templateUrl: "rules.html"
    .when "/rules/new",
      templateUrl: "rules/new.html"
    .otherwise
      redirectTo: "/rules"


@RulesCtrl = [ '$scope', 'Rule', ($scope, Rule) ->
  $scope.rules = Rule.query()

  $scope.addRule = ->
    rule = Rule.save($scope.newRule)
    $scope.rules.push $scope.newRule
    $scope.newRule = {}

]

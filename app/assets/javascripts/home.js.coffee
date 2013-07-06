window.App = angular.module('RpgRules', ['ngResource'])

App.factory 'Rule', ['$resource', ($resource) ->
  $resource '/rules/:id.json', {id: '@id'}
]

App.factory 'System', ['$resource', ($resource) ->
  $resource "/systems/:id.json", {id: '@id'}
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
      templateUrl: (params) ->
        "rules.html"
      controller: "RulesCtrl"
    .when "/rules/new",
      templateUrl: "rules/new.html"
      controller: "RulesCtrl"
    .otherwise
      redirectTo: "/rules"


@RulesCtrl = [ '$scope', 'Rule', '$routeParams', ($scope, Rule, $routeParams) ->
  $scope.bookId = $routeParams.book_id
  $scope.rules = Rule.query($routeParams)

  $scope.addRule = ->
    $scope.newRule.book_id = $scope.bookId

    rule = Rule.save($scope.newRule)
    $scope.rules.push $scope.newRule
    $scope.newRule = {}

]

@SystemsCtrl = [ '$scope', 'System', ($scope, System) ->
  $scope.systems = System.query()

  $scope.addSystem = ->
    rule = System.save($scope.newSystem)
    $scope.systems.push $scope.newSystem
    $scope.newSystem = {}
]

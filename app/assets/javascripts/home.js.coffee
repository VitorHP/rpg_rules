window.App = angular.module('RpgRules', ['ngResource'])

App.factory 'Rule', ['$resource', ($resource) ->
  $resource '/rules/:id ', {id: '@id'}
]

App.directive 'markdown', ->
  converter = new Showdown.converter()
  return {
    restrict: 'E',
    link: (scope, element, attrs) ->
      htmlText = converter.makeHtml(element.text())
      element.html(htmlText)
  }

@RulesCtrl = [ '$scope', 'Rule', ($scope, Rule) ->
  $scope.rules = Rule.query()

  $scope.addRule = ->
    rule = Rule.save($scope.newRule)
    $scope.rules.push $scope.newRule
    $scope.newRule = {}

]

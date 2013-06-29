window.App = angular.module('RpgRules', ['ngResource'])

App.factory 'Rule', ['$resource', ($resource) ->
  $resource '/rules/:id ', {id: '@id'}
]

@RulesCtrl = [ '$scope', 'Rule', ($scope, Rule) ->
  $scope.rules = Rule.query()

  $scope.addRule = ->
    rule = Rule.save($scope.newRule)
    $scope.rules.push $scope.newRule
    $scope.newRule = {}

]

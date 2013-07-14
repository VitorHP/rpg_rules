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

      scope.$watch attrs.md, (md) =>
        htmlText = converter.makeHtml(md)
        element.html(htmlText)
  }

App.service 'SystemService', [ '$rootScope', 'System', ($rootScope, System) ->
  systems: ->
    System.query()
  addSystem: (system) ->
    system = System.save(system)
    #this.systems().push system
    $rootScope.$broadcast('SystemService.update', this.systems())
]

App.config ( $routeProvider) ->
  $routeProvider
    .when "/rules",
      templateUrl: (params) ->
        "rules.html"
      controller: "RulesCtrl"
    .when "/rules/new",
      templateUrl: "rules/new.html"
      controller: "RulesCtrl"
    .when "/systems/new",
      templateUrl: "systems/new.html"
      controller: "SystemsCtrl"
    .when "/systems/:id",
      templateUrl: (params) -> 
        "/systems/" + params.id + ".html"
      controller: 'ShowSystemsCtrl'
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

@SystemsCtrl = [ '$scope', 'SystemService', 'System', ($scope, SystemService, System) ->
  $scope.systems = SystemService.systems()

  $scope.addSystem = ->
    system = SystemService.addSystem($scope.newSystem)
    $scope.newSystem = {}

  $scope.$on  'SystemService.update', ( event, systems ) ->
    $scope.systems = systems
]

@ShowSystemsCtrl = [ '$scope', 'System', '$routeParams', ($scope, System, $routeParams) ->
  $scope.system = System.get({ id: $routeParams.id })
]

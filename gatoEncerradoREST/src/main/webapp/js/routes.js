app.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/laberintos");

  $stateProvider
    .state('iniciarLaberinto', {
      url: '/iniciarLaberinto',
      templateUrl: 'templates/laberintoEnCurso.html',
      controller: 'LaberintoEnCursoController as LaberintoEnCurso'
    });
});
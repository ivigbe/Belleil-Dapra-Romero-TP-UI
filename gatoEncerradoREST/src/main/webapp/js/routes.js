app.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/laberintos");

  $stateProvider
    .state('iniciarLaberinto', {
    	url: '/iniciarLaberinto/:idUsuario/:idLaberinto',
      templateUrl: 'templates/laberintoEnCurso.html',
      controller: 'LaberintoEnCursoController as LaberintoEnCurso'
    });
});
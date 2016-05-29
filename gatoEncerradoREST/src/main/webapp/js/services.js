app.factory('Laberintos', function($resource) {
    return $resource('/laberintos/:id', {'id': '@id'},{
    	'getLaberintos': { method: 'GET', isArray: true}
    });
});

app.factory('IniciarLaberinto', function($resource) {
    return $resource('/iniciarLaberinto/:idUsuario:idLaberinto', {'idUsuario': '@idUsuario', 'idLaberinto': '@idLaberinto'}, {
    	'iniciar': { method: 'GET', isArray: true}
    });
});
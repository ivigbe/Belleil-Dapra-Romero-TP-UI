app.factory('Laberintos', function($resource) {
    return $resource('/laberintos/:id', {'id', '@id'}{
    	'query': { method: 'GET', isArray: true},
        'save': { method: 'POST' },
    });
});

app.factory('IniciarLaberinto', function($resource) {
    return $resource('/iniciarLaberinto/:idUsuario:idLaberinto', {'idUsuario': '@idUsuario', 'idLaberinto': '@idLaberinto'} {
    	'query': { method: 'GET', isArray: true},
        'save': { method: 'POST' },
    });
});
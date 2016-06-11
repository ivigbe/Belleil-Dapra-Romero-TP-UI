app.factory('Laberintos', function($resource) {
    return $resource('/laberintos/:id', {'id': '@id'},{
    	'getLaberintos': { method: 'GET', isArray: true}
    });
});

app.factory('IniciarLaberinto', function($resource) {
    return $resource('/iniciarLaberinto?idUsuario=:idUsuario&idLaberinto=:idLaberinto', {'idUsuario': '@idUsuario', 'idLaberinto': '@idLaberinto'}, {
    	'iniciar': { method: 'GET', isArray: false, params:{idUsuario: '@idUsuario', idLaberinto: '@idLaberinto'}}
    });
});

app.factory('RealizarAccion', function($resource) {
    return $resource('/realizarAccion?idHabitacion=:idHabitacion&idAccion=:idAccion&idUsuario=:idUsuario', {'idHabitacion': '@idHabitacion', 'idAccion': '@idAccion', 'idUsuario': '@idUsuario'},{
    	'resultado': { method: 'GET', isArray: false, params:{idHabitacion: '@idHabitacion', idAccion: '@idAccion', idUsuario: '@idUsuario'}}
    });
});
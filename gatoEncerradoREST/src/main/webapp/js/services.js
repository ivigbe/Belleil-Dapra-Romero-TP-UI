app.factory('Laberintos', function($resource) {
    return $resource('/laberintos', {'id': '@id'}, {
    	'query': { method: 'GET', params: {}},
        'update': { method: 'PUT' },
        'save': { method: 'POST' },
        'remove': { method:'DELETE' }
    });
});
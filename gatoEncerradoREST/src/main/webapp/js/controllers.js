app.controller('GatoEncerradoCtrl', ['$scope',function($scope, $resource, $timeout, cfpLoadingBar, Laberintos){

	$scope.isOpen = false;
	$scope.laberintoSeleccionado = null;
	$scope.laberintos = [
	{"nombreLaberinto":"Casa embrujada","idLaberinto":1,"pathImagenLaberinto":"img/casaEmbrujada.jpg",
	"descripcionLaberinto":"Proin laoreet consectetur malesuada. Suspendisse feugiat lorem mauris, et feugiat sapien pulvinar vitae. Suspendisse potenti. Nulla at dignissim risus. Sed nisl elit, consequat a hendrerit id, consectetur ac orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla erat nibh, condimentum non nunc non, efficitur porttitor lorem. Morbi quis est sed ipsum malesuada aliquam ac fringilla ante. Etiam ac orci leo.",
	"habitaciones":[],"inventarioDelJugador":[]},

	{"nombreLaberinto":"Bunker de Macri","idLaberinto":2,"pathImagenLaberinto":"img/bunker.jpg",
	"descripcionLaberinto":"Cras imperdiet orci massa, eleifend tincidunt lectus cursus eget. Morbi elementum placerat velit vitae sagittis. Aenean orci orci, mattis nec volutpat eget, egestas ut lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla nec nisi ut tellus interdum convallis.",
	"habitaciones":[],"inventarioDelJugador":[]}
	];

	function errorHandler(error) {
        $scope.notificarError(error.data);
    }

	$scope.seleccionarLaberinto = function(laberinto){

		if(!$scope.isOpen){
			$scope.laberintoSeleccionado = laberinto;
		}
		else{
			$scope.laberintoSeleccionado = null;
		}
	};

	/*
	$scope.actualizarLista = function() {
        Laberintos.query(function(data) {
            $scope.laberintos = data;
        }, errorHandler);
    };
    
    $scope.actualizarLista();

    $scope.guardarLaberinto = function() {
        Laberintos.update($scope.laberintoSeleccionado, function() {
            $scope.notificarMensaje('Laberinto actualizado!');
            $scope.actualizarLista();
        }, errorHandler);

        $scope.laberintoSeleccionado = null;
    };

    */

    $scope.msgs = [];
    $scope.notificarMensaje = function(mensaje) {
        $scope.msgs.push(mensaje);
        $scope.notificar($scope.msgs);
    };

    $scope.errors = [];
    $scope.notificarError = function(mensaje) {
        $scope.errors.push(mensaje);
        $scope.notificar($scope.errors);
    };

    $scope.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    }
}]);
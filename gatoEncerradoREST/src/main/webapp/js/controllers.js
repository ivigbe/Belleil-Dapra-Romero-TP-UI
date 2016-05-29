app.controller('GatoEncerradoCtrl', function($scope, $resource, $timeout, cfpLoadingBar, Laberintos){

	$scope.isOpen = false;
    $scope.estaJugando = false;
    $scope.inventarioActual = null;
	$scope.laberintoSeleccionado = null;
    $scope.idUsuario = 1;           //supongo que se lo necesita para 
	$scope.laberintos = [
    /*
	{"nombreLaberinto":"Casa embrujada","idLaberinto":1,"pathImagenLaberinto":"img/casaEmbrujada.jpg",
	"descripcionLaberinto":"Proin laoreet consectetur malesuada. Suspendisse feugiat lorem mauris, et feugiat sapien pulvinar vitae. Suspendisse potenti. Nulla at dignissim risus. Sed nisl elit, consequat a hendrerit id, consectetur ac orci. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla erat nibh, condimentum non nunc non, efficitur porttitor lorem. Morbi quis est sed ipsum malesuada aliquam ac fringilla ante. Etiam ac orci leo.",
	"habitaciones":[],"inventarioDelJugador":[]},

	{"nombreLaberinto":"Bunker de Macri","idLaberinto":2,"pathImagenLaberinto":"img/bunker.jpg",
	"descripcionLaberinto":"Cras imperdiet orci massa, eleifend tincidunt lectus cursus eget. Morbi elementum placerat velit vitae sagittis. Aenean orci orci, mattis nec volutpat eget, egestas ut lorem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla nec nisi ut tellus interdum convallis.",
	"habitaciones":[],"inventarioDelJugador":[]}
    */
	];

	function errorHandler(error) {
        $scope.notificarError(error.data);
    };

	$scope.seleccionarLaberinto = function(laberinto){

		if(!$scope.isOpen){
			$scope.laberintoSeleccionado = laberinto;
		}
		else{
			$scope.laberintoSeleccionado = null;
		}
	};

	$scope.actualizarLista = function() {
        Laberintos.getLaberintos(function(data) {
            $scope.laberintos = data;
        }, errorHandler);
    };
    
    $scope.actualizarLista();

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
    };

    $scope.jugar = function(inventario){

        $scope.estaJugando = true;
        $scope.inventarioActual = inventario;
    };
});

app.controller('LaberintoEnCursoController', function($scope, IniciarLaberinto){

$controller('GatoEncerradoCtrl', {$scope: $scope});

    $scope.acciones = [];
    $scope.habitacionSeleccionada = null;
    $scope.laberintoEnJuego = null;

    $scope.actualizarJuego = function(){            //saque el parametro de laberinto actual poruqe el JSON no esta cargado con todos los datos de laberinto que se necesitan para poder jugar
        IniciarLaberinto.iniciar(function(data) { // HAY QUE PASARLE LOS DOS PARAMETROS asi carga el JSON en laberintoENJUEGO
        $scope.laberintoEnJuego = data;
        }, errorHandler);
    };

    $scope.actualizarJuego;
});
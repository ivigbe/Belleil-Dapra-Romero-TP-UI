app.controller('GatoEncerradoCtrl', ['$scope',function($scope){

	$scope.isOpen = false;
	$scope.seleccionado = null;
	$scope.laberintos = [
		{"nombreLaberinto":"Casa embrujada","idLaberinto":1,"pathImgLaberinto": "img/laberinto2.jpg","habitaciones":[],"inventarioDelJugador":[]},
		{"nombreLaberinto":"Bunker","idLaberinto":2,"pathImgLaberinto": "img/laberinto2.jpg","habitaciones":[],"inventarioDelJugador":[]}
	];

	$scope.setSeleccionado = function(id){

		if(!$scope.isOpen){
			$scope.seleccionado = id;
		}
		else{
			$scope.seleccionado = 0;
		}
	};
}]);
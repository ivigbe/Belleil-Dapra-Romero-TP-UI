package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionGanarLaberinto extends Accion{
	
	new(Integer id, Habitacion actual){
		super(id, actual)
		this.descripcionAccion = "Ganar Laberinto"
	}
	
	override realizarAccion() {
		
		if(habitacion.esHabitacionFinal)
			habitacion.laberinto.jugadorActual.laberintoSuperado()
	}
	
	override generarResultado() {
		"Ganaste!"
	}
	
	
}
package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionDesplazamiento extends Accion{
	
	Habitacion proximaHabitacion
	
	new(){
	}
	
	new(Habitacion habitacion){
		proximaHabitacion = habitacion
		this.descripcionAccion = "Ir a Habitacion - " + proximaHabitacion.nombreHabitacion
	}
	
	override realizarAccion() {
		
		
	}
	
}
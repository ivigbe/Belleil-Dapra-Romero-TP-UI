package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionDesplazamiento extends Accion{
	
	Habitacion proximaHabitacion
	
	new(Habitacion habitacion){
		proximaHabitacion = habitacion
	}
	
	new() {
		
	}
	
	override realizarAccion() {
		
		
	}
	
}
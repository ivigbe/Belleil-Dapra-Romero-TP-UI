package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionDesplazamiento extends Accion{
	
	Habitacion proximaHabitacion
	
	new(Integer id, Habitacion actual, Habitacion proxima){
		super(id,actual)
		proximaHabitacion = proxima
		this.descripcionAccion = "Ir a Habitacion - " + proximaHabitacion.nombreHabitacion
	}
	
	override realizarAccion() {
		habitacion.laberinto.jugadorActual.habitacionActual = proximaHabitacion
		habitacion.removerAccion(this)
		
	}
	
	override generarResultado(Integer idUsuario){
		
		new ResultadoAccionDesplazamiento(idUsuario, new HabitacionFactory().minificar(proximaHabitacion))
	}
}
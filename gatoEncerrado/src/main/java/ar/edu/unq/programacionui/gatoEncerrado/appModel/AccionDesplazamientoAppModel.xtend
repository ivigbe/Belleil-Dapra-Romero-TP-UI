package ar.edu.unq.programacionui.gatoEncerrado.appModel

import java.util.List
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento

@Accessors
@Observable
class AccionDesplazamientoAppModel {
	
	AccionDesplazamiento accionDespl
	List<Habitacion> habitacionesDesplazamiento
	Habitacion habitacionActualSeleccionada
	Habitacion proximaHabitacionAIr
	
	new(){}
	
	new(List<Habitacion> habitacionesDesplazamiento, Habitacion actualSeleccionada, AccionDesplazamiento accionDespl){
		
		this.accionDespl = accionDespl
		this.habitacionesDesplazamiento = habitacionesDesplazamiento
		this.habitacionActualSeleccionada = actualSeleccionada
	}
	
	def darDescripcionAccion(){
		
		this.accionDespl.descripcionAccion = "Ir a Habitacion - " + this.accionDespl.proximaHabitacion.nombreHabitacion
	}
}
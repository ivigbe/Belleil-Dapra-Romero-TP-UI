package ar.edu.unq.programacionui.gatoEncerrado.appModel

import java.util.List
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@Observable
class AccionDesplazamientoConsecuenteAppModel {
	
	AccionDesplazamiento accionDespl
	List<Habitacion> habitacionesDesplazamiento
	Habitacion proximaHabitacionAIr
	AccionUsarItem accionOriginal
	
	new(){}
	
	new(AccionUsarItem accion, List<Habitacion> habitacionesDesplazamiento, AccionDesplazamiento accionDespl){
		
		this.accionDespl = accionDespl
		this.habitacionesDesplazamiento = habitacionesDesplazamiento
		this.accionOriginal = accion
		
		
	}
	
	def darDescripcionAccion(){
		
		accionDespl.setDescripccionAccion("Ir a Habitacion - " + this.accionDespl.proximaHabitacion.nombreHabitacion)
	}
	
	def agregarAccionResultanteALaOriginal(){
		
		this.accionOriginal.accionResultante = this.accionDespl
		
		firePropertyChanged(this,"accionOriginal.accionResultante", this.accionDespl)
	}
}
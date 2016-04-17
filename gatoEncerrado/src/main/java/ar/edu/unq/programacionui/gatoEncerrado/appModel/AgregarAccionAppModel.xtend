package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import java.util.List
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AgregarAccionAppModel {
	
	Habitacion habitacionSeleccionada
	List<Habitacion> habitaciones
	List<Item> itemsDelLaberinto
	
	new(){}
	
	new(Habitacion habSeleccionada, List<Habitacion> habitaciones, ArrayList<Item> itemsDelLaberinto) {
		
		this.habitacionSeleccionada = habSeleccionada
		this.habitaciones = habitaciones
		this.itemsDelLaberinto = itemsDelLaberinto
	}
	
	
}
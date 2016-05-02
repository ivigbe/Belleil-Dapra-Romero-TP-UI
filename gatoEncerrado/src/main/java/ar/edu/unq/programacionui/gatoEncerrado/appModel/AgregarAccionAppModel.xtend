package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AgregarAccionAppModel {
	
	Habitacion habitacionSeleccionada
	List<Habitacion> habitaciones
	List<Item> itemsDelLaberinto
	
	new(){}
	
	new(Habitacion habSeleccionada, List<Item> itemsDelLaberinto) {
		
		this.habitacionSeleccionada = habSeleccionada
		this.habitaciones = habitacionSeleccionada.laberinto.habitaciones
		this.itemsDelLaberinto = itemsDelLaberinto
	}
	
	
}
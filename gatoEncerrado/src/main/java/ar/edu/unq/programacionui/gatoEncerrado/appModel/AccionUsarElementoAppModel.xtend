package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionUsarElementoAppModel {

	AccionUsarItem accionDeUsarItem
	List<Item> itemsDelLaberinto
	Habitacion habitacionSeleccionada

	new() {
	}

	new(Habitacion habSeleccionada, List<Item> itemsDelLaberinto, AccionUsarItem accionUsarItem) {

		this.habitacionSeleccionada = habSeleccionada
		this.itemsDelLaberinto = itemsDelLaberinto
		this.accionDeUsarItem = accionUsarItem
	}

	def darDescripcionDeAccion() {
		if(this.accionDeUsarItem.accionResultante == null)
			return ""
		else{
			
			this.accionDeUsarItem.accionResultante.descripcionAccion
		}
	}

	def obtenerHabitaciones() {

		this.habitacionSeleccionada.laberinto.habitaciones
	}
}

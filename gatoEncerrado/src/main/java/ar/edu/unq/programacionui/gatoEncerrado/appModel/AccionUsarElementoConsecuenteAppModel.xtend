package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion

@Accessors
@Observable

class AccionUsarElementoConsecuenteAppModel {
	
	AccionUsarItem accionDeUsarItem
	List<Item> itemsDelLaberinto
	AccionUsarItem accionOriginal
	List<Habitacion> habitaciones

	new() {
	}

	new(AccionUsarItem accion, List<Item> itemsDelLaberinto, List<Habitacion> habitaciones, AccionUsarItem accionUsarItem) {

		this.accionOriginal = accion
		this.itemsDelLaberinto = itemsDelLaberinto
		this.accionDeUsarItem = accionUsarItem
		this.habitaciones = habitaciones
	}

	def darDescripcionDeAccion() {

		this.accionDeUsarItem.descripcionAccion = "Usa " + this.accionDeUsarItem.itemEsperado.nombre + " para " +
			this.accionDeUsarItem.accionResultante.descripcionAccion

	}
	
	def agregarAccionResultanteALaOriginal() {
		this.accionOriginal.accionResultante = this.accionDeUsarItem
	}

}
	
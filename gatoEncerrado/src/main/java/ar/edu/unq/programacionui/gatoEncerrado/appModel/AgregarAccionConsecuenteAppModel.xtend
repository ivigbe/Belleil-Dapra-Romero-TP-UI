package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import java.util.List
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AgregarAccionConsecuenteAppModel {
	
	AccionUsarItem accionOriginal
	List<Habitacion> habitaciones
	List<Item> itemsDelLaberinto
	
	new(AccionUsarItem accion, List<Habitacion> habitaciones){
		this.accionOriginal = accion
		this.habitaciones = habitaciones
		this.itemsDelLaberinto = this.habitaciones.get(0).laberinto.itemsDeLasHabitaciones
	}
	
	def listItemsDelLaberintoSinItemAUsar() {
		var res = this.itemsDelLaberinto
		
		res.remove(this.accionOriginal.itemEsperado)
		
		return res
	}
	
}
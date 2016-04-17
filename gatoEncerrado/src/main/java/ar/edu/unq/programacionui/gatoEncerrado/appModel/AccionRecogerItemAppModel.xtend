package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionRecogerItemAppModel {
	
	AccionRecogerItem accionDeRecogerItem
	Habitacion habitacionSeleccionada
	List<Item> itemsDeLaHabitacion
	Item itemNuevo
	
	
	new(Habitacion habSeleccionada, AccionRecogerItem accion){
		
		this.itemNuevo = new Item()
		this.habitacionSeleccionada = habSeleccionada
		this.accionDeRecogerItem = accion
		this.accionDeRecogerItem.itemARecoger = itemNuevo
	}
	
	def darDescripcionAccion(){
		
		this.accionDeRecogerItem.descripcionAccion = "Elemento - " + this.accionDeRecogerItem.itemARecoger.nombre
	}
}
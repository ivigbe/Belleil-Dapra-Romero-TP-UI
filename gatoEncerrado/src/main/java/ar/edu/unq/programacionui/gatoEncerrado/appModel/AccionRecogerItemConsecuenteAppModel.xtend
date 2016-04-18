package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionRecogerItemConsecuenteAppModel {
	
	AccionRecogerItem accionDeRecogerItem
	Item itemNuevo
	AccionUsarItem accionOriginal
	
	
	new(AccionUsarItem original, AccionRecogerItem accion){
		
		this.itemNuevo = new Item()
		this.accionDeRecogerItem = accion
		this.accionDeRecogerItem.itemARecoger = itemNuevo
		this.accionOriginal = original
	}
	
	def darDescripcionAccion(){
		
		this.accionDeRecogerItem.descripcionAccion = "Elemento - " + this.accionDeRecogerItem.itemARecoger.nombre
	}
	
	

}
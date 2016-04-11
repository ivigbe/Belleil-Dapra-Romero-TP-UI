package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class AccionRecogerItem extends Accion{
	
	Item itemARecoger
	
	new(){}
	
	new(Item item){
		itemARecoger = item
		this.descripcionAccion = "Item a recoger: " + itemARecoger.nombre
	}
	
	override realizarAccion() {
		
	}
	
}
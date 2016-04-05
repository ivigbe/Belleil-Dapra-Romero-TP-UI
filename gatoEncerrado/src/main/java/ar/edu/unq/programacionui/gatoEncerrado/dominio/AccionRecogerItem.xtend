package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors 
class AccionRecogerItem extends Accion{
	
	Item itemARecoger		
	new(){}
	
	new(Item item){
		itemARecoger = item
	}
	
	override realizarAccion() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
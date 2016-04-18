package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionUsarItem extends Accion{
	
	Item itemEsperado
	Accion accionResultante
	
	new(Item item, Accion accion){
		itemEsperado = item
		accionResultante = accion
	}
	
	new() {
	
	}
	
	override realizarAccion() {
		
	}
	
}
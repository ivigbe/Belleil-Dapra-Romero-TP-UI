package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionUsarItem extends Accion{
	
	Item itemEsperado
	Accion accionResultante
	
	new(Item item, Accion accion){
		itemEsperado = item
		accionResultante = accion
		this.descripcionAccion = "Usa " + itemEsperado.nombre + "para " + accionResultante.descripcionAccion
	}
	
	new() {
	
	}
	
	override realizarAccion() {
		
	}
	
}
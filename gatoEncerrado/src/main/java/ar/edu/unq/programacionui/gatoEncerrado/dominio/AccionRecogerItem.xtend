package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors 
@Observable
class AccionRecogerItem extends Accion{
	
	Item itemARecoger
	
	new(Integer id, Habitacion actual, Item item){
		super(id, actual)
		itemARecoger = item
		this.descripcionAccion = "Item a recoger: " + itemARecoger.nombre
	}
	
	override realizarAccion() {
		habitacion.laberinto.jugadorActual.recogerItem(this)
		habitacion.removerAccion(this)
		
	}
	
	override generarResultado(Integer idUsuario){
		
		new ResultadoAccionRecogerItem(itemARecoger, idUsuario)
	}
}
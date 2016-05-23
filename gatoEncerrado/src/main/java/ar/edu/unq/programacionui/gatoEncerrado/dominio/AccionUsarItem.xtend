package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class AccionUsarItem extends Accion{
	
	Item itemEsperado
	Accion accionResultante
	
	new(Integer id, Habitacion habitacion, Item item, Accion accion){
		super(id, habitacion)
		itemEsperado = item
		accionResultante = accion
		descripcionAccion = "Usar elemento " + itemEsperado.nombre + "para " + accionResultante.descripcionAccion
	}
	
	override realizarAccion() {
		habitacion.laberinto.jugadorActual.usarItem(this)
	}
	
	override generarResultado(Integer idUsuario) {
		new ResultadoAccionUsarItem(accionResultante, idUsuario)
	}
	
}
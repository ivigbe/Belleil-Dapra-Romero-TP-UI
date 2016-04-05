package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionDesplazamiento extends Accion{
	
	List<Habitacion> habitacionesLindantes = newArrayList()
	
	override realizarAccion() {
		
	}
	
}
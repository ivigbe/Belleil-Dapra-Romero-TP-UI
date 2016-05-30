package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AccionMinificada {
	
	Integer idAccion
	String descripcionAccion
	
	new(Integer id, String descripcion){
		idAccion = id
		descripcionAccion = descripcion
	}
}
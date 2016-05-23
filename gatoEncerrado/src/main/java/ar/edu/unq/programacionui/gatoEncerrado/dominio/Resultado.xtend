package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Resultado {
	
	Integer idUsuario
	
	new(Integer idUsuario){
		
		this.idUsuario = idUsuario
	}
}
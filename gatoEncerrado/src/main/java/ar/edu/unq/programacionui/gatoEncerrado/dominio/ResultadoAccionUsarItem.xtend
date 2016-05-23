package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ResultadoAccionUsarItem extends Resultado{
	
	Accion accionResultante
	
	new(Accion resultante, Integer idUsuario) {
		super(idUsuario)
		this.accionResultante = resultante
	}
	
}
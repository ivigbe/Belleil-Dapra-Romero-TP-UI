package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ResultadoAccionRecogerItem extends Resultado{
	
	Item itemARecoger
	
	new(Item aRecoger, Integer idUsuario) {
		super(idUsuario)
		this.itemARecoger = aRecoger
	}
	
}
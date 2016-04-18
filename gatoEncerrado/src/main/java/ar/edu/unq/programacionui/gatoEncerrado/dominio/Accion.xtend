package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
abstract class Accion {
	
	String descripcionAccion
	Boolean habilitado

	def abstract void realizarAccion()
}
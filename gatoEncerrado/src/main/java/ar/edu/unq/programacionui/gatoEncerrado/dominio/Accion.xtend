package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@Observable
abstract class Accion {
	
	String descripcionAccion
	Boolean habilitado

	def abstract void realizarAccion()
	
	def setDescripccionAccion(String desc){
		
		this.descripcionAccion = desc	
		
		firePropertyChanged(this,"descripcionAccion", desc)
		
	}
}
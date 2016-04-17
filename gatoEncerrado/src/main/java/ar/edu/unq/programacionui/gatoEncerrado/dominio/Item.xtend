package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Item {
	
	String nombre
	String descripcion
	Boolean habilitado
	
	new(){}
	
	new(String nombre, String descripcion){
		
		this.nombre = nombre
		this.descripcion = descripcion
		this.habilitado = true
	}
	
	def deshabilitar(){
		
		habilitado = false
	}
}
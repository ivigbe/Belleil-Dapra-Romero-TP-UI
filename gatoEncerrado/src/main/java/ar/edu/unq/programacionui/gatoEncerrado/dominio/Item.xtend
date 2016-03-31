package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Item {
	
	String nombre
	String descripcion
	Boolean habilitado
	
	new(String nombre, String descripcion){
		
		this.nombre = nombre
		this.descripcion = descripcion
		this.habilitado = true
	}
	
	def deshabilitar(){
		
		habilitado = false
	}
}
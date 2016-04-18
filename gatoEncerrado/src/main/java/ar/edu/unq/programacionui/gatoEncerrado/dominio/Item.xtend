package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException
import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@Observable
class Item {
	
	String nombre
	String descripcion
	
	new(){}
	
	new(String nombre, String descripcion){
		
		this.nombre = nombre
		this.descripcion = descripcion
	}
	
	def validarNombreItem(){
		
		if(this.nombre == null){
			
			throw new UserException("Nombre de Item obligatorio")
		}
	}
	
	def setNombre(String nombre){
		
		this.nombre = nombre
		
		firePropertyChanged(this,"nombre", nombre)
		
		this.validarNombreItem()
		
		
	}
}
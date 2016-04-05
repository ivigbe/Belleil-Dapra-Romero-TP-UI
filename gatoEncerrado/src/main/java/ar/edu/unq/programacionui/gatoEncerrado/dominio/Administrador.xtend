package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Administrador {
	
	List<Laberinto> laberintos = newArrayList()
	String nombre
	
	new(String name){
		
		this.nombre = name
	}
	
	new(){}
	
	def void agregarLaberinto(Laberinto l){
		
		laberintos.add(l)
	}
	
	def void quitarLaberinto(Laberinto l){
		
		laberintos.remove(l)
	}
}
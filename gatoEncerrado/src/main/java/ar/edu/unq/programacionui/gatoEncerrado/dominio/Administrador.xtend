package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Administrador {
	
	List<Laberinto> laberintos = newArrayList()
	Integer idUsuario
	String nombre
	
	new(String name){
		
		this.nombre = name
		laberintos = #[
			new Laberinto("Casa embrujada", 1, "cocina.jpg"),
			new Laberinto("Bunker de Macri", 2, "cocina.jpg"),
			new Laberinto("Casa Carrio", 3, "cocina.jpg"),
			new Laberinto("Asilo Abandonado", 4, "cocina.jpg"),
			new Laberinto("Hospital", 5, "cocina.jpg"),
			new Laberinto("Sede Google", 6, "cocina.jpg")
		]
		
		
	}
	
	new(){}
	
	def void agregarLaberinto(Laberinto l){
		
		laberintos.add(l)
	}
	
	def void quitarLaberinto(Laberinto l){
		
		laberintos.remove(l)
	}
}
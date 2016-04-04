package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Administrador {
	
	List<Laberinto> laberintos = newArrayList()
	String nombre
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Accion accionSeleccionada
	
	new(String name){
		
		this.nombre = name
	}
	
	new(){}
	
	def void nuevoLaberinto(){
		
		this.agregarLaberinto(new Laberinto("nuevo Laberinto"))
	}
	
	def void agregarLaberinto(Laberinto l){
		
		laberintos.add(l)
	}
	
	def void quitarLaberinto(Laberinto l){
		
		laberintos.remove(l)
	}
	
	def void nuevaHabitacion(){
		
		laberintoSeleccionado.agregarHabitacion(new Habitacion("nueva Habitacion"))
	}
	
	def void quitarHabitacion(Habitacion h){
		
		laberintoSeleccionado.quitarHabitacion(h)
	}
	
}
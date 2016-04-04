package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Laberinto {
	
	String nombreLaberinto
	List<Habitacion> habitaciones = newArrayList()
	
	new(){}
	
	new(String nombreLaberinto){
		this.nombreLaberinto = nombreLaberinto
	}
	
	def void agregarHabitacion(Habitacion habitacion) {
		habitaciones.add(habitacion)
	}
	
	def void quitarHabitacion(Habitacion habitacion){
		
		habitaciones.remove(habitacion)
	}
	
	def cantidadDeHabitaciones(){
		
		habitaciones.size	
	}
	
}
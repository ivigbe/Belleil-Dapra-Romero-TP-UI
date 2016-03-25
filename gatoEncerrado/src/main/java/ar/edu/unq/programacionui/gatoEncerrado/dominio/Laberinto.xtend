package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Laberinto {
	
	List<Habitacion> habitaciones = newArrayList()
	
	new(){}
	
	def void agregarHabitacion(Habitacion habitacion) {
		habitaciones.add(habitacion)
	}
	
	def cantidadDeHabitaciones(){
		
		habitaciones.size	
	}
	
}
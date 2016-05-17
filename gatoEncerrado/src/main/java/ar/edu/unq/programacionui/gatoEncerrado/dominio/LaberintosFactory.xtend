package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Factory {
	
	
}

@Accessors
class LaberintosFactory {
	List<Laberinto> laberintosAMinificar
	
	new(List<Laberinto> laberintos){
		
		laberintosAMinificar = laberintos
		
	}
	
	def minificarLaberintos(){
		var laberintosMinificados = newArrayList()
		for(l:laberintosAMinificar){
			laberintosMinificados.add(minificar(l))
		}
		return laberintosMinificados
	}
	
	def minificar(Laberinto laberinto) {
		return new LaberintoMinificado(laberinto.nombreLaberinto, laberinto.idLaberinto, laberinto.pathImgLaberinto)
	}
	
}

class HabitacionFactory{
	
	List<Habitacion> habitacionesAMinificar
	
	new(List<Habitacion> habitaciones){
		
		habitacionesAMinificar = habitaciones
	}
	
	def minificarHabitaciones(){
		
		var habitacionesMinificadas = newArrayList()
		for(h:habitacionesAMinificar){
			habitacionesMinificadas.add(minificar(h))
		}
		return habitacionesMinificadas
	}
	
	def minificar(Habitacion hab) {
		return new HabitacionMinificada(hab.idHabitacion, hab.acciones, hab.esHabitacionInicial, hab.esHabitacionFinal, hab.pathImgHabitacion)
	}
}

@Accessors
class DatosLaberintoFactory {
	
	Jugador jugadorActual
	
	new(){}
	
	def minificar(Laberinto laberinto) {
		
		return new LaberintoMinificado(laberinto.idLaberinto, laberinto.nombreLaberinto, new HabitacionFactory(laberinto.habitaciones).minificarHabitaciones, jugadorActual.inventario)
	}
}
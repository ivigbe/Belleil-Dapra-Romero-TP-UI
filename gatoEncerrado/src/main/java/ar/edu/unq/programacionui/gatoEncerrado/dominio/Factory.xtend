package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Factory {
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
		return new LaberintoMinificado(laberinto.nombreLaberinto, laberinto.idLaberinto, laberinto.pathImgLaberinto, laberinto.descripcion)
	}
	
}

class HabitacionFactory{
	
	List<Habitacion> habitacionesAMinificar
	
	new(List<Habitacion> habitaciones){
		
		habitacionesAMinificar = habitaciones
	}
	
	new() {
	}
	
	def List<HabitacionMinificada> minificarHabitaciones(){
		
		var habitacionesMinificadas = newArrayList()
		for(h:habitacionesAMinificar){
			habitacionesMinificadas.add(minificar(h))
		}
		return habitacionesMinificadas
	}
	
	def minificar(Habitacion hab) {
		return new HabitacionMinificada(hab.idHabitacion, new AccionFactory(hab.acciones).minificarAcciones(), hab.esHabitacionInicial, hab.esHabitacionFinal, hab.pathImgHabitacion)
	}
}

class AccionFactory{
	
	List<Accion> accionesAMinificar
	
	new(List<Accion> acciones){
		
		accionesAMinificar = acciones
	}
	
	def minificarAcciones(){
		
		var accionesMinificadas = newArrayList()
		for(h:accionesAMinificar){
			accionesMinificadas.add(minificar(h))
		}
		return accionesMinificadas
	}
	
	def minificar(Accion acc) {
		return new AccionMinificada(acc.idAccion, acc.descripcionAccion)
	}
}


@Accessors
class DatosLaberintoFactory {
	
	Jugador jugadorActual
	
	new(Jugador j){
		
		jugadorActual = j
	}
	
	def minificar(Laberinto laberinto) {
		
		return new LaberintoMinificado(laberinto.idLaberinto, laberinto.nombreLaberinto, new HabitacionFactory(laberinto.habitaciones).minificarHabitaciones, jugadorActual.inventario, laberinto.pathImgLaberinto)
	}
}
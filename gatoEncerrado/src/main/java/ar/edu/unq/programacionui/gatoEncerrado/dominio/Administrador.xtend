package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Administrador {
	
	List<Jugador> jugadores = newArrayList()
	List<Laberinto> laberintos = newArrayList()
	List<Habitacion> habitaciones = newArrayList()
	List<Accion> acciones = newArrayList()
	Integer idUsuario
	String nombre
	
	new(String name){
		
		this.nombre = name
		this.laberintos = #[
			new Laberinto("Casa embrujada", 1, "cocina.jpg"),
			new Laberinto("Bunker de Macri", 2, "cocina.jpg"),
			new Laberinto("Casa Carrio", 3, "cocina.jpg"),
			new Laberinto("Asilo Abandonado", 4, "cocina.jpg"),
			new Laberinto("Hospital", 5, "cocina.jpg"),
			new Laberinto("Sede Google", 6, "cocina.jpg")
		]
		
		this.habitaciones = #[
			
			new Habitacion(1, "Cocina", this.laberintos.get(0)),
			new Habitacion(2, "Banio", this.laberintos.get(1)),
			new Habitacion(3, "Comedor", this.laberintos.get(2)),
			new Habitacion(4, "Patio", this.laberintos.get(3)),
			new Habitacion(5, "Quincho", this.laberintos.get(4)),
			new Habitacion(6, "Hall", this.laberintos.get(5))
		]
		
		this.jugadores = #[
			new Jugador(1, this.habitaciones.get(0)),
			new Jugador(2, this.habitaciones.get(0))
		]
		
		this.acciones = #[
			
			new AccionDesplazamiento(1, this.habitaciones.get(0), this.habitaciones.get(1)),
			new AccionRecogerItem(2, this.habitaciones.get(0), new Item("Pala", "Para cavar")),
			new AccionUsarItem(3, this.habitaciones.get(0), new Item("El esperado", "El que estabamos esperando"), new AccionDesplazamiento(7, this.habitaciones.get(0), this.habitaciones.get(3))),
			new AccionGanarLaberinto(4, this.habitaciones.get(0)),
			new AccionDesplazamiento(5, this.habitaciones.get(0), this.habitaciones.get(0)),
			new AccionDesplazamiento(6, this.habitaciones.get(0), this.habitaciones.get(0))
		]
		
		this.laberintos.get(0).jugadorActual = jugadores.get(0)
	}
	
	new(){}
	
	def void agregarLaberinto(Laberinto l){
		
		laberintos.add(l)
	}
	
	def void quitarLaberinto(Laberinto l){
		
		laberintos.remove(l)
	}
	
	def obtenerLaberinto(Integer id){
		
		laberintos.findFirst[l | l.idLaberinto == id]
	}
	
	def obtenerJugador(Integer id){
		
		jugadores.findFirst[j | j.idUsuario == id]
	}
	
	def obtenerHabitacion(Integer id) {
		habitaciones.findFirst[h | h.idHabitacion == id]
	}
	
	def obtenerAccionAEjecutar(Integer id) {
		acciones.findFirst[a | a.idAccion == id]
	}
	
}
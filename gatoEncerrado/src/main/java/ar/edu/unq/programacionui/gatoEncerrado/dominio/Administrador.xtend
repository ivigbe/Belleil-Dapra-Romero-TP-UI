package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.ArrayList

@Accessors
@Observable
class Administrador {
	
	List<Jugador> jugadores = newArrayList()
	List<Laberinto> laberintos = newArrayList()
	List<Habitacion> habitaciones = newArrayList()
	List<Accion> acciones = newArrayList()
	ArrayList<Item> inventario = new ArrayList<Item>(15)
	Integer idUsuario
	String nombre
	
	new(String name){
		
		this.nombre = name
		this.laberintos = #[
			new Laberinto("Casa embrujada", 1, "casaEmbrujada.jpg", "Casa embrujada de transilvania"),
			new Laberinto("Bunker de Macri", 2, "bunker.jpg", "Fiesta en el bunker de Macri yeah yeah!"),
			new Laberinto("Casa Carrio", 3, "casa.jpg", "Casa de campo de Elisa Carrio"),
			new Laberinto("Asilo Abandonado", 4, "asilo.jpg", "Asilo del abuelo de Bart"),
			new Laberinto("Hospital", 5, "hospital.jpg", "Hospital del Grand Theft Auto V"),
			new Laberinto("Sede Google", 6, "google.jpg", "Sede de Google en California, despues de un ataque zombie")
		]
		
		this.habitaciones = #[
			
			new Habitacion(1, "Cocina", this.laberintos.get(0)),
			new Habitacion(2, "Banio", this.laberintos.get(0)),
			new Habitacion(3, "Comedor", this.laberintos.get(0)),
			new Habitacion(4, "Patio", this.laberintos.get(0)),
			new Habitacion(5, "Quincho", this.laberintos.get(0)),
			new Habitacion(6, "Hall", this.laberintos.get(0))
		]
		
		for(Habitacion h : this.habitaciones){
			this.laberintos.get(0).agregarHabitacion(h)
		}
		
		
		this.jugadores = #[
			new Jugador(1, this.habitaciones.get(0)),
			new Jugador(2, this.habitaciones.get(0))
		]
		
		this.inventario.add(new Item(1, "Hacha", "Para matar a kratos", "hacha.jpg"))
		this.inventario.add(new Item(2, "Espada", "Para algo", "espada.jpg"))
		this.inventario.add(new Item(3, "Pala", "Para algo", "pala.jpg"))
		this.inventario.add(new Item(4, "Llave", "Para algo", "llave.jpg"))
		this.inventario.add(new Item(5, "Linterna", "Para algo", "linterna.jpg"))
		this.inventario.add(new Item(6, "Piedra", "Para algo", "piedra.jpg"))
		
		this.jugadores.get(0).inventario = this.inventario
				
		this.acciones = #[
			
			new AccionDesplazamiento(1, this.habitaciones.get(0), this.habitaciones.get(1)),
			new AccionRecogerItem(2, this.habitaciones.get(1), new Item(7, "Pala", "Para cavar", "pala.jpg")),
			new AccionDesplazamiento(3, this.habitaciones.get(1), this.habitaciones.get(2)),
			new AccionUsarItem(4, this.habitaciones.get(2), new Item(8, "El esperado", "El que estabamos esperando", "pala.jpg"), new AccionDesplazamiento(7, this.habitaciones.get(2), this.habitaciones.get(3))),
			new AccionDesplazamiento(5, this.habitaciones.get(3), this.habitaciones.get(4)),
			new AccionDesplazamiento(6, this.habitaciones.get(4), this.habitaciones.get(5)),
			new AccionGanarLaberinto(8, this.habitaciones.get(5))
		]
		
		this.habitaciones.get(0).agregarAccion(this.acciones.get(0))
		this.habitaciones.get(1).agregarAccion(this.acciones.get(1))
		this.habitaciones.get(1).agregarAccion(this.acciones.get(2))
		this.habitaciones.get(2).agregarAccion(this.acciones.get(3))
		this.habitaciones.get(3).agregarAccion(this.acciones.get(4))
		this.habitaciones.get(4).agregarAccion(this.acciones.get(5))
		this.habitaciones.get(5).agregarAccion(this.acciones.get(6))
		
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
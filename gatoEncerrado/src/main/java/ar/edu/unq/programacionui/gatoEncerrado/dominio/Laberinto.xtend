package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class Laberinto {
	
	String nombreLaberinto = ""
	List<Habitacion> habitaciones = newArrayList()
	String pathImgLaberinto = "img/"
	Integer idLaberinto = 0
	String descripcion = ""
	Jugador jugadorActual
	
	new(){
		
	}
	
	new(String nombreLaberinto, Integer id, String nombreDeImagen){
		this.nombreLaberinto = nombreLaberinto
		idLaberinto = id
		pathImgLaberinto += nombreDeImagen
		
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
	
	def itemsDeLasHabitaciones(){
		
		var res = newArrayList()
		
		for(h : this.habitaciones){
			
			res.addAll(h.items)
		}
		
		res
	}
	
	def validarSiHayHabitacionInicial(){
		if(hayHabitacionInicial){
			throw new UserException("Ya hay una habitacion marcada como inicial")
		}
	}	
	
	def validarSiHayHabitacionFinal(){
		if(hayHabitacionFinal){
			throw new UserException("Ya hay una habitacion marcada como final")
		}
	}
	
	def hayHabitacionInicial(){
		
		for(Habitacion h : this.habitaciones){
			if(h.esHabitacionInicial){
				return true
			}
		}
		return false
	}
	
	def hayHabitacionFinal(){
		
		for(Habitacion h : this.habitaciones){
			if(h.esHabitacionFinal){
				return true
			}
		}
		return false
	}
	
	
}
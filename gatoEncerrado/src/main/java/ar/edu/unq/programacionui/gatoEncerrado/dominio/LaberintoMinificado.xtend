package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class LaberintoMinificado {
	String nombreLaberinto
	Integer idLaberinto
	String pathImagenLaberinto
	List<Habitacion> habitaciones
	ArrayList<Item> inventarioDelJugador
	
	new(String nombre, Integer id, String path){
		nombreLaberinto = nombre
		idLaberinto = id
		pathImagenLaberinto = path
	}
	
	new(Integer id, List<Habitacion> hs, ArrayList<Item> inventario){
		
		idLaberinto = id
		habitaciones = hs
		inventarioDelJugador = inventario
	}
}
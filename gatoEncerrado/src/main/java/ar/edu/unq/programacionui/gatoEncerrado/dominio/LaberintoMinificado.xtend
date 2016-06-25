package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class LaberintoMinificado {
	String nombreLaberinto
	Integer idLaberinto
	String pathImagenLaberinto
	String descripcionLaberinto
	List<HabitacionMinificada> habitaciones = newArrayList()
	ArrayList<Item> inventarioDelJugador = new ArrayList<Item>(15)
	
	new(String nombre, Integer id, String path, String desc){
		nombreLaberinto = nombre
		idLaberinto = id
		pathImagenLaberinto = path
		descripcionLaberinto = desc
	}
	
	new(Integer id, String nombre, List<HabitacionMinificada> hs, ArrayList<Item> inventario, String path){
		nombreLaberinto = nombre
		idLaberinto = id
		habitaciones = hs
		inventarioDelJugador = inventario
		pathImagenLaberinto = path
	}
}

@Accessors	
class LaberintoMobile{
	
	String nombreLaberinto
	Integer idLaberinto
	String pathImagenLaberinto
	String descripcionLaberinto
	ArrayList<Item> inventarioDelJugador = new ArrayList<Item>(15)
	
	new(Integer id, String nombre, String path, String descripcion, ArrayList<Item> inventario){
		
		idLaberinto = id
		nombreLaberinto = nombre
		pathImagenLaberinto = path
		descripcionLaberinto = descripcion
		inventarioDelJugador = inventario
	}
}
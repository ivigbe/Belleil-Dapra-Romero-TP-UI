package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class Jugador {
	
	ArrayList<Item> inventario
	Habitacion habitacionActual
	List<Laberinto> laberintosSuperados = newArrayList()
	List<Laberinto> laberintosAbandonados = newArrayList()
	Integer idUsuario
	
	new(Habitacion actual){
		
		inventario = new ArrayList<Item>(15)
		habitacionActual = actual
	}
	
	new(Integer idUsuario, Habitacion actual){
		
		this.idUsuario = idUsuario
		inventario = new ArrayList<Item>(15)
		habitacionActual = actual
	}
	
	def recogerItem(AccionRecogerItem accionItem) {
		if(inventario.indexOf(inventario.last()) < 15){
			
			inventario.add(accionItem.itemARecoger)
		}
		else{
			
			throw new InventarioLlenoException()
		}
	}
	
	def cantidadDeItems() {
		inventario.size
	}
	
	def realizarAccion(Accion accion){
		accion.realizarAccion
	}
	
	def estaEnElInventario(Item item) {
		inventario.exists[i | i.nombre == item.nombre]
	}
	
	def void abandonarLaberinto(){
		laberintosAbandonados.add(habitacionActual.laberinto)
		throw new LaberintoAbandonadoException()
	}
	
	def laberintoSuperado() {
		this.laberintosSuperados.add(habitacionActual.laberinto)
	}
	
}

class LaberintoAbandonadoException extends Exception{
	new(){
		super("Juego Terminado!")
	}
}

class ItemNoEncontradoException extends Exception{
	new(){
	super("No tienes el item esperado!")}
}

class InventarioLlenoException extends Exception{
	new(){
		super("El inventario esta lleno!")
	}
}
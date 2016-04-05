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
	
	new(Habitacion actual){
		
		inventario = new ArrayList<Item>(15)
		habitacionActual = actual
	}
	
	def recogerItem(Item item) {
		
		inventario.add(item)
	}
	
	def cantidadDeItems() {
		inventario.size
	}
	
	def moverseA(Habitacion habitacion) {
		
		habitacionActual = habitacion
	}
	
	def usarItem(Item item) {
		
		
	}
	
	def void abandonarLaberinto(){
		//TODO: VER DESPUES!
	}
	
}
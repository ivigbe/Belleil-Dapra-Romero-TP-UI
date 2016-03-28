package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Jugador {
	
	ArrayList<Item> inventario
	Habitacion habitacionActual
	
	new(Habitacion actual){
		
		inventario = new ArrayList<Item>(15)
		habitacionActual = actual
	}
	
	def recogerItem(Item item) {
		
		inventario.add(item)
		habitacionActual.quitarItem(item)
	}
	
	def cantidadDeItems() {
		inventario.size
	}
	
	def moverseA(Habitacion habitacion) {
		
		habitacionActual = habitacion
	}
	
}
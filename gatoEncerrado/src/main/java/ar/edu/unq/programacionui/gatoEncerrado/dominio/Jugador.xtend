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
	
	def recogerItem(AccionRecogerItem accionItem) {
		inventario.add(accionItem.itemARecoger)
		habitacionActual.removerAccion(accionItem)
	}
	
	def cantidadDeItems() {
		inventario.size
	}
	
	def moverseA(AccionDesplazamiento accionHabitacion) {
		var habitacionAnterior = habitacionActual
		habitacionActual = accionHabitacion.proximaHabitacion
		habitacionAnterior.removerAccion(accionHabitacion)
	}
	
	def usarItem(Item itemAUsar, AccionUsarItem accion) {
		if(itemAUsar.nombre == accion.itemEsperado){
			habitacionActual.agregarAccion(accion.accionResultante)
			habitacionActual.removerAccion(accion)
		}
		else{
			throw new ItemNoEncontradoException()
		}
		
	}
	
	def void abandonarLaberinto(){
		//TODO: VER DESPUES!
	}
	
}

class ItemNoEncontradoException extends Exception{
	new(){
	super("No tienes el item esperado!")}
}
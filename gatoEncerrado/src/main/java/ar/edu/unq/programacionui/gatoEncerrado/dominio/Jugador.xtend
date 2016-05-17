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
	
	def usarItem(AccionUsarItem accion) {
		if(this.estaEnElInventario(accion.itemEsperado)){
			habitacionActual.agregarAccion(accion.accionResultante)
			habitacionActual.removerAccion(accion)
		}
		else{
			throw new ItemNoEncontradoException()
		}
		
	}
	
	def estaEnElInventario(Item item) {
		inventario.exists[i | i.nombre == item.nombre]
	}
	
	def void abandonarLaberinto(){
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
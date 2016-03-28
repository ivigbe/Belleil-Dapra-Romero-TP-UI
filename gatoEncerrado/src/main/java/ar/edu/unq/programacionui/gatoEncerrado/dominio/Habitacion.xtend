package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Habitacion {
	
	List<Accion> acciones = newArrayList()
	List<Item> items = newArrayList()
	Boolean esHabitacionInicial
	Boolean esHabitacionFinal
	
	new(){}
	
	def void agregarAccion(Accion accion) {
		acciones.add(accion)
	}
	
	def void agregarItem(Item item){
		items.add(item)
	}
	
	def marcarComoInicial() {
		esHabitacionInicial = true
	}
	
	def marcarComoFinal() {
		esHabitacionFinal = true
		agregarAccion(new AccionSalirLaberinto())
	}
	
	def quitarItem(Item item) {
		items.remove(item)
	}
	
}
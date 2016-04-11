package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Habitacion {
	
	String nombreHabitacion
	List<Accion> acciones = newArrayList()
	List<Item> items = newArrayList()
	Boolean esHabitacionInicial
	Boolean esHabitacionFinal
	
	new(){}
	
	new(String nombreHabitacion){
		
		this.nombreHabitacion = nombreHabitacion
		this.esHabitacionInicial = false
		this.esHabitacionFinal = false
	}
	
	def void agregarAccion(Accion accion) {
		acciones.add(accion)
	}
	
	def removerAccion(Accion accion) {
		acciones.remove(accion)
	}
	
	def permitida(Accion accion){
		
		acciones.contains(accion)
	}
	
	def void agregarItem(Item item){
		
		items.add(item)
	}
	
	def marcarComoFinal() {
		esHabitacionFinal = true
		agregarAccion(new AccionSalirLaberinto())
	}
	
}
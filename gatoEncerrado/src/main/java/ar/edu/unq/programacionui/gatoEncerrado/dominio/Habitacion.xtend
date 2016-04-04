package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Habitacion {
	
	String nombreHabitacion
	List<Accion> acciones = newArrayList()
	Item itemAAgarrar
	List<Item> itemsAdmitidos = newArrayList()
	Boolean esHabitacionInicial
	Boolean esHabitacionFinal
	
	new(){}
	
	new(String nombreHabitacion){
		
		this.nombreHabitacion = nombreHabitacion
		this.itemAAgarrar = null
		this.esHabitacionInicial = false
		this.esHabitacionFinal = false
	}
	
	new(String nombreHabitacion, Item aItem){
		
		this.itemAAgarrar = aItem
		this.esHabitacionInicial = false
		this.esHabitacionFinal = false
	}
	
	def void agregarAccion(Accion accion) {
		acciones.add(accion)
	}
	
	def permitida(Accion accion){
		
		acciones.contains(accion)
	}
	
	def void admitirItem(Item item){
		
		itemsAdmitidos.add(item)
	}
	
	def marcarComoInicial() {
		esHabitacionInicial = true
	}
	
	def marcarComoFinal() {
		esHabitacionFinal = true
		agregarAccion(new AccionSalirLaberinto())
	}
	
	def admite(Item item) {
		itemsAdmitidos.contains(item)
	}
	
}
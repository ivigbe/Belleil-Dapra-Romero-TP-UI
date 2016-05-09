package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*


@Accessors
@Observable
class Habitacion {
	
	String nombreHabitacion
	Integer idHabitacion
	List<Accion> acciones = newArrayList()
	List<Item> items = newArrayList()
	Boolean esHabitacionInicial
	Boolean esHabitacionFinal
	Laberinto laberinto
	String pathImgHabitacion = "unPath"
	
	new(){
		
		this.esHabitacionInicial = false
		this.esHabitacionFinal = false
	}
	
	new(String nombreHabitacion, Laberinto laberinto){
		
		this.nombreHabitacion = nombreHabitacion
		this.esHabitacionInicial = false
		this.esHabitacionFinal = false
		this.laberinto = laberinto
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
	
	def setEsHabitacionInicial(Boolean b){
		if(b){
			laberinto.validarSiHayHabitacionInicial()	
		}
		this.esHabitacionInicial = b
		firePropertyChanged(this,"habitacionSeleccionada.esHabitacionInicial", b)
		
	}
	
	def setEsHabitacionFinal(Boolean b){
		if(b){
			laberinto.validarSiHayHabitacionFinal()	
		}
		this.esHabitacionFinal = b
		firePropertyChanged(this,"habitacionSeleccionada.esHabitacionFinal", b)
		
	}
	
}
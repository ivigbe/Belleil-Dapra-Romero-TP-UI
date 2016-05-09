package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Accion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class IndexAdministradorAppModel{
	
	Administrador admin
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Accion accionSeleccionada
	
	new(){}
	new(Administrador administrador, Laberinto laberinto, Habitacion habitacion){
		admin = administrador
		laberintoSeleccionado = laberinto
		habitacionSeleccionada = habitacion
		admin.agregarLaberinto(laberinto)
		 
	}
	
	def void nuevoLaberinto(){
		var laberintoNuevo = new Laberinto("nuevo Laberinto", 1, "")
		this.laberintoSeleccionado = laberintoNuevo
		
		var habitacionNueva = new Habitacion("nueva Habitacion", laberintoNuevo)
		this.habitacionSeleccionada = habitacionNueva
		
		laberintoNuevo.agregarHabitacion(habitacionNueva)
		admin.agregarLaberinto(laberintoNuevo)
	}
	
	def void nuevaHabitacion(){
		
		laberintoSeleccionado.agregarHabitacion(new Habitacion("nueva Habitacion", laberintoSeleccionado))
	}
	
	def void quitarHabitacion(Habitacion h){
		
		laberintoSeleccionado.quitarHabitacion(h)
	}
	
	def void quitarAccion(Accion accion) {
		
		habitacionSeleccionada.removerAccion(accion)
	}
}
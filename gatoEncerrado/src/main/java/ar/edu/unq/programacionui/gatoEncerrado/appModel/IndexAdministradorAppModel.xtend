package ar.edu.unq.programacionui.gatoEncerrado.appModel

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Accion
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class IndexAdministradorAppModel {
	
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
		//accionSeleccionada = accion
		 
	}
	
	def void nuevoLaberinto(){
		
		admin.agregarLaberinto(new Laberinto("nuevo Laberinto"))
	}
	
	def void nuevaHabitacion(){
		
		laberintoSeleccionado.agregarHabitacion(new Habitacion("nueva Habitacion"))
	}
	
	def void quitarHabitacion(Habitacion h){
		
		laberintoSeleccionado.quitarHabitacion(h)
	}
	
	def void quitarAccion(Accion accion) {
		
		habitacionSeleccionada.removerAccion(accion)
	}
	
}
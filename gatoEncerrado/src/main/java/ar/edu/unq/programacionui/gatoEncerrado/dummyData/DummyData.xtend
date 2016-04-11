package ar.edu.unq.programacionui.gatoEncerrado.dummyData

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento

class DummyData {
	
	def crearLaberintoDummy(){
		new Laberinto => [
			nombreLaberinto = "Laberinto default"
			agregarHabitacion(crearHabitacionDummy("Habitacion Inicial"))
		]
	}
	
	def crearAdminDummy(){
		
		new Administrador => [
			
			nombre = "Juan"
		]
	}
	
	def crearAccionDummy(Habitacion prox){
		
		new AccionDesplazamiento(prox)
	}
	
	def crearHabitacionDummy(String nombre){
		new Habitacion => [
			nombreHabitacion = nombre
			agregarAccion(crearAccionDummy(it))
		]
		
	}
	
}
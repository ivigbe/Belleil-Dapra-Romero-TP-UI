package ar.edu.unq.programacionui.gatoEncerrado.dummyData

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador

class DummyData {
	
	def crearLaberintoDummy(){
		new Laberinto => [
			nombreLaberinto = "Laberinto default"
			agregarHabitacion(crearHabitacionDummy)
		]
	}
	
	def crearAdminDummy(){
		
		new Administrador => [
			
			nombre = "Juan"
		]
	}
	
	def crearHabitacionDummy(){
		new Habitacion => [
			nombreHabitacion = "Living"
			
		]
		
	}
	
}
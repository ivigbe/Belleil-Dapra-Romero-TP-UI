package ar.edu.unq.programacionui.gatoEncerrado.dummyData

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento

class DummyData {
	
	def crearLaberintoDummy(){
		new Laberinto => [
			nombreLaberinto = "Laberinto default"
			agregarHabitacion(crearHabitacionDummy("Habitacion Inicial", it))
		]
	}
	
	def crearAdminDummy(){
		
		new Administrador => [
			
			nombre = "Juan"
		]
	}
	
	def crearAccionDummy(Habitacion prox){
		
		new AccionDesplazamiento(1,prox,prox)
	}
	
	def crearHabitacionDummy(String nombre, Laberinto l){
		new Habitacion => [
			nombreHabitacion = nombre
			laberinto = l
			agregarAccion(crearAccionDummy(it))
		]
		
	}
	
}
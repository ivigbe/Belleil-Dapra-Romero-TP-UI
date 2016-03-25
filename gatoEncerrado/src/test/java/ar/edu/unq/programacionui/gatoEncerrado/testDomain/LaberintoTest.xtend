package ar.edu.unq.programacionui.gatoEncerrado.testDomain

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*

class LaberintoTest {
	
	Laberinto laberinto1
	Habitacion habInicial
	Habitacion habFinal
	Habitacion hab2
	Habitacion hab3
	
	@Before
	def void setUp(){
		
		laberinto1 = new Laberinto()
		habInicial = new Habitacion()
		hab2 = new Habitacion()
		hab3 = new Habitacion()
		habFinal = new Habitacion()
	}
	
	@Test
	def void testSeAgregaUnaHabitacionAlLaberinto(){
		
		laberinto1.agregarHabitacion(habInicial)
		laberinto1.agregarHabitacion(hab2)
		laberinto1.agregarHabitacion(hab3)
		laberinto1.agregarHabitacion(habFinal)
		
		assertEquals(laberinto1.cantidadDeHabitaciones, 4)
		
	}
}
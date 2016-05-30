package ar.edu.unq.programacionui.gatoEncerrado.testDomain

import org.junit.Before
import org.junit.Test
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionGanarLaberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Jugador
import static org.junit.Assert.*
import ar.edu.unq.programacionui.gatoEncerrado.dominio.LaberintoAbandonadoException

class SimulacionJuegoTest {
	
	Jugador jugador
	Laberinto laberinto
	Habitacion habitacion1
	Habitacion habitacion2
	Habitacion habitacion3
	Habitacion habitacion4
	AccionDesplazamiento accionDesplazamiento
	AccionRecogerItem accionRecogerItem
	AccionDesplazamiento accionDesplazamiento2
	AccionUsarItem accionUsarItem
	AccionGanarLaberinto accionGanarLaberinto	
	Item pala
	
	@Before
	def void setUp(){
		
		laberinto = new Laberinto("Casa embrujada", 1, "casaEmbrujada.jpg", "Casa embrujada de transilvania")
		
		habitacion1 = new Habitacion(1, "Cocina", laberinto)
		habitacion2 = new Habitacion(2, "Banio", laberinto)
		habitacion3 = new Habitacion(3, "Comedor", laberinto)
		habitacion4 = new Habitacion(4, "Patio", laberinto)
		
		pala = new Item("Pala", "Para cavar")
		
		accionDesplazamiento = new AccionDesplazamiento(1, habitacion1, habitacion2)
		accionRecogerItem = new AccionRecogerItem(2, habitacion2, pala)
		accionDesplazamiento2 = new AccionDesplazamiento(1, habitacion2, habitacion3)
		accionUsarItem = new AccionUsarItem(3, habitacion3, pala, new AccionDesplazamiento(7, habitacion3, habitacion4))
		accionGanarLaberinto = new AccionGanarLaberinto(4, habitacion4)
		
		jugador = new Jugador(habitacion1)
		
		
		laberinto.agregarHabitacion(habitacion1)
		laberinto.agregarHabitacion(habitacion2)
		laberinto.agregarHabitacion(habitacion3)
		laberinto.agregarHabitacion(habitacion4)
		laberinto.agregarJugador(jugador)
		
		habitacion1.esHabitacionInicial = true
		habitacion1.agregarAccion(accionDesplazamiento)
		habitacion2.agregarAccion(accionRecogerItem)
		habitacion2.agregarAccion(accionDesplazamiento2)
		habitacion3.agregarAccion(accionUsarItem)
		habitacion4.esHabitacionFinal = true
		habitacion4.agregarAccion(accionGanarLaberinto)
	}
	
	@Test
	def void testComienzoDelJuego(){
		jugador.realizarAccion(accionDesplazamiento)
		assertEquals(jugador.habitacionActual, habitacion2)
	}
	
	@Test
	def void testSegundaHabitacion(){
		jugador.realizarAccion(accionRecogerItem)
		assertEquals(jugador.inventario.size, 1)
	}
	
	@Test 
	def void testSegundaHabitacionATercera(){
		jugador.realizarAccion(accionDesplazamiento2)
		assertEquals(jugador.habitacionActual, habitacion3)
	}
	
	@Test
	def void testTercerHabitacion(){
		jugador.realizarAccion(accionRecogerItem)
		jugador.realizarAccion(accionUsarItem)
		assertEquals(0, jugador.inventario.size)
		assertEquals(habitacion3.acciones.size, 1)
	}
	
	@Test 
	def void testAccionResultanteTercerHabitacion(){
		jugador.realizarAccion(accionRecogerItem)
		jugador.realizarAccion(accionUsarItem)
		jugador.realizarAccion(habitacion3.acciones.get(0))
		assertEquals(jugador.habitacionActual, habitacion4)
	}
	
	@Test 
	def void testCuartaHabitacion(){
		jugador.realizarAccion(accionGanarLaberinto)
		assertEquals(jugador.laberintosSuperados.size, 1)
	}
	
	
	@Test(expected = LaberintoAbandonadoException)
	def void testAbandonarLaberinto(){
		jugador.abandonarLaberinto
		assertEquals(jugador.laberintosAbandonados.size, 1)
	}
}
package ar.edu.unq.programacionui.gatoEncerrado.testDomain

import org.junit.Before
import org.junit.Test
import static org.junit.Assert.*
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Jugador
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem

class JugadorTest {
	
	Jugador unJugador
	Habitacion habitacionActual
	Habitacion habitacion2
	Item pala
	Item llave
	Item linterna
	AccionDesplazamiento siguienteHabitacion
	AccionRecogerItem recogerItem
	
	@Before
	def void setUp(){
		
		habitacionActual = new Habitacion()
		habitacion2 = new Habitacion()
		unJugador = new Jugador(habitacionActual)
		pala = new Item()
		llave = new Item()
		linterna = new Item()
		siguienteHabitacion = new AccionDesplazamiento()
		recogerItem = new AccionRecogerItem()
		
		habitacionActual.agregarItem(pala)
		habitacionActual.agregarItem(llave)
		habitacionActual.agregarItem(linterna)
		
		habitacionActual.agregarAccion(siguienteHabitacion)
		habitacionActual.agregarAccion(recogerItem)
	}
	
	@Test
	def void testAgarroUnaPalaEnLaHabitacionActual(){
		
		unJugador.recogerItem(pala)
		
		assertTrue(unJugador.cantidadDeItems == 1)
		assertTrue(habitacionActual.items.size == 2)
	}
	
	@Test
	def void testMeMuevoALaSiguienteHabitacionHabilitada(){
		
		unJugador.moverseA(habitacion2)
		
		assertEquals(unJugador.habitacionActual, habitacion2)
	}
}
package ar.edu.unq.programacionui.gatoEncerrado.testDomain
//
//import org.junit.Before
//import org.junit.Test
//import static org.junit.Assert.*
//import ar.edu.unq.programacionui.gatoEncerrado.dominio.Jugador
//import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
//import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
//import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
//import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
//import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
//
class JugadorTest {
//	
//	Jugador unJugador
//	Habitacion habitacionActual
//	Habitacion habitacion2
//	Item pala
//	Item llave
//	AccionDesplazamiento siguienteHabitacion
//	AccionRecogerItem recogerItem
//	AccionUsarItem usarItem
//	
//	@Before
//	def void setUp(){
//		
//		siguienteHabitacion = new AccionDesplazamiento()
//		recogerItem = new AccionRecogerItem()
//		usarItem = new AccionUsarItem()
//		
//		pala = new Item("Pala", "Para pasar a habitacion 2")
//		llave = new Item("Llave", "Para abrir otra puerta")
//		
//		habitacionActual = new Habitacion()
//		habitacion2 = new Habitacion()
//		
//		habitacionActual.agregarAccion(siguienteHabitacion)
//		habitacionActual.agregarAccion(recogerItem)
//		habitacionActual.agregarAccion(usarItem)
//		
//		unJugador = new Jugador(habitacionActual)
//	}
//	
//	@Test
//	def void testAgarroUnaPalaEnLaHabitacionActual(){
//		
//		unJugador.recogerItem(pala)
//		
//		assertTrue(unJugador.cantidadDeItems == 1)
//	}
//	
//	@Test
//	def void testMeMuevoALaSiguienteHabitacionHabilitada(){
//		
//		unJugador.moverseA(habitacion2)
//		
//		assertEquals(unJugador.habitacionActual, habitacion2)
//	}
//	
//	@Test
//	def void testUsoLaPalaYSeHabilitaAgarrarLaLlave(){
//		
//		unJugador.usarItem(pala)
//		
//		assertTrue(unJugador.cantidadDeItems == 0)
//	}
}
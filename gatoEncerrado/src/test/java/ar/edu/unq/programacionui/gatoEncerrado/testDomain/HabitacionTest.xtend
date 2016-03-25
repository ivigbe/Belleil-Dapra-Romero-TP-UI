package ar.edu.unq.programacionui.gatoEncerrado.testDomain

import org.junit.Before
import ar.edu.unq.programacionui.gatoEncerrado.dominio.*
import org.junit.Test
import static org.junit.Assert.*

class HabitacionTest {
	
	Habitacion habitacion
	Accion abrirPuerta
	Accion agarrarPala
	Accion agarrarLlaveMagica
	
	@Before
	def void setUp(){
		habitacion = new Habitacion()
		abrirPuerta = new AccionDesplazamiento()
		agarrarPala = new AccionRecogerItem()
		agarrarLlaveMagica = new AccionRecogerItem()
		
	}
	
	@Test
	def void testMarcoHabitacionComoInicial(){
		
		habitacion.marcarComoInicial()
		
		assertTrue(habitacion.esHabitacionInicial)
	}
	
	@Test
	def void testMarcoHabitacionComoFinal(){
		habitacion.marcarComoFinal()
		
		assertTrue(habitacion.esHabitacionFinal)
	}
	
	@Test
	def void testAgregoAccionesALaHabitacion(){
		habitacion.agregarAccion(abrirPuerta)
		habitacion.agregarAccion(agarrarPala)
		habitacion.agregarAccion(agarrarLlaveMagica)
		
		assertTrue(habitacion.acciones.size == 3)
	}
}
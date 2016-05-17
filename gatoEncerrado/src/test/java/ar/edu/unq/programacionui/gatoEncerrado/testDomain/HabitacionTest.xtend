package ar.edu.unq.programacionui.gatoEncerrado.testDomain

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Accion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import org.junit.Before
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
		abrirPuerta = new AccionDesplazamiento(1, habitacion, habitacion)
		//agarrarPala = new AccionRecogerItem(2)
		//agarrarLlaveMagica = new AccionRecogerItem()
		
	}
	
	@Test
	def void testMarcoHabitacionComoInicial(){
		
		habitacion.esHabitacionInicial = true
		
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
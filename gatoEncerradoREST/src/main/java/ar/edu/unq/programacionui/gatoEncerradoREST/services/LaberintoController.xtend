package ar.edu.unq.programacionui.gatoEncerradoREST.services

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Factory
import ar.edu.unq.programacionui.gatoEncerrado.dominio.DatosLaberintoFactory

@Accessors
@Controller
class LaberintoController {
	
	Administrador admin
	Factory factory
	DatosLaberintoFactory datosLaberinto
	Laberinto inicial
	
	new(){
		admin = new Administrador("Juan")
		factory = new Factory(admin.laberintos)
		datosLaberinto = new DatosLaberintoFactory()
	}
	
	extension JSONUtils = new JSONUtils
	
	@Get("/laberintos")
	def obtenerLaberintos(String idUsuario){
		var laberintos = factory.minificarLaberintos
		ok(laberintos.toJson)
	}
	
	@Get("/iniciarLaberinto")
	def iniciarLaberinto(String idUsuario, String idLaberinto){
		
		datosLaberinto.jugadorActual = admin.obtenerJugador(Integer.parseInt(idUsuario))
		var laberinto = admin.obtenerLaberinto(Integer.parseInt(idLaberinto))
		var res = datosLaberinto.minificar(laberinto)
		ok(res.toJson)
	}
	
	@Get("/realizarAccion")
	def realizarAccion(String idHabitacion, String idAccion, String idUsuario){
		
		var accion = admin.obtenerAccionAEjecutar(Integer.parseInt(idAccion))
		
		accion.realizarAccion()
		ok(accion.generarResultado(Integer.parseInt(idUsuario)).toJson)
	}
	
	def static void main(String[] args) {
		XTRest.start(LaberintoController, 9000)
	}
}
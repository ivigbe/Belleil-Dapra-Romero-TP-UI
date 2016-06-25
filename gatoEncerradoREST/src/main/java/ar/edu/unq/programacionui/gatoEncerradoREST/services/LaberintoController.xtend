package ar.edu.unq.programacionui.gatoEncerradoREST.services

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Factory

@Accessors
@Controller
class LaberintoController {
	
	Administrador admin
	Factory factory
	Laberinto inicial
	
	new(){
		admin = new Administrador("Juan")
		factory = new Factory(admin.laberintos, admin.obtenerJugador(1))
	}
	
	extension JSONUtils = new JSONUtils
	
	@Get("/laberintos")
	def obtenerLaberintos(String idUsuario){
		var laberintos = factory.minificarLaberintos
		ok(laberintos.toJson)
	}
	
	@Get("/laberintosMobile")
	def getLaberintosMobile(String idUsuario){
		
		var laberintosM = factory.minificarLaberintosMobile
		ok(laberintosM.toJson)
	}
	
	@Get("/inventario")
	def getInventario(String idUsuario){
		var inventario = admin.inventario
		ok(inventario.toJson)
	}
	
	@Get("/iniciarLaberinto")
	def iniciarLaberinto(String idUsuario, String idLaberinto){
		
		factory.jugadorActual = admin.obtenerJugador(Integer.parseInt(idUsuario))
		var laberinto = admin.obtenerLaberinto(Integer.parseInt(idLaberinto))
		var res = factory.minificarParaIniciar(laberinto)
		ok(res.toJson)
	}
	
	@Get("/realizarAccion")
	def realizarAccion(String idHabitacion, String idAccion, String idUsuario){
		
		var accion = admin.obtenerAccionAEjecutar(Integer.parseInt(idAccion))
		
		accion.realizarAccion()
		ok(accion.generarResultado(Integer.parseInt(idUsuario)).toJson)
	}
	
	def static void main(String[] args) {
		XTRest.start(LaberintoController, 9500)
	}
}
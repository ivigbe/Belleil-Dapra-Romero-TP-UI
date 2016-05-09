package ar.edu.unq.programacionui.gatoEncerradoREST.services

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import ar.edu.unq.programacionui.gatoEncerrado.dominio.LaberintosFactory

@Accessors
@Controller
class LaberintoController {
	
	Administrador admin
	LaberintosFactory factory
	Laberinto inicial
	
	new(){
		admin = new Administrador("Juan")
		factory = new LaberintosFactory(admin.laberintos)
	}
	
	extension JSONUtils = new JSONUtils
	
	@Get("/laberintos")
	def obtenerLaberintos(Integer idUsuario){
		var laberintos = factory.minificarLaberintos
		ok(laberintos.toJson)
	}
	
	@Get("iniciarLaberinto")
	def iniciarLaberinto(Integer idUsuario, Integer idLaberinto){
		
		
	}
	
	def static void main(String[] args) {
		XTRest.start(LaberintoController, 9000)
	}
}
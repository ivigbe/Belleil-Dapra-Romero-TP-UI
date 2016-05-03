package ar.edu.unq.programacionui.gatoEncerradoREST.services

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador

@Accessors
@Controller
class LaberintoController {
	
	Administrador admin
	
	extension JSONUtils = new JSONUtils
	
	@Get("/laberintos")
	def obtenerLaberintos(int idUsuario){
	}
}
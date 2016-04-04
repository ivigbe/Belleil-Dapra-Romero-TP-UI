package ar.edu.unq.programacionui.gatoEncerrado.app

import org.uqbar.arena.Application
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import ar.edu.unq.programacionui.gatoEncerrado.windows.AdministradorWindow

class GatoEncerradoApplication extends Application{
	
	override protected createMainWindow() {
		new AdministradorWindow(this, new Administrador)
	}
	
	def static main(String[] args) {
		new GatoEncerradoApplication().start
	}
}
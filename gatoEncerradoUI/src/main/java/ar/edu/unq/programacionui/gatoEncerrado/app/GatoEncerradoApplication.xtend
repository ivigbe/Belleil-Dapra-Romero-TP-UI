package ar.edu.unq.programacionui.gatoEncerrado.app

import ar.edu.unq.programacionui.gatoEncerrado.appModel.IndexAdministradorAppModel
import ar.edu.unq.programacionui.gatoEncerrado.dummyData.DummyData
import ar.edu.unq.programacionui.gatoEncerrado.windows.AdministradorWindow
import org.uqbar.arena.Application

class GatoEncerradoApplication extends Application{
	
	override protected createMainWindow() {
		var dummyData = new DummyData()
		new AdministradorWindow(this, new IndexAdministradorAppModel(dummyData.crearAdminDummy, dummyData.crearLaberintoDummy, dummyData.crearHabitacionDummy))
		
	}
	
	def static main(String[] args) {
		new GatoEncerradoApplication().start
	}
}
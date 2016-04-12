package ar.edu.unq.programacionui.gatoEncerrado.app

import ar.edu.unq.programacionui.gatoEncerrado.appModel.IndexAdministradorAppModel
import ar.edu.unq.programacionui.gatoEncerrado.dummyData.DummyData
import ar.edu.unq.programacionui.gatoEncerrado.windows.AdministradorWindow
import org.uqbar.arena.Application

class GatoEncerradoApplication extends Application {

	override protected createMainWindow() {
		var dummyData = new DummyData()
		var laberintoDummy = dummyData.crearLaberintoDummy
		var habitacionDummy = laberintoDummy.habitaciones.get(0)
		new AdministradorWindow(this,
			new IndexAdministradorAppModel(dummyData.crearAdminDummy, laberintoDummy, habitacionDummy))

	}

	def static main(String[] args) {
		new GatoEncerradoApplication().start
	}
}

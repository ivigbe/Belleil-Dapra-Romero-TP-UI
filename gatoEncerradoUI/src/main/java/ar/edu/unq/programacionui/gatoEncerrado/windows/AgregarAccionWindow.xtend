package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionDesplazamientoAppModel
import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionRecogerItemAppModel
import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionUsarElementoAppModel
import ar.edu.unq.programacionui.gatoEncerrado.appModel.AgregarAccionAppModel
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem

class AgregarAccionWindow extends Dialog<AgregarAccionAppModel> {

	new(WindowOwner parent, AgregarAccionAppModel model) {
		super(parent, model)
		title = "Agregar Accion"
	}

	override protected addActions(Panel actionsPanel) {
	}

	override protected createFormPanel(Panel mainPanel) {

		this.crearAgregarAccionTemplate(mainPanel)
	}

	def void crearAgregarAccionTemplate(Panel mainPanel) {

		val headerPanel = new Panel(mainPanel)
		headerPanel.layout = new HorizontalLayout()
		new Label(headerPanel).text = "Selecciona una accion a agregar"

		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout()

		new Button(buttonPanel) => [

			caption = "Agregar accion de ir a otra Habitacion"
			onClick [|this.abrirVentanaDeAccionIrAOtraHabitacion()]
		]

		new Button(buttonPanel) => [

			caption = "Agregar accion de agarrar un elemento"
			onClick [|abrirVentanaDeAccionAgarrarElemento()]
		]

		new Button(buttonPanel) => [

			caption = "Agregar accion de usar un elemento"
			onClick [|abrirVentanaDeAccionUsarItem]
		]
	}

	def abrirVentanaDeAccionIrAOtraHabitacion() {

		new AccionIrAOtraHabitacionWindow(this,
			new AccionDesplazamientoAppModel(this.modelObject.habitaciones, this.modelObject.habitacionSeleccionada,
				new AccionDesplazamiento())).open

		this.accept
	}

	def abrirVentanaDeAccionAgarrarElemento() {

		new AccionAgarrarElementoWindow(this,
			new AccionRecogerItemAppModel(this.modelObject.habitacionSeleccionada, new AccionRecogerItem())).open

		this.accept
	}

	def abrirVentanaDeAccionUsarItem() {
		new AccionUsarElementoWindow(this,
			new AccionUsarElementoAppModel(this.modelObject.habitacionSeleccionada, this.modelObject.itemsDelLaberinto,
				new AccionUsarItem())).open
				
		this.accept
	}
}

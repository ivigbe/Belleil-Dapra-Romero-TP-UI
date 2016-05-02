package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionDesplazamientoConsecuenteAppModel
import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionRecogerItemConsecuenteAppModel
import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionUsarElementoConsecuenteAppModel
import ar.edu.unq.programacionui.gatoEncerrado.appModel.AgregarAccionConsecuenteAppModel
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

class AgregarAccionConsecuenteWindow extends Dialog<AgregarAccionConsecuenteAppModel> {

	new(WindowOwner owner, AgregarAccionConsecuenteAppModel model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
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

		new AccionIrAOtraHabitacionConsecuenteWindow(this,
			new AccionDesplazamientoConsecuenteAppModel(this.modelObject.accionOriginal, this.modelObject.habitaciones,
				new AccionDesplazamiento())).open

		this.accept
	}

	def abrirVentanaDeAccionAgarrarElemento() {

		new AccionAgarrarElementoConsecuenteWindow(this,
			new AccionRecogerItemConsecuenteAppModel(this.modelObject.accionOriginal, new AccionRecogerItem())).open

		this.accept
	}

	def abrirVentanaDeAccionUsarItem() {
		new AccionUsarElementoConsecuenteWindow(this,
			new AccionUsarElementoConsecuenteAppModel(this.modelObject.accionOriginal,
				this.modelObject.listItemsDelLaberintoSinItemAUsar(), this.modelObject.habitaciones,
				new AccionUsarItem())).open

		this.accept
	}

}

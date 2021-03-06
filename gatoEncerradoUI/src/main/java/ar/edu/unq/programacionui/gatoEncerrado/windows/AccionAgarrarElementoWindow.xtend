package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionRecogerItemAppModel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.commons.model.UserException

class AccionAgarrarElementoWindow extends Dialog<AccionRecogerItemAppModel> {

	new(WindowOwner parent, AccionRecogerItemAppModel model) {
		super(parent, model)
		title = "Agregar accion de Agarrar un elemento"
	}

	override protected addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [|agregarAccionAListaDeAcciones()] 
		]

		new Button(actionsPanel) => [
			caption = "Cancelar"
			onClick [|this.cancel]
		]
	}

	override protected createFormPanel(Panel mainPanel) {

		this.crearAgregarAccionTemplate(mainPanel)
	}

	def crearAgregarAccionTemplate(Panel mainPanel) {

		val headerPanel = new Panel(mainPanel)
		headerPanel.layout = new HorizontalLayout()
		new Label(headerPanel).text = "Escriba el elemento que aparecera en la habitacion"

		val bodyPanel = new Panel(mainPanel)
		bodyPanel.layout = new HorizontalLayout()

		new TextBox(bodyPanel) => [

			value <=> "itemNuevo.nombre"
		]
	}

	def agregarAccionAListaDeAcciones() {
		if(this.modelObject.itemNuevo.nombre == null){
			throw new UserException("Es obligatorio ingresar un nombre de item")
		}
		this.modelObject.habitacionSeleccionada.agregarItem(this.modelObject.itemNuevo)
		this.modelObject.darDescripcionAccion()
		this.modelObject.habitacionSeleccionada.agregarAccion(this.modelObject.accionDeRecogerItem)
		
		this.accept
	}
}

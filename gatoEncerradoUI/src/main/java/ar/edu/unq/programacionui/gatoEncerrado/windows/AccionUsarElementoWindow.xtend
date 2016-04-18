package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionUsarElementoAppModel
import ar.edu.unq.programacionui.gatoEncerrado.appModel.AgregarAccionConsecuenteAppModel
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Item
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AccionUsarElementoWindow extends Dialog<AccionUsarElementoAppModel> {

	new(WindowOwner owner, AccionUsarElementoAppModel model) {
		super(owner, model)
		title = "Agregar accion de usar elemento"
	}

	override protected createFormPanel(Panel mainPanel) {

		var headerPanel = new Panel(mainPanel)
		headerPanel.layout = new HorizontalLayout
		new Label(headerPanel).text = "Seleccione el elemento que puede ser usado"

		var selectorPanel = new Panel(mainPanel)
		selectorPanel.layout = new HorizontalLayout
		new Selector(selectorPanel) => [
			(items <=> "itemsDelLaberinto").adapter = new PropertyAdapter(Item, "nombre")
			value <=> "accionDeUsarItem.itemEsperado"
		]

		var accionPanel = new Panel(mainPanel)
		accionPanel.layout = new VerticalLayout
		new Label(accionPanel).text = "Cree la accion a realizar"

		new Button(accionPanel) => [
			caption = "Agregar accion"
			onClick [| abrirVentanaDeAgregarAccionConsecuente]
		]

		new Label(accionPanel).text = this.modelObject.darDescripcionDeAccion
		
		val buttonPanel = new Panel(mainPanel).layout = new HorizontalLayout

		new Button(buttonPanel) => [

			caption = "Cancelar"
			onClick [|this.cancel]
		]

		new Button(buttonPanel) => [

			caption = "Agregar"
			onClick [|this.agregarAccion()]
		]

	}

	def agregarAccion() {
		this.modelObject.habitacionSeleccionada.agregarAccion(this.modelObject.accionDeUsarItem)
		this.modelObject.setDescripcionAccion()

		this.accept
	}

	def abrirVentanaDeAgregarAccionConsecuente() {

		new AgregarAccionConsecuenteWindow(this,
			new AgregarAccionConsecuenteAppModel(
				this.modelObject.accionDeUsarItem, this.modelObject.obtenerHabitaciones)).open
	}
}

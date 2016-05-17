package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.appModel.AccionDesplazamientoAppModel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion

class AccionIrAOtraHabitacionWindow extends Dialog<AccionDesplazamientoAppModel>{
	
	new(WindowOwner parent, AccionDesplazamientoAppModel model) {
		super(parent, model)
		title = "Agregar Accion de ir a otra Habitacion"
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			
			caption = "Aceptar"
			onClick [| this.agregarAccionAListadoDeAcciones()]
		]
		
		new Button(actionsPanel) => [
			
			caption = "Cancelar"
			onClick [| this.cancel]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new VerticalLayout()
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout()
		
		new Label(mainPanel).text = "Selecciona una habitacion a la cual ir"
		new Selector(mainPanel) => [
			
			(items <=> "habitacionesDesplazamiento").adapter = new PropertyAdapter(Habitacion, "nombreHabitacion")
			value <=> "accionDespl.proximaHabitacion"
		] //SELECTOR
	}
	
	def agregarAccionAListadoDeAcciones() {
		
		this.modelObject.darDescripcionAccion()
			
			this.modelObject.habitacionActualSeleccionada.agregarAccion(this.modelObject.accionDespl)
		
		this.accept
	}
	
}
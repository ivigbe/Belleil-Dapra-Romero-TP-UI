package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AccionIrAOtraHabitacionWindow extends TransactionalDialog<AccionDesplazamiento>{
	
	new(WindowOwner parent, AccionDesplazamiento model) {
		super(parent, model)
		title = "Agregar Accion de ir a otra Habitacion"
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			
			caption = "Aceptar"
			onAccept [| ]
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
			
			items <=> "habitacionesLindantes"
			value <=> "habitacionAMoverse"
		]
	}
	
}
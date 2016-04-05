package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button

class AccionIrAOtraHabitacionWindow extends SimpleWindow<AccionDesplazamiento>{
	
	new(WindowOwner parent, AccionDesplazamiento model) {
		super(parent, model)
		title = "Agregar Accion de ir a otra Habitacion"
	}
	
	override protected addActions(Panel actionsPanel) {
		
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
		
		new Button(buttonPanel) => [
			
			
		]
	}
	
}
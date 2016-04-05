package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionDesplazamiento
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion

class AgregarAccionWindow extends SimpleWindow<Habitacion>{
	
	new(WindowOwner parent, Habitacion model) {
		super(parent, model)
		title = "Agregar Accion"
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
	def void crearAgregarAccionTemplate(Panel mainPanel){
		
		mainPanel.layout = new HorizontalLayout()
		val buttonPanel = new Panel(mainPanel)
		buttonPanel.layout = new HorizontalLayout()
		
		new Label(mainPanel).text = "Selecciona una accion a agregar"
		
		new Button(buttonPanel) => [
			
			caption = "Agregar accion de ir a otra Habitacion"
			onClick [| new AccionIrAOtraHabitacionWindow(this, new AccionDesplazamiento()).open]
		]
		
		new Button(buttonPanel) => [
			
			caption = "Agregar accion de agarrar un elemento"
			onClick [| new AccionAgarrarElementoWindow(this, new AccionRecogerItem()).open]
		]
		
		new Button(buttonPanel) => [
			
			caption = "Agregar accion de usar un elemento"
			onClick [| new AccionUsarElementoWindow(this, new AccionUsarItem()).open]
		]
	}
}
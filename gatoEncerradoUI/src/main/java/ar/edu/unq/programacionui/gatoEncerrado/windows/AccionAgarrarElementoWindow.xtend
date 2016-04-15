package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionRecogerItem
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AccionAgarrarElementoWindow extends TransactionalDialog<AccionRecogerItem>{
	
	new(WindowOwner parent, AccionRecogerItem model) {
		super(parent, model)
		title = "Agregar accion de Agarrar un elemento"
	}
	
	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onAccept [| ]//TODO: HACER ALGO PARECIDO A LA PANTALLA DE IR A OTRA HABITACION.
			disableOnError
		]

		new Button(actionsPanel) => [
			caption = "Cancelar"	
			onClick [| this.cancel]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		this.crearAgregarAccionTemplate(mainPanel)
	}
	
	def crearAgregarAccionTemplate(Panel mainPanel){
		
		val headerPanel = new Panel(mainPanel)
		headerPanel.layout = new HorizontalLayout()
		new Label(headerPanel).text = "Escriba el elemento que aparecera en la habitacion"
		
		val bodyPanel = new Panel(mainPanel)
		bodyPanel.layout = new HorizontalLayout()
		
		new TextBox(bodyPanel) => [
			
			value <=> "itemARecoger.nombre"
		]
	}
}
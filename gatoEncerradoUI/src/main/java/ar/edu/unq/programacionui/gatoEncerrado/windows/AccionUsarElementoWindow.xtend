package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.dominio.AccionUsarItem
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

class AccionUsarElementoWindow extends SimpleWindow<AccionUsarItem>{
	
	new(WindowOwner parent, AccionUsarItem model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
	}
	
}
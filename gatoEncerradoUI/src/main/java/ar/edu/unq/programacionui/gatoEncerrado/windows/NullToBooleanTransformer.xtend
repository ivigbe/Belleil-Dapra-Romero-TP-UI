package ar.edu.unq.programacionui.gatoEncerrado.windows

import org.uqbar.arena.bindings.ValueTransformer

class NullToBooleanTransformer implements ValueTransformer<Boolean, Boolean> {
	
	override getModelType() {
		Boolean
	}
	
	override getViewType() {
		Boolean
	}
	
	override modelToView(Boolean valueFromModel) {
		if(valueFromModel == null) false else valueFromModel
	}
	
	override viewToModel(Boolean valueFromView) {
		valueFromView
	}
	
}
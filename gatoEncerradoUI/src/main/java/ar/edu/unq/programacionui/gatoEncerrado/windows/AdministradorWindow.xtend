package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.dominio.Administrador
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox

class AdministradorWindow extends SimpleWindow<Administrador>{
	
	new(WindowOwner parent, Administrador model) {
		super(parent, model)
		title = "Index administrador"
		taskDescription = "Aca hay gato encerrado"
	}
	
	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			
			caption = "Agregar Laberinto"
			onClick [| this.modelObject.nuevoLaberinto]
		]
		
		new Button(actionsPanel) => [
			
			caption = "Quitar Laberinto"
			onClick [| this.modelObject.quitarLaberinto(this.modelObject.laberintoSeleccionado)]
		]
		
		new Button(actionsPanel) => [
			
			caption = "Agregar Habitacion"
			onClick [| this.modelObject.nuevaHabitacion]
		]
		
		new Button(actionsPanel) => [
			
			caption = "Quitar Habitacion"
			onClick [| this.modelObject.quitarHabitacion(this.modelObject.habitacionSeleccionada)]
		]
		
		new Button(actionsPanel) => [
			
			caption = "Agregar Accion"
			onClick [| ] //TODO: Ver como relacionar a pantalla de agregar una accion
		]
		
		//VER ESTA FUNCION
	}
	
	override protected createFormPanel(Panel mainPanel) {
		mainPanel.layout = new HorizontalLayout()
		
		val laberintosPanel = new Panel(mainPanel)
		laberintosPanel.layout = new VerticalLayout()
		
		new Label(laberintosPanel).text = "Laberintos"
		new List(laberintosPanel) => [
			
			allowNull = false
			items <=> "laberintos"
			value <=> "laberintoSeleccionado"
		]
		
		val habitacionesPanel = new Panel(mainPanel)
		habitacionesPanel.layout = new VerticalLayout()
		
		new Label(habitacionesPanel).text = "Habitaciones de: "
		new Label(habitacionesPanel).bindValueToProperty("laberintoSeleccionado.nombreLaberinto")
		
		new TextBox(habitacionesPanel) => [
			
			value <=> "laberintoSeleccionado.nombreLaberinto"
		]
		
		new List(habitacionesPanel) => [
			
			items <=> "laberintoSeleccionado.habitaciones"
			value <=> "habitacionSeleccionada"
		]
		
		val edicionHabitacionLabel = new Panel(mainPanel)
		edicionHabitacionLabel.layout = new VerticalLayout()
		
		new Label(edicionHabitacionLabel).text = "Habitaciones de: "
		new Label(edicionHabitacionLabel).bindValueToProperty("habitacionSeleccionada.nombreHabitacion")
		
		new TextBox(edicionHabitacionLabel) => [
			
			value <=> "habitacionSeleccionada.nombreHabitacion"
		]
		
		new CheckBox(mainPanel) => [
			
			value <=> "habitacionSeleccionada.esHabitacionInicial"
		]
		
		new Label(mainPanel).text = "Es Inicial?"
		
		new CheckBox(mainPanel) => [
			
			value <=> "habitacionSeleccionada.esHabitacionFinal"
		]
		new Label(mainPanel).text = "Es Final?"
		
		new Label(edicionHabitacionLabel).text = "Acciones"
		
		new List(edicionHabitacionLabel) => [
			
			items <=> "habitacionSeleccionada.acciones"
			value <=> "accionSeleccionada"
		]
	}
	
}
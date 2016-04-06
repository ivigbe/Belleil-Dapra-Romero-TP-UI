package ar.edu.unq.programacionui.gatoEncerrado.windows

import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.programacionui.gatoEncerrado.appModel.IndexAdministradorAppModel
import org.uqbar.arena.layout.ColumnLayout
import java.awt.Color

class AdministradorWindow extends SimpleWindow<IndexAdministradorAppModel>{
	
	new(WindowOwner parent, IndexAdministradorAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
	}
	
	override protected createFormPanel(Panel mainPanel) {
		
		mainPanel.layout = new VerticalLayout
		val headerPanel = new Panel(mainPanel)
		new Label(headerPanel) => [
			text = "Aca hay gato encerrado..."
			background = Color.RED
			width = 830 
			height = 50
		] 
		
		val contentPanel = new Panel(mainPanel)
		contentPanel.layout = new HorizontalLayout
		
		this.crearListadoDeLaberintos(contentPanel)
		
		this.crearListadoDeHabitaciones(contentPanel)
		
		this.crearListadoDeAcciones(contentPanel)
	}
	
	def void crearListadoDeLaberintos(Panel mainPanel){
		
		val laberintosPanel = new Panel(mainPanel)
		laberintosPanel.layout = new VerticalLayout()
		
		new Label(laberintosPanel).text = "Laberintos"
		new List(laberintosPanel) => [
			
			items <=> "admin.laberintos"
			value <=> "laberintoSeleccionado"
		]
		
		val laberintosButtonPanel = new Panel(laberintosPanel).layout = new HorizontalLayout()
		
		new Button(laberintosButtonPanel) => [
			
			caption = "Agregar Laberinto"
			onClick [| this.modelObject.nuevoLaberinto]
		]
		
		new Button(laberintosButtonPanel) => [
			
			caption = "Quitar Laberinto"
			onClick [| this.modelObject.admin.quitarLaberinto(this.modelObject.laberintoSeleccionado)]
		]
	}
	
	def void crearListadoDeHabitaciones(Panel mainPanel){
		
		val habitacionesPanel = new Panel(mainPanel)
		habitacionesPanel.layout = new VerticalLayout()
		
		new Label(habitacionesPanel).text = "Habitaciones de: "
		new Label(habitacionesPanel).value <=> "laberintoSeleccionado.nombreLaberinto"
		
		new TextBox(habitacionesPanel) => [
			
			value <=> "laberintoSeleccionado.nombreLaberinto"
		]
		
		new List(habitacionesPanel) => [
			
			items <=> "laberintoSeleccionado.habitaciones"
			value <=> "habitacionSeleccionada"
		]
		
		val habitacionesButtonPanel = new Panel(habitacionesPanel).layout = new HorizontalLayout()
		
		new Button(habitacionesButtonPanel) => [
			
			caption = "Agregar Habitacion"
			onClick [| this.modelObject.nuevaHabitacion] //TODO: VER TEMA ONCLICK DE TODOS LOS BOTONES MENOS EL AGREGAR ACCION.
		]
		
		new Button(habitacionesButtonPanel) => [
			
			caption = "Quitar Habitacion"
			onClick [| this.modelObject.quitarHabitacion(this.modelObject.habitacionSeleccionada)]
		]
	}
	
	def void crearListadoDeAcciones(Panel mainPanel){
		
		val edicionHabitacionPanel = new Panel(mainPanel)
		edicionHabitacionPanel.layout = new VerticalLayout()
		
		new Label(edicionHabitacionPanel).text = "Habitacion Seleccionada: "
		new Label(edicionHabitacionPanel).bindValueToProperty("habitacionSeleccionada.nombreHabitacion")
		
		new TextBox(edicionHabitacionPanel) => [
			
			value <=> "habitacionSeleccionada.nombreHabitacion"
		]
		
		val esInicialPanel = new Panel(edicionHabitacionPanel)
		esInicialPanel.layout = new ColumnLayout(2)
		
		new CheckBox(esInicialPanel) => [
			
			value <=> "habitacionSeleccionada.esHabitacionInicial"
		]
		
		new Label(esInicialPanel).text = "Es Inicial?"
		
		val esFinalPanel = new Panel(edicionHabitacionPanel).layout = new ColumnLayout(2)
		
		new CheckBox(esFinalPanel) => [
			
			value <=> "habitacionSeleccionada.esHabitacionFinal"
		]
		new Label(esFinalPanel).text = "Es Final?"
		
		new Label(edicionHabitacionPanel).text = "Acciones"
		
		new List(edicionHabitacionPanel) => [
			
			items <=> "habitacionSeleccionada.acciones"
			value <=> "accionSeleccionada"
		]
		
		val edicionHabitacionButtonPanel = new Panel(edicionHabitacionPanel).layout = new HorizontalLayout()
		
		new Button(edicionHabitacionButtonPanel) => [
			
			caption = "Agregar Accion"
			onClick [| new AgregarAccionWindow(this, this.modelObject.habitacionSeleccionada).open]
		]
		
		new Button(edicionHabitacionButtonPanel) => [
			
			caption = "Quitar Accion"
			onClick [| modelObject.quitarAccion(this.modelObject.accionSeleccionada)]
		]
	}
	
}
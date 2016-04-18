package ar.edu.unq.programacionui.gatoEncerrado.windows

import ar.edu.unq.programacionui.gatoEncerrado.appModel.AgregarAccionAppModel
import ar.edu.unq.programacionui.gatoEncerrado.appModel.IndexAdministradorAppModel
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Accion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Habitacion
import ar.edu.unq.programacionui.gatoEncerrado.dominio.Laberinto
import java.awt.Color
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
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
			
			text = "Hola " + this.modelObject.admin.nombre + "!" + " " + "Administra tus laberintos!"
		]
		
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
			
			(items <=> "admin.laberintos").adapter = new PropertyAdapter(Laberinto, "nombreLaberinto")
			value <=> "laberintoSeleccionado"
			height = 70
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
			
			(items <=> "laberintoSeleccionado.habitaciones").adapter = new PropertyAdapter(Habitacion, "nombreHabitacion")
			value <=> "habitacionSeleccionada"
			height = 70
		]
		
		val habitacionesButtonPanel = new Panel(habitacionesPanel).layout = new HorizontalLayout()
		
		new Button(habitacionesButtonPanel) => [
			
			caption = "Agregar Habitacion"
			onClick [| this.modelObject.nuevaHabitacion]
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
			
			(items <=> "habitacionSeleccionada.acciones").adapter = new PropertyAdapter(Accion, "descripcionAccion")
			value <=> "accionSeleccionada"
			height = 70
		]
		
		val edicionHabitacionButtonPanel = new Panel(edicionHabitacionPanel).layout = new HorizontalLayout()
		
		new Button(edicionHabitacionButtonPanel) => [
			
			caption = "Agregar Accion"
			onClick [| new AgregarAccionWindow(this, new AgregarAccionAppModel(this.modelObject.habitacionSeleccionada, this.modelObject.laberintoSeleccionado.itemsDeLasHabitaciones)).open]
		]
		
		new Button(edicionHabitacionButtonPanel) => [
			
			caption = "Quitar Accion"
			onClick [| modelObject.quitarAccion(this.modelObject.accionSeleccionada)]
		]
	}
	
}
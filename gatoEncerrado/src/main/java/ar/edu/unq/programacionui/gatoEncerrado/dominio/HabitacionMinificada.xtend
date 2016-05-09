package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class HabitacionMinificada {
	
	Integer idHabitacion
	List<Accion> acciones
	Boolean esInicial
	Boolean esFinal
	String pathImagenHabitacion
	
	new(Integer id, List<Accion> accs, Boolean esInicial, Boolean esFinal, String path){
		
		this.idHabitacion = id
		this.acciones = accs
		this.esInicial = esInicial
		this.esFinal = esFinal
		this.pathImagenHabitacion = path
	}
}
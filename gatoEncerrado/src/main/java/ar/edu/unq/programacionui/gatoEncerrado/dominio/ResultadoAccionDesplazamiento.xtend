package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ResultadoAccionDesplazamiento extends Resultado{
	
	Habitacion proximaHabitacionJugador
	
	new(Integer idUsuario, Habitacion prox) {
		super(idUsuario)
		this.proximaHabitacionJugador = prox
	}
}
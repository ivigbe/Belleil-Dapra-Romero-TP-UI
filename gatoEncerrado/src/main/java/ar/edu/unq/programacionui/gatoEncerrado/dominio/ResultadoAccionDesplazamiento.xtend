package ar.edu.unq.programacionui.gatoEncerrado.dominio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ResultadoAccionDesplazamiento extends Resultado{
	
	HabitacionMinificada proximaHabitacionJugador
	
	new(Integer idUsuario, HabitacionMinificada prox) {
		super(idUsuario)
		this.proximaHabitacionJugador = prox
	}
}
package ar.edu.unq.programacionui.gatoEncerrado.dominio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LaberintosFactory {
	List<Laberinto> laberintosAMinificar
	
	new(List<Laberinto> laberintos){
		
		laberintosAMinificar = laberintos
		
	}
	
	def minificarLaberintos(){
		var laberintosMinificados = newArrayList()
		for(l:laberintosAMinificar){
			laberintosMinificados.add(minificar(l))
		}
		return laberintosMinificados
	}
	
	def minificar(Laberinto laberinto) {
		return new LaberintoMinificado(laberinto.nombreLaberinto, laberinto.idLaberinto, laberinto.pathImgLaberinto)
	}
	
}

class DatosLaberintoFactory {
	
	List<Laberinto> laberintos
	
	new(List<Laberinto> ls){
		
		laberintos = ls
	}
	
	def minificarLaberintos(){
		var laberintosMinificados = newArrayList()
		for(l:laberintos){
			laberintosMinificados.add(minificar(l))
		}
		return laberintosMinificados
	}
	
	def minificar(Laberinto laberinto) {
		return new LaberintoMinificado(laberinto.idLaberinto, laberinto.habitaciones)
	}
}
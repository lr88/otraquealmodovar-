class Pelicula {
		
	var personajes = #{}
	var duracion = 10
	var guionDeLaPelicula 
	
	constructor(_guionDeLaPelicula,_duracion){
		guionDeLaPelicula = _guionDeLaPelicula
		duracion = _duracion
	}  
	 
	method play(){
		guionDeLaPelicula.reproducir()
	}
	
	method duracionDeLaPelicula(){
		return duracion
	}

	method alargarDuracion(valor){
		duracion += valor
	}
	
	method aregarPersonaje(unPersonaje){
		personajes.add(unPersonaje)
	}
	
	method sacarPersonaje(unPersonaje){
		personajes.remove(unPersonaje)
	}
	
	method personajes (){
		return personajes
	}

	method guionDeLaPelicula(){
		return guionDeLaPelicula
	}

	method corrioSangre(){
		return self.cantidadDeVivos() < self.personajes().size()/2
	}
	
	method cantidadDeVivos(){
		return personajes.filter({personaje => personaje.estoyVivo()}).size()
	}
	
	method hayUnPersonajeHombreVivoYFeliz(){
		return personajes.any({personaje => personaje.estoyFeliz()and personaje.sexo()== "hombre"and personaje.estoyVivo()})	
	}
	
	method hayUnPersonajeMujerVivoYFeliz(){
		return personajes.any({personaje => personaje.estoyFeliz()and personaje.sexo()== "mujer" and personaje.estoyVivo()})	
	}
	
	method esPochoclera(){
		return 	self.hayUnPersonajeHombreVivoYFeliz() and self.hayUnPersonajeMujerVivoYFeliz()
	}
	
	method personajesVivos(){
		return personajes.filter({personaje => personaje.estoyVivo()})
	}
	
	method tieneFinalFeliz(){
		return self.personajesVivos().all({personaje => personaje.estoyFeliz()})
	}
}












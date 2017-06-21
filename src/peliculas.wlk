class Pelicula {
		
	var personajes = []
	var duracion = 10
	var guionDeLaPelicula 
	var escenaFlashback = []
	
	constructor(_guionDeLaPelicula,_duracion){
		guionDeLaPelicula = _guionDeLaPelicula
		duracion = _duracion
	}  
	
	method play(){
		console.println("La conclusion  de esta pelicula es que")
		[guionDeLaPelicula , escenaFlashback].flatten().forEach({capitulo => capitulo.reproducir(self)})
		return [self.corrioSangre(),self.esPochoclera(),self.tieneFinalFeliz()]
	}
	
	method asd(){
		return [guionDeLaPelicula , escenaFlashback]
	}
	
	
	method aregarFlashback(unFlashback){
		escenaFlashback.add(unFlashback)
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
		return personajes + self.guionDeLaPelicula().escenas().map({escena => escena.personajesExtras()}).flatten()
		}

	method guionDeLaPelicula(){
		return guionDeLaPelicula
	}

	method corrioSangre(){
		if(self.cantidadDeVivos() < self.personajes().size()/2){
			console.println("Corrio Sangre")
		return true
		}
		else{
			return false
		} 
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
		if(self.hayUnPersonajeHombreVivoYFeliz() and self.hayUnPersonajeMujerVivoYFeliz()){
			console.println("es Pochoclera")
		return true
		}
		else{
			return false
		} 
	}
	
	method personajesVivos(){
		return personajes.filter({personaje => personaje.estoyVivo()})
	}
	
	method tieneFinalFeliz(){
		if(self.personajesVivos().all({personaje => personaje.estoyFeliz()})){
			console.println("Termina con un final feliz")
		return true
		}
		else{
			return false
		} 
	}
}












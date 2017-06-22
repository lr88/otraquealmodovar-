import escenas.*

class UserException inherits wollok.lang.Exception {
	constructor(_mensaje) = super(_mensaje)
}

class Pelicula {
		
	var personajes = #{}
	var duracion = 10
	var guionDeLaPelicula 
	var escenasFlashback
	
	constructor(_guionDeLaPelicula,_duracion){
		if(_duracion<0){
			throw new UserException("La duracion de la pelicula debe ser positiva ")
		}
		
		guionDeLaPelicula = _guionDeLaPelicula
		duracion = _duracion
	}  
	
	method play(){
		console.println("La conclusion  de esta pelicula es que")
		guionDeLaPelicula.reproducir(self)
		if(escenasFlashback!=null){
			escenasFlashback.reproducir(self)
		}
		return [self.corrioSangre(),self.esPochoclera(),self.tieneFinalFeliz()]
	}
	
	method aregarFlashback(unFlashback){
		escenasFlashback = unFlashback
	}
		
	method duracionDeLaPelicula(){
		return duracion
	}

	method alargarDuracion(valor){
		if(valor<0){
			throw new UserException("La duracion de alargue de la pelicula debe ser positiva ")
		}
		duracion += valor
	}
	
	method aregarPersonaje(unPersonaje){
		personajes.add(unPersonaje)
	}
	
	method sacarPersonaje(unPersonaje){
		if(!personajes.contains(unPersonaje)){
			throw new UserException("La duracion de alargue de la pelicula debe ser positiva ")
		}
		personajes.remove(unPersonaje)
	}
	
	method personajesDeLosGuiones(){
		return self.guionDeLaPelicula().escenas().map({escena => escena.personajesExtras()}).flatten()
	}
	
	method personajesDeLosFlashback(){
		return self.Flashback().escenas().map({escena => escena.personajesExtras()}).flatten()
	}
		
	method personajes (){
		if(escenasFlashback!=null){
		return personajes + self.personajesDeLosGuiones() + self.personajesDeLosFlashback()
		}
		else {
			return personajes + self.personajesDeLosGuiones()
		}
	}
	method guionDeLaPelicula(){
		return guionDeLaPelicula
	}

	method Flashback(){
		return escenasFlashback
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
		if(self.hayUnPersonajeHombreVivoYFeliz() and self.hayUnPersonajeMujerVivoYFeliz()and explocion.cantidadDeExplociones()>3){
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

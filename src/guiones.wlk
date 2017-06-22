class UserException inherits wollok.lang.Exception {
	constructor(_mensaje) = super(_mensaje)
}
class GuionDeLaPelicula {
	var escenas = [ ]

	method queLePasaALosPersonajes() {
		return self.escenas().map({escena => escena.queLePasaALosPersonajes()})
	}
  
	method reproducir(unaPelicula) {
		self.escenas().forEach({escena => escena.transcurrir(unaPelicula)})
	}

	method agregarEscena(unaEscena) {
		escenas.add(unaEscena)
	}
	
	method escenas(){
		if(escenas.size()==0){
			throw new UserException("El guion de la pelicula no tiene escenas cargadas")
		}
		return escenas
	}
}

class EscenaFlashback inherits GuionDeLaPelicula{

}
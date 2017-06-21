
class GuionDeLaPelicula {
	var escenas = [ ]

	method queLePasaALosPersonajes() {
		return escenas.map({ escena => escena.queLePasaALosPersonajes()})
	}
  
	method reproducir(unaPelicula) {
		escenas.forEach({escena => escena.transcurrir(unaPelicula)})
	}

	method agregarEscena(unaEscena) {
		escenas.add(unaEscena)
	}
	
	method escenas(){
		return escenas
	}
}

class EscenaFlashback inherits GuionDeLaPelicula{
	
	
}
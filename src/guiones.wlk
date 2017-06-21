
class GuionDeLaPelicula {
	var escenas = [ ]

	method queLePasaALosPersonajes() {
		return escenas.map({ escena => escena.queLePasaALosPersonajes() })
	}
  
	method reproducir() {
		escenas.forEach({ escena => escena.transcurrir()})
	}

	method agregarEscena(unaEscena) {
		escenas.add(unaEscena)
	}
	
	method escenas(){
		return escenas
	}
}

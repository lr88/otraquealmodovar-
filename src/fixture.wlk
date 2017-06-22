import peliculas.*
import personajes.*
import guiones.*
import escenas.*
  
object fixture {
	
	var pelicula1
	
	var guionDeUnaPelicula
	var flashback
	
	var persona1 
	var persona2
	var persona3
	var persona4
	var persona5
	var persona6
	var persona7
	
	var escena1
	var escena2
	var escena3
	var escena4
	var escena5
	var escena6
	
	method iniciarContexto(){
	guionDeUnaPelicula = new GuionDeLaPelicula()
	flashback = new EscenaFlashback()
	
	pelicula1= new Pelicula (guionDeUnaPelicula,10)
	
	persona1 = new Extra("hombre",malo)	
	persona2 = new Asesino("hombre",bueno)
	persona3 = new Protagonico("mujer",bueno)	
	persona4 = new Extra("mujer",bueno)
	persona5 = new Victima("mujer",bueno)
	persona6 = new Victima("mujer",malo)
	persona7 = new Victima("mujer",malo)
	
	escena1 = new EscenaDeAccion ()
	escena2 = new EscenaDeAsesinato ()
	escena3 = new EscenaRomantica ()
	escena4 = new EscenaDeRelleno ()
	escena5 = new TitulosYCreditos ()
	escena6 = new EscenaDificil ()
	}
	
	method crearPeliculaCompleta(){
		self.iniciarContexto()
		
		guionDeUnaPelicula.agregarEscena(escena1)
		guionDeUnaPelicula.agregarEscena(escena2)
		guionDeUnaPelicula.agregarEscena(escena3)
		guionDeUnaPelicula.agregarEscena(escena4)
		guionDeUnaPelicula.agregarEscena(escena5)
		
		
		pelicula1.aregarPersonaje(persona1)
		pelicula1.aregarPersonaje(persona2)
		pelicula1.aregarPersonaje(persona3)
		pelicula1.aregarPersonaje(persona4)
				
		escena1.agregarExtra(persona1)
		escena1.agregarExtra(persona2)
		
		
		escena2.agregarExtra(persona2)
		escena2.agregarExtra(persona5)
		
		
	}
	
	method crearUnaPeliculaConFlashback(){
		self.iniciarContexto()
		
		guionDeUnaPelicula.agregarEscena(escena5)
		pelicula1.aregarFlashback(flashback)
		
		flashback.agregarEscena(escena3)
		flashback.agregarEscena(escena4)
		flashback.agregarEscena(escena6)
		
		escena3.agregarExtra(persona3)
		escena3.agregarExtra(persona4)
		escena3.agregarExtra(persona6)
		
		escena4.agregarExtra(persona5)
		escena4.agregarExtra(persona1)
		escena4.agregarExtra(persona7)
		escena6.agregarExtra(persona7)
		
	}
	
	method guionDeUnaPelicula(){
		return guionDeUnaPelicula
	}
	
	method flashbackDeUnaPelicula(){
		return flashback
	}
	
	method pelicula1(){
		return pelicula1
	}

	method persona1(){
		return persona1
	}
	
	method persona2(){
		return persona2
	}
	
	method persona3(){
		return persona3
	}
	
	method persona4(){
		return persona4
	}
	
	method persona5(){
		return persona5
	}
	
	method escena1(){
		return escena1
	}
	
	method escena2(){
		return escena2
	}

	method escena3(){
		return escena3
	}
	
	method escena4(){
		return escena4
	}
	
	method escena5(){
		return escena5
	}
	
	method escena6(){
		return escena6
	}
}
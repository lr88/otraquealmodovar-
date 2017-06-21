import peliculas.*
import personajes.*
import guiones.*
import escenas.*
  
object fixture {
	var guionDeUnaPelicula
	 
	var pelicula1
	
	var persona1 
	var persona2
	var persona3
	var persona4
	
	var escena1
	var escena2
	var escena3
	var escena4
	
	method iniciarContexto(){
	guionDeUnaPelicula = new GuionDeLaPelicula()
	pelicula1= new Pelicula (guionDeUnaPelicula,10)
	persona1 = new Extra("hombre")	
	persona2 = new Asesino("hombre")
	persona3 = new Protagonico("mujer")	
	persona4 = new Extra("mujer")	
	escena1 = new EscenaDeAccion ()
	escena2 = new EscenaDeAsesinato ()
	escena3 = new EscenaRomantica ()
	escena4 = new EscenaDeRelleno ()
	
	}
	
	method crearPeliculaCompleta(){
		self.iniciarContexto()
		
		guionDeUnaPelicula.agregarEscena(escena1)
		guionDeUnaPelicula.agregarEscena(escena2)
		guionDeUnaPelicula.agregarEscena(escena3)
		
		pelicula1.aregarPersonaje(persona1)
		pelicula1.aregarPersonaje(persona2)
		pelicula1.aregarPersonaje(persona3)
		pelicula1.aregarPersonaje(persona4)
		
	}
	
	method guionDeUnaPelicula(){
		return guionDeUnaPelicula
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
	
	method escena1(){
		return escena1
	}
	
	method escena2(){
		return escena2
	}

	method escena3(){
		return escena3
	}
	
}
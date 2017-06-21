class Escena {
	var personajesExtras = []
	
	
	method agregarExtra(unExtra){
		personajesExtras.add(unExtra)
	}
	
	method personajesExtras(){
		return personajesExtras
	}
	
	method queLePasaALosPersonajes()
	
	method transcurrir(unaPelicula)
}

class EscenaDeAccion inherits Escena{
	
	
	override method queLePasaALosPersonajes(){
		console.println(accion.descripcion())
		return accion.descripcion()
	}
	
	override method transcurrir(unaPelicula){
		explocion.afectar(unaPelicula,self)
		
	}
	
	

}

object explocion{
	
	method afectar(unaPelicula,unaEscena){
		unaEscena.personajesExtras().forEach({extra => extra.estadoDeVida(false)})
		unaPelicula.personajes().forEach({personaje => personaje.variarFelicidad(-30)})
	}
}

class EscenaDeAsesinato inherits Escena {
	
	var victima 
	var asesino
	
	override method queLePasaALosPersonajes(){
		console.println(asesinatos.descripcion())
		return asesinatos.descripcion()
	}
	
	method hayUnAsesino(unaPelicula){
		return unaPelicula.personajes().any({personaje => personaje.papelEnLaPelicula()=="asesino"})
	}
	
	method hayUnaVictima(unaPelicula){ 
		return unaPelicula.personajes().any({personaje => personaje.papelEnLaPelicula()=="victima"})
	}
	
	
	override method transcurrir(unaPelicula){
		if(self.hayUnAsesino(unaPelicula)and self.hayUnaVictima(unaPelicula)){
			victima = unaPelicula.personajes().filter({personaje => personaje.papelEnLaPelicula()=="victima"}).first()
			asesino = unaPelicula.personajes().filter({personaje => personaje.papelEnLaPelicula()=="asesino"}).first()
			victima.estadoDeVida(false)
			asesino.variarFelicidad(40)
		}
		
		}
}

class EscenaRomantica inherits Escena{
	
	const indiceDeAumentoDefelicidad = 2
	const valorDeAumentoDefelicidad = 30
	var personaje1
	var personaje2
	
	override method queLePasaALosPersonajes(){
		console.println(romantica.descripcion())
		return romantica.descripcion()
	}

	override method transcurrir(unaPelicula){
		self.participantesDeLaEscena(unaPelicula)
		self.aumentarFelicidad()
	}
	
	method participantesDeLaEscena(unaPelicula){//// CONSULTAR CRITERIO PARA ELEGIR A LOS PERSONAJES
		personaje1 = (unaPelicula.personajes() + self.personajesExtras()).get(2)
		personaje2 = (unaPelicula.personajes() + self.personajesExtras()).get(4)
	}
	
	method aumentarFelicidad(){
		if(personaje1.sexo() == "mujer"){//// CONSULTAR CRITERIO PARA TENER SEXO O NO
			self.tenerSexo()
		}
		else{
			self.darseUnBeso()
		}
	}
	
	method tenerSexo(){
		personaje1.tenerSexo(valorDeAumentoDefelicidad*indiceDeAumentoDefelicidad)
		personaje2.tenerSexo(valorDeAumentoDefelicidad*indiceDeAumentoDefelicidad)
	}
	
	method darseUnBeso(){
		personaje1.darseUnBeso(valorDeAumentoDefelicidad)
		personaje1.darseUnBeso(valorDeAumentoDefelicidad)
	}
	
}

class EscenaDeRelleno inherits Escena{
	
	
	override method queLePasaALosPersonajes(){
		console.println(relleno.descripcion())
		return relleno.descripcion()
	}
	
	override method transcurrir(unaPelicula){
		unaPelicula.alargarDuracion(30)
	}
}





object romantica{
	method descripcion(){
		return "Un personaje le da un beso otro y este se lo retribuye. Como bien saben, en algunas de estas escenas luego de los besos, los personajes tienen sexo. Recibir un beso aumenta la felicidad del personaje si es protagónico. A los extras no les hace nada. Tener sexo aporta el doble de felicidad a los protagonistas, pero mata a los extras."
	}
}

object accion{
	method descripcion(){
		return "Hay muchos personajes y siempre hay como mínimo una explosión. Las explosiones afectan a todos, matando a los extras pero salvando a los personajes protagónicos, que de todas maneras quedan aturdidos y por lo tanto un poco menos felices. "
	}
}

object asesinatos{
	method descripcion(){
		return "Un personaje, el asesino, mata a la víctima y en consecuencia se pone más feliz."
	}
}

object relleno{
	method descripcion(){
		return "En las películas nunca faltan escenas de relleno que no agregan nada interesante a la película, sino que sólo la hacen más larga."
	}
}

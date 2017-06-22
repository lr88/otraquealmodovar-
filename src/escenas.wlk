import personajes.*
class UserException inherits wollok.lang.Exception {
	constructor(_mensaje) = super(_mensaje)
}
 

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
	
	const valorDeEfectoEnLaFelicidad = -30
	var cantidadDeExplociones = 1
		
	method afectar(unaPelicula,unaEscena){
		if(cantidadDeExplociones!=0){
			unaEscena.personajesExtras().forEach({extra => extra.estadoDeVida(false)})
			unaPelicula.personajes().forEach({personaje => personaje.variarFelicidad(valorDeEfectoEnLaFelicidad)})
		cantidadDeExplociones -= 1
		self.afectar(unaPelicula, unaEscena)
		}
	}
	
	method cantidadDeExplociones(valor){
		if(valor<1){
			throw new UserException("La cantidad debe ser positiva y mayor a 1")
		}
		cantidadDeExplociones = valor
	}
	
	method cantidadDeExplociones(){
		return cantidadDeExplociones
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
			victima = (unaPelicula.personajes().filter({personaje => personaje.papelEnLaPelicula()=="victima"})).first()
			asesino = (unaPelicula.personajes().filter({personaje => personaje.papelEnLaPelicula()=="asesino"})).first()
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
		self.darseUnBeso()
		self.tenerSexo()
	}
	
	method participantesDeLaEscena(unaPelicula){
		personaje1 = unaPelicula.personajes().get(0)
		personaje2 = unaPelicula.personajes().get(1)
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
	const tiempoDeAlargue = 30
	
	override method queLePasaALosPersonajes(){
		console.println(relleno.descripcion())
		return relleno.descripcion()
	}
	
	override method transcurrir(unaPelicula){
		unaPelicula.alargarDuracion(tiempoDeAlargue)
	}
}

class EscenaDificil inherits Escena{
	var personaje1
	
	override method queLePasaALosPersonajes(){
		console.println(dificil.descripcion())
		return dificil.descripcion()
	}
	
	override method transcurrir(unaPelicula){
		personaje1 = self.personajesExtras().get(0)
		personaje1.actitud().actuar(unaPelicula)
	}
}


class TitulosYCreditos inherits EscenaDeRelleno{
	
	override method queLePasaALosPersonajes(){
		console.println(titulosYCreditos.descripcion())
		return titulosYCreditos.descripcion()
	}
	
}

object romantica{
	method descripcion(){
		return "Un personaje le da un beso otro y este se lo retribuye. Como bien saben, en algunas de estas escenas luego de los besos, los personajes tienen sexo. Recibir un beso aumenta la felicidad del personaje si es protag�nico. A los extras no les hace nada. Tener sexo aporta el doble de felicidad a los protagonistas, pero mata a los extras."
	}
}

object accion{
	method descripcion(){
		return "Hay muchos personajes y siempre hay como m�nimo una explosi�n. Las explosiones afectan a todos, matando a los extras pero salvando a los personajes protag�nicos, que de todas maneras quedan aturdidos y por lo tanto un poco menos felices. "
	}
}

object asesinatos{
	method descripcion(){
		return "Un personaje, el asesino, mata a la v�ctima y en consecuencia se pone m�s feliz."
	}
}

object relleno{
	method descripcion(){
		return "En las pel�culas nunca faltan escenas de relleno que no agregan nada interesante a la pel�cula, sino que s�lo la hacen m�s larga."
	}
}

object dificil{
	
	method descripcion() {
		return "En las escenas dif�ciles de definir hay un personaje que est� rodeado por otros y si el personaje es bueno, les da un beso a cada uno, pero si es malo los mata. Lo que sucede es que en muchas pel�culas el que era bueno se transforma en malo o al rev�s. Aparte, en otras pel�culas hay quienes no son ni buenos ni malos sino que adquieren otras caracter�sticas. Por ejemplo, un personaje puede ser depravado sexual y lo que hace es tener sexo con todos con quienes comparte la escena, pero a su vez en otro momento de la pel�cula puede tener una Manifestaci�n y hacerse bueno."
	}
}

object titulosYCreditos{
	method descripcion(){
		return "TITULOS Y CREDITOS"
	}
}
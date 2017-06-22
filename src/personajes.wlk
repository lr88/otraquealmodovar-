class UserException inherits wollok.lang.Exception {
	constructor(_mensaje) = super(_mensaje)
}

class Personaje {
	const actitudesPosibles = [bueno,malo,depravadoSexual]
	var sexo
	var actitud
	var estoyVivo = true
	var valorDeFelicidad = 100
	
	constructor(_sexo,_actitud){
		
		if(_sexo == "hombre" or _sexo == "mujer"){
			sexo = _sexo
		}
		else{
			throw new UserException("La actitud no es valida (bueno, malo o depravadoSexual)")
		}
		
		if(!actitudesPosibles.contains(_actitud)){
			throw new UserException("La actitud no es valida (bueno, malo o depravadoSexual)")
		}
		actitud = _actitud
		}
		
	method sexo(){
		return sexo
	}
	
	method actitud(){
		return actitud
	}
	
	method cambiarActitud(unaActitud){
		if(!actitudesPosibles.contains(_actitud)){
		throw new UserException("La actitud que se quiere cambiar no es valida "+ actitudesPosibles)
	}
		actitud = unaActitud
	}
	
	method estoyVivo(){
		return estoyVivo
	} 
	
	method estadoDeVida(vivoOMuerto){
		estoyVivo = vivoOMuerto
	}
	
	method valorDeMiFelicidad(){
		return valorDeFelicidad
	}
	
	method estoyFeliz(){
		return self.valorDeMiFelicidad() > 50
	}
	
	method variarFelicidad(valorPositivoONegativo){
		valorDeFelicidad = valorDeFelicidad + valorPositivoONegativo
	}
	
	method tenerSexo(valor)
	
	method darseUnBeso(valor)
	
	
}

class Asesino inherits Personaje {
	
	constructor(_sexo,_actitud) = super(_sexo,_actitud)
	
	method papelEnLaPelicula(){
		return "asesino"
	}

	override method tenerSexo(valor){}
	
	override method darseUnBeso(valor){}

}

class Protagonico inherits Personaje {
	
		constructor(_sexo,_actitud) = super(_sexo,_actitud)

	method papelEnLaPelicula(){
		return "protagonico"
	}

	override method tenerSexo(valor){
		self.variarFelicidad(valor)
	}
	 
	override method darseUnBeso(valor){
		self.variarFelicidad(valor)
	}

}

class Extra inherits Personaje {
	
		constructor(_sexo,_actitud) = super(_sexo,_actitud)

	method papelEnLaPelicula(){
		return "extra"
	}

	override method tenerSexo(valor){
		self.estadoDeVida(false)
	}
	
	override method darseUnBeso(valor){}

}

class Victima inherits Personaje {
	
	constructor(_sexo,_actitud) = super(_sexo,_actitud)

	method papelEnLaPelicula(){
		return "victima"
	}

	override method tenerSexo(valor){}
	
	override method darseUnBeso(valor){}

}

object bueno{
	const valorDeAumentoDefelicidad = 30
	method actuar(unaPelicula){
		unaPelicula.personajes().forEach({personaje => personaje.darseUnBeso(valorDeAumentoDefelicidad)})
	}
}
object malo{
	method actuar(unaPelicula){
		unaPelicula.personajes().forEach({personaje => personaje.estadoDeVida(false)})
	}
}
object depravadoSexual {
	const valorDeAumentoDefelicidad = 60
	method actuar(unaPelicula){
		unaPelicula.personajes().forEach({personaje => personaje.tenerSexo(valorDeAumentoDefelicidad)})
	}
}




class Personaje {
	var sexo
	var estoyVivo = true
	var valorDeFelicidad = 100
	
	constructor(_sexo){
		sexo = _sexo
		}
	  
	method sexo(){
		return sexo
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
	
	constructor(_sexo) = super(_sexo)

	method papelEnLaPelicula(){
		return "asesino"
	}

	override method tenerSexo(valor){}
	
	override method darseUnBeso(valor){}

}

class Protagonico inherits Personaje {
	
		constructor(_sexo) = super(_sexo)

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
	
		constructor(_sexo) = super(_sexo)

	method papelEnLaPelicula(){
		return "extra"
	}

	override method tenerSexo(valor){
		self.estadoDeVida(false)
	}
	
	override method darseUnBeso(valor){}

}

class Victima inherits Personaje {
	
	constructor(_sexo) = super(_sexo)

	method papelEnLaPelicula(){
		return "victima"
	}

	override method tenerSexo(valor){}
	
	override method darseUnBeso(valor){}

}


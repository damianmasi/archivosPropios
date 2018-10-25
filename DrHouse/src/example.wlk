class Persona{
	var property enfermedades
	var property celulas
	var property temperatura
	var property enComa = false
	
	method contraerEnfermedad(enfermedad){
		enfermedades.add(enfermedad)
	}
	method pasarUnDia(){
		enfermedades.forEach{enfermedad => enfermedad.efecto(self)}		
	}
	method valorTemperatura(nuevaTemperatura){
		temperatura = nuevaTemperatura 
	}
	method cantCelulas(nuevasCelulas){
		celulas = nuevasCelulas
	}
	method cantDeCelulasAmenazadasEnfAgre(){
		var enfermedadesAgresivas = enfermedades.filter{enfermedad => enfermedad.esAgresiva(self)}
		return  enfermedadesAgresivas.sum{enfermedad => enfermedad.celulasAmenzadas()} 
	}
	method enfermedadConMasCelulasAmenazadas(){
		var maximoCelulas = enfermedades.max{enfermedad => enfermedad.celulasAmenazadas()}
		return enfermedades.find{enfermedad => enfermedad.celulasAmenazadas() == maximoCelulas}
	}
}
/*		ENFERMEDADES 	*/
class EnfermedadInfecciosa inherits Enfermedad{
	
	method efecto(persona){
		persona.valorTemperatura(persona.temperatura() + celulasAmenazadas/1000)
		
		if(persona.temperatura() >= 45){
			persona.enComa(true)
			persona.temperatura(45)
		}	
	}
	method reproducirce(){
		celulasAmenazadas *= 2	
	}
	method esAgresiva(persona){
		return celulasAmenazadas > persona.celulas()*0.1
	}
}

class EnfermedadAutoinmune inherits Enfermedad{
	var property diasAfecta = 0
	
	method efecto(persona){
		persona.cantCelulas(persona.celulas() - celulasAmenazadas)	
		diasAfecta += 1
		
		if(persona.celulas() <= 1000000){
			persona.enComa(true)
			persona.celulas(1000000)
		}	
	}
	method esAgresiva(persona){
		return diasAfecta > 30
	}
}

class Enfermedad{
	var property celulasAmenazadas
	
}


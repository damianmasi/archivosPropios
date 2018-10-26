class Entrenadores{
	var pokemons = []
}

class Pokemon{
	var property ataques = []
	var property estado
	var property defensa
	var property ptsVelocidad
	var property ptsVida
	var property ptsAtaque
	
	
	method agregarAtaque(ataque){
		if(ataques.size() >= 4){
			ataques.remove(ataques.anyOne())
		}
		ataques.add(ataque)	
		
	}
	method perderVida(danio){
		ptsVida -= danio
		if(ptsVida < 0){
			ptsVida = 0
		}
	}
	method atacar(ataque,objetivo){
		
		estado.aplicar(self)
		
		if(ataques.contains(ataque)){
			ataque.aplicarAtaque(self,objetivo)
		}
	}
	
}

//--------ATAQUES--------//

object veneno{
	
	method aplicarAtaque(atacante, objetivo){
		self.envenenar(objetivo)
		objetivo.perderVida(0)
	}
	method envenenar(objetivo){
		objetivo.estado(envenenado)
	}
}
object atactrueno{
	
	method aplicarAtaque(atacante, objetivo){
		self.paralizar(objetivo)
		objetivo.perderVida(atacante.ptsVelocidad())
		
	}
	method paralizar(objetivo){
		if(0.randomUpTo(1) > 0.5){
			var paralizado = new Paralizado(grado = 5)
			objetivo.estado(paralizado)
		}
	}
}
object placaje{
	method aplicarAtaque(atacante, objetivo){
		objetivo.perderVida(atacante.ptsAtaque())
	}
}

//--------ESTADOS--------//
object saludable{
	method aplicar(afectado){
		
	}
}
object envenenado{
	method aplicar(afectado){
		afectado.perderVida(afectado.ptsVida()*0.1)
	}	
}
class Paralizado{
	var property grado
	method aplicar(afectado){
		afectado.estado().reducirGrado()
	}
	method reducirGrado(){
		grado -= 1
	}	
}
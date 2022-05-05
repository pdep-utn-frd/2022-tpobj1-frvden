import wollok.game.*
    
const velocidad = 250 

object juego{

	method configurar(){
		game.width(12)
		game.height(8)
		game.title("Dino In Space")
		game.addVisual(suelo)
		game.addVisual(techo)
		game.boardGround("space.png")
		game.addVisual(cactus)
		game.addVisual(cactus2)
		game.addVisual(cactus3)
		game.addVisual(cactus4)
		game.addVisual(cactus5)
		game.addVisual(cactus6)
		game.addVisual(dino)
		game.addVisual(reloj)
	
		keyboard.up().onPressDo{ self.arriba()}
		keyboard.down().onPressDo{ self.abajo()}
		keyboard.space().onPressDo{ self.empezar()}
		
		game.onCollideDo(dino,{ obstaculo => obstaculo.chocar()})
		
	} 
	
	method iniciar(){
		dino.iniciar()
		reloj.iniciar()
		cactus.iniciar()
		cactus2.iniciar()
		cactus3.iniciar()
		cactus4.iniciar()
		cactus5.iniciar()
		cactus6.iniciar()
	}
	

	method empezar(){
			game.removeVisual(gameOver)
			self.iniciar()
			}
			
	method arriba(){
		if (dino.estaVivo()) 
			dino.subir()
		else {
		}
		
	}
	
	method abajo(){
		if (dino.estaVivo()) 
			dino.bajar()
		else {
		}
		
	}
	
	method terminar(){
		game.addVisual(gameOver)
		cactus.detener()
		cactus2.detener()
		cactus3.detener()
		cactus4.detener()
		cactus5.detener()
		cactus6.detener()
		reloj.detener()
		dino.morir()
	}
	
}

object gameOver {
	method position() = game.at(game.width()-9, game.height()-7)
	method image() = "gameover.png"
	

}

object reloj {
	
	var tiempo = 0
	
	method text() = tiempo.toString()
	method position() = game.at(1, game.height()-1)
	
	method pasarTiempo() {
		tiempo = tiempo +1
	}
	method iniciar(){
		tiempo = 0
		game.onTick(100,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
	}
}

object cactus4 {
	 
	const posicionInicial = game.at(game.width()-1,5)
	var position = posicionInicial
	const velocidadC2 = ((100.. 300).anyOne())

	method image() = "cactus5.png"
	method position() = position
	
	method iniciar(){
		position = posicionInicial
		game.onTick(velocidadC2,"moverCactus",{self.mover()})
	}
	
	method mover(){
		position = position.left(1)
		if (position.x() == -1)
			position = posicionInicial
	}
	
	method chocar(){
		juego.terminar()
	}
    method detener(){
		game.removeTickEvent("moverCactus")
	}
}

object cactus6 {
	 
	const posicionInicial = game.at(game.width()-1,2)
	var position = posicionInicial
	const velocidadC2 = ((100.. 300).anyOne())

	method image() = "cactus2.png"
	method position() = position
	
	method iniciar(){
		position = posicionInicial
		game.onTick(velocidadC2,"moverCactus",{self.mover()})
	}
	
	method mover(){
		position = position.left(1)
		if (position.x() == -1)
			position = posicionInicial
	}
	
	method chocar(){
		juego.terminar()
	}
    method detener(){
		game.removeTickEvent("moverCactus")
	}
}


object cactus3 {
	 
	const posicionInicial = game.at(game.width()-1,6)
	var position = posicionInicial
	const velocidadC2 = ((100.. 300).anyOne())

	method image() = "cactus3.png"
	method position() = position
	
	method iniciar(){
		position = posicionInicial
		game.onTick(velocidadC2,"moverCactus",{self.mover()})
	}
	
	method mover(){
		position = position.left(1)
		if (position.x() == -1)
			position = posicionInicial
	}
	
	method chocar(){
		juego.terminar()
	}
    method detener(){
		game.removeTickEvent("moverCactus")
	}
}


object cactus2 {
	 
	const posicionInicial = game.at(game.width()-1,4)
	var position = posicionInicial
	const velocidadC2 =  200.randomUpTo(400)

	method image() = "cactus.png"
	method position() = position
	
	method iniciar(){
		position = posicionInicial
		game.onTick(velocidadC2,"moverCactus",{self.mover()})
	}
	
	method mover(){
		position = position.left(1)
		if (position.x() == -1)
			position = posicionInicial
	}
	
	method chocar(){
		juego.terminar()
	}
    method detener(){
		game.removeTickEvent("moverCactus")
	}
}

object cactus5 {
	 
	const posicionInicial = game.at(game.width()-1,3)
	var position = posicionInicial
	const velocidadC2 = ((100.. 300).anyOne())

	method image() = "cactus4.png"
	method position() = position
	
	method iniciar(){
		position = posicionInicial
		game.onTick(velocidadC2,"moverCactus",{self.mover()})
	}
	
	method mover(){
		position = position.left(1)
		if (position.x() == -1)
			position = posicionInicial
	}
	
	method chocar(){
		juego.terminar()
	}
    method detener(){
		game.removeTickEvent("moverCactus")
	}
}

object cactus {
	 
	const posicionInicial = game.at(game.width()-1,1)
	var position = posicionInicial

	method image() = "cactus.png"
	method position() = position
	
	method iniciar(){
		position = posicionInicial
		game.onTick(velocidad,"moverCactus",{self.mover()})
	}
	
	method mover(){
		position = position.left(1)
		if (position.x() == -1)
			position = posicionInicial
	}
	
	method chocar(){
		juego.terminar()
	}
    method detener(){
		game.removeTickEvent("moverCactus")
	}
}

object techo{
	
	method position() = game.origin().up(7.5)
	
	method image() = "limite.png"
	
	method chocar(){
		juego.terminar()
	}
}

object suelo{
	
	method position() = game.origin().up(0)
	
	method image() = "suelo.png"
	
	method chocar(){
		juego.terminar()
		return true
	}
}


object dino {
	var vivo = true
	var position = game.origin().up(4)
	
	method image() {
		return if (self.estaVivo()) 
			"dino.png"
		else if (self.fuego()) 
			"dino3.png"
		else 
			"dino2.png"
			}
	method position() = position
	
	method subir(){
		position = position.up(1)
	}
	
	method bajar(){
		position = position.down(1)
	}
	
	method fuego(){
		return position.y() == 0
	}
	
	method morir(){
		if (position.y() == 0) 
			game.say(self,"AAAA")
		else 
			game.say(self,"x_x")
		vivo = false
	}
	method iniciar() {
		vivo = true
	}
	
	
	method estaVivo() {
		return vivo
	}
}
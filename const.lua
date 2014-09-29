const = {
	suelo = {
		grosor = 10
	},
	pared = {
		grosor = 10
	},
	personaje = {
		escala = 0.7,
		vel = 0.2
	},
	--vidas
	fluvi=1,
	
	--bolas
	bolas={
		numInicial=1,
		radio=33,
		xDefault=300,
		yDefault=100,
		radio = {33,22,11}
	},
	colisiones = {
		personaje = {
			categoryBits = 1,
			maskBits = 3 		-- Colisiona con bola y paredes
		},
		bola = {
			categoryBits = 2,
			maskBits = 13		-- Colisiona con todo menos con otra bola
		},
		paredes = {
			categoryBits = 3,
			maskBits = 3 		-- Colisiona con personaje y bola
		},
		flecha = {
			categoryBits = 4,
			maskBits = 2 		-- Colisiona con bola
		}
	}
}

return const
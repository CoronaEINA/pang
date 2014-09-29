const = {
	suelo = {
		grosor = 10
	},
	pared = {
		grosor = 10
	},
	personaje = {
		escala = 0.7
	},
	--vidas
	hearts=1,
	
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
			maskBits = 3
		},
		bola = {
			categoryBits = 2,
			maskBits = 13		
		},
		paredes = {
			categoryBits = 3,
			maskBits = 3		
		},
		flecha = {
			categoryBits = 4,
			maskBits = 2		
		},		
	}
}

return const
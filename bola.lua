local phisics = require("physics")
local const = require("const")
local sheetInfo = require("sprites")
local sheetInfo = require("flechas")

bola = {}
--params para el tipo de bola con distinta direccion etc
local params = {
	 [0]={ radius=33, xdir=-1, ydir=1, xspeed=2.8, yspeed=6.1, r=255, g=0, b=0,xpos=350, ypos=50,tipo=0 },
	 [1]={ radius=33, xdir=1, ydir=1, xspeed=3.8, yspeed=4.2, r=255, g=255, b=0 ,xpos=300, ypos=100,tipo=1},
	 [2]={ radius=33, xdir=1, ydir=-1, xspeed=5.8, yspeed=5.5, r=255, g=0, b=255 ,xpos=250, ypos=150,tipo=2}
}

function bola:crearBola(posX, posY, radio)
		tipoBola=math.random(2)
		
		print ("tipoBola:"..tipoBola)
		local xpos = display.contentWidth*0.5
		local ypos = display.contentHeight*0.5
		--circle = display.newImage("images/azul_grande.png")
		circle = display.newCircle( posX, posY, radio )
		--nombre de cada bola creada
		circle.myName = "ball"
		circle.id=const.bolas.numInicial
		circle.radius = radio
	  const.bolas.numInicial=const.bolas.numInicial-1
		circle.xdir = params[tipoBola].xdir
		circle.ydir = params[tipoBola].ydir
		circle.xspeed = params[tipoBola].xspeed
		circle.yspeed = params[tipoBola].yspeed
		circle.x=posX
		circle.y=posY
		--fisica
		physics.addBody( circle,"dinamic",
			{
				density = 1.0,
				friction = 0.3,
				bounce = 1,
				radius = radio,
				filter = {
					categoryBits = 2,
					maskBits = 13
				}
			}
		) 
		--circle:applyForce( 1000, 0, circle.x, circle.y )
		return circle
end

return bola

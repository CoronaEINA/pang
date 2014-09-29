local sheetInfo = require("sprites")
local personajeSheet = graphics.newImageSheet( "images/sprites.png", sheetInfo:getSheet() )
local sheetInfo = require("flechas")
local flechasSheet = graphics.newImageSheet( "images/flechas.png", sheetInfo:getSheet() )

local params = {
	 [0]={ xdir=-1, ydir=1, xspeed=2.8, yspeed=6.1 },
	 [1]={ xdir=1, ydir=1, xspeed=3.8, yspeed=4.2 },
	 [2]={ xdir=1, ydir=-1, xspeed=5.8, yspeed=5.5 }
}

motor = {}
bola = {}

local personajeSequence = {
	{
	    name="walkForward",
	    frames={7,8,9,8},
	    time=500,
	    loopCount = 0,
	    loopDirection = "forward"
	},
	{
	    name="walkBackward",
	    frames={3,2,1,2},
	    time=500,
	    loopCount = 0 ,
	    loopDirection = "forward"
	},
	{
		name="stop",
		frames={5}
	}
}

local flechaSequence = {
	{
		name="subir",
		start=1,
		count=8,
		time=200,
		loopCount=1,
		loopDirection="forward"
	}
}

function motor:inicializar_fisica()
	physics.setDrawMode( "hybrid" )
	physics.start( )
	physics.setGravity( 0, 5 )
end


-------------------------
-- ELEMENTOS ESTÁTICOS --
-------------------------
function motor:crearFondo(nombre_fichero)
	fondo = display.newImageRect( nombre_fichero, display.contentWidth, display.contentHeight )
	fondo.x = display.contentCenterX
	fondo.y = display.contentCenterY
	
	return fondo
end
	
function motor:crearSuelo()
	suelo = display.newRect( display.contentCenterX, display.contentHeight - const.suelo.grosor / 2, display.contentWidth + 60, const.suelo.grosor)
	suelo.myName = "suelo"
	suelo:setFillColor( 0.5, 0.5, 0.5 )
	
	physics.addBody( suelo, "static", { bounce = 0.1, const.colisiones.paredes } )
	
	return suelo
end

function motor:crearTecho()
	local techo = display.newRect( display.contentCenterX,  const.suelo.grosor/2 , display.contentWidth + 60, const.suelo.grosor)
	techo.myName="techo"
	techo:setFillColor( 0.5, 0.5, 0.5 )
	physics.addBody( techo, "static", { bounce = 0.1, const.colisiones.paredes } )
	
	return techo
end
function motor:crearParedIzq()
	local paredIzq = display.newRect( 0, display.contentCenterY, const.suelo.grosor,display.contentWidth + 60)
	paredIzq.myName="paredIzq"
	paredIzq:setFillColor( 0.5, 0.5, 0.5 )
	physics.addBody( paredIzq, "static", { bounce = 0.1, const.colisiones.paredes } )
	return paredIzq
end

function motor:crearParedDer()
	local paredDer = display.newRect( display.contentWidth, display.contentCenterY, const.suelo.grosor,display.contentWidth + 60)
	paredDer.myName="paredDer"
	suelo:setFillColor( 0.5, 0.5, 0.5 )	
	physics.addBody( paredDer, "static", { bounce = 0.1, const.colisiones.paredes } )
	return paredDer
end


function motor:crearBackground(fondo, suelo)
	grupoFondo = display.newGroup( )
	grupoFondo:insert(fondo)
	grupoFondo:insert(suelo)

	return grupoFondo
end


-------------------------
-- ELEMENTOS DINÁMICOS --
-------------------------
function motor:crearPersonaje()
	personaje = display.newSprite( personajeSheet , personajeSequence )
	personaje.x = display.contentCenterX
	personaje.y= display.contentHeight-const.suelo.grosor
	personaje.myName ="personaje"

	grupoFrente = display.newGroup( )
	grupoFrente:insert (personaje)

	physics.addBody( personaje, "dynamic", {
		bounce = 0.1,
		filter = const.colisiones.personaje
		} )

	return personaje, grupoFrente
end

function motor:crearFlecha()
	flecha = display.newSprite( flechasSheet , flechaSequence )
	flecha.y = personaje.y
	flecha.x = personaje.x
	flecha.myName = "flecha"

	grupoFrente:insert (flecha)

	flecha:toBack( )

	physics.addBody( flecha, "static", {
		filter = const.colisiones.flecha
		})

	return flecha, grupoFrente
end

function motor:crearBola(posX, posY, radio)
	tipoBola=math.random(2)
	
	print ("tipoBola:"..tipoBola)
	circle = display.newCircle( posX, posY, radio )
	circle.id=const.bolas.numInicial
	circle.myName = "ball"
	circle.radius = radio
	circle.xdir = params[tipoBola].xdir
	circle.ydir = params[tipoBola].ydir
	circle.xspeed = params[tipoBola].xspeed
	circle.yspeed = params[tipoBola].yspeed

	const.bolas.numInicial=const.bolas.numInicial-1	-- TODO: Cambiar las bolas restantes a una variable global

	physics.addBody( circle,"dinamic",
		{
			density = 1.0,
			friction = 0.3,
			bounce = 1,
			radius = radio,
			filter = const.colisiones.bola
		}
	) 
	return circle
end

motor.movingListener = function(event)
	if (event.phase == "began") then
		if (event.x > personaje.x + (personaje.width / 2)) then
			personaje:setSequence( "walkForward" )
			transition.to( personaje, {x = display.contentWidth, time = (display.contentWidth - personaje.x) * (1/const.personaje.vel)} )	
		elseif (event.x < personaje.x - (personaje.width / 2)) then
			personaje:setSequence( "walkBackward" )
			transition.to( personaje, {x = 0, time = personaje.x * (1/const.personaje.vel)} )		
		end
		personaje:play()
	elseif (event.phase == "ended") then
		timer.performWithDelay( 100, function()
			personaje:pause( )
			personaje:setSequence( "stop" )
			transition.cancel( personaje )
		end, 1 )
	end
end

motor.disparoListener = function(event)
	if (event.phase == "began") then
		flecha = motor:crearFlecha()
		flecha:play()
		transition.to( flecha, {
			y = -500,
			time = 3000} )
	end
end

return motor
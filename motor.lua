local phisics = require("physics")
local const = require("const")
local sheetInfo = require("sprites")
local personajeSheet = graphics.newImageSheet( "images/sprites.png", sheetInfo:getSheet() )
local sheetInfo = require("flechas")
local flechasSheet = graphics.newImageSheet( "images/flechas.png", sheetInfo:getSheet() )

motor = {}

local personajeSequence = {
	{
	    name="walkForward",
	    frames={7,8,9,8},
	    time=500, -- Optional.In ms.If not supplied, then sprite is frame-based.
	    loopCount = 0 ,   -- Optional. Default is 0 (loop indefinitely)
	    loopDirection = "forward"
	},
	{
	    name="walkBackward",
	    frames={3,2,1,2},
	    time=500, -- Optional.In ms.If not supplied, then sprite is frame-based.
	    loopCount = 0 ,   -- Optional. Default is 0 (loop indefinitely)
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
	
	physics.addBody( suelo, "static", { bounce = 0.1 } )
	
	return suelo
end

function motor:crearTecho()
	local techo = display.newRect( display.contentCenterX,  const.suelo.grosor/2 , display.contentWidth + 60, const.suelo.grosor)
	techo.myName="techo"
	techo:setFillColor( 0.5, 0.5, 0.5 )
	physics.addBody( techo, "static", { bounce = 0.1 } )
	
	return techo
end
function motor:crearParedIzq()
	local paredIzq = display.newRect( 0, display.contentCenterY, const.suelo.grosor,display.contentWidth + 60)
	paredIzq.myName="paredIzq"
	paredIzq:setFillColor( 0.5, 0.5, 0.5 )
	physics.addBody( paredIzq, "static", { bounce = 0.1 } )
	return paredIzq
end

function motor:crearParedDer()
	local paredDer = display.newRect(  display.contentWidth, display.contentCenterY, const.suelo.grosor,display.contentWidth + 60)
	paredDer.myName="paredDer"
	suelo:setFillColor( 0.5, 0.5, 0.5 )	
	physics.addBody( paredDer, "static", { bounce = 0.1 } )
	return paredDer
end


function motor:crearBackground(fondo, suelo)
	grupoFondo = display.newGroup( )
	grupoFondo:insert(fondo)
	grupoFondo:insert(suelo)

	return grupoFondo
end


function motor:crearPersonaje()
	personaje = display.newSprite( personajeSheet , personajeSequence )
	personaje.x = display.contentCenterX
	personaje.y= display.contentHeight-const.suelo.grosor
	personaje.width = personaje.width 
	personaje.height = personaje.height 
	personaje.myName ="personaje"

	grupoFrente = display.newGroup( )
	grupoFrente:insert (personaje)

	physics.addBody( personaje, "dynamic", {
		bounce = 0.1
		} )
	return personaje
end

function motor:crearFlecha()
	flecha = display.newSprite( flechasSheet , flechaSequence )
	flecha.y = personaje.y
	flecha.x = personaje.x
	grupoFrente:insert (flecha)
	flecha:toBack( )

	return flecha
end

motor.movingListener = function(event)
	if (event.phase == "began") then
		if (event.x > personaje.x + 20) then
			personaje:setSequence( "walkForward" )
			transition.to( personaje, {x = display.contentWidth, time = (display.contentWidth - personaje.x) * 5} )	
			personaje:play()
		elseif (event.x < personaje.x - 20) then
			personaje:setSequence( "walkBackward" )
			transition.to( personaje, {x = 0, time = personaje.x * 5} )		
			personaje:play()
		end
	elseif (event.phase == "ended") then
		timer.performWithDelay( 100, function()
			personaje:pause( )
			personaje:setSequence( "stop" )
			transition.cancel( personaje )
		end, 1 )
	end
end

motor.disparoListener = function(event)
	flecha = motor:crearFlecha()
	timer.performWithDelay( 100, function()
		flecha:play()
	end, 1 )
	transition.to( flecha, {
		y = -500,
		time = 3000} )
end

return motor
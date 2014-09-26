local phisics = require("physics")
local const = require("const")
local sheetInfo = require("sprites")
local myImageSheet = graphics.newImageSheet( "sprites.png", sheetInfo:getSheet() )

physics.start( )

local sequence = {
	{
	    name="walkForward",
	    -- start=6,
	    -- count=4,
	    frames={7,8,9,8},
	    time=500, -- Optional.In ms.If not supplied, then sprite is frame-based.
	    loopCount = 0 ,   -- Optional. Default is 0 (loop indefinitely)
	    loopDirection = "forward"
	},
	{
	    name="walkBackward",
	    -- start=6,
	    -- count=4,
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

fondo = display.newImage( "pilar.png", {alpha = .5} )
fondo.x = display.contentCenterX
fondo.y = display.contentCenterY

bala = display.newImage( "flecha.png" )
bala.y = 500

grupo = display.newGroup( )
local sprite = display.newSprite( myImageSheet , sequence )
local suelo = display.newRect( display.contentCenterX, display.contentHeight - const.suelo.grosor / 2, display.contentWidth + 60, const.suelo.grosor)
suelo:setFillColor( 0.5, 0.5, 0.5 )

--grupo:insert( sprite )

physics.addBody( sprite, "dynamic", {
	bounce = 0.1
	} )

physics.addBody( suelo, "static", {
	bounce = 0.1
	} )

sprite.x = display.contentCenterX
sprite.xScale = const.sprite.escala
sprite.yScale = const.sprite.escala


function touchListener(event)
	if (event.phase == "began") then
		if (event.x > sprite.x + 20) then
			sprite:setSequence( "walkForward" )
			transition.to( sprite, {x = display.contentWidth, time = (display.contentWidth - sprite.x) * 5} )	
			sprite:play()
		elseif (event.x < sprite.x - 20) then
			sprite:setSequence( "walkBackward" )
			transition.to( sprite, {x = 0, time = sprite.x * 5} )		
			sprite:play()
		end
	elseif (event.phase == "ended") then
		timer.performWithDelay( 100, function()
			sprite:pause( )
			sprite:setSequence( "stop" )
			transition.cancel( sprite )
		end, 1 )
	end
end

function disparoListener(event)
	if (event.phase == "ended") then
		--bala = display.newImage( "flecha.png" )
		bala.x = sprite.x
		bala.y = 500
		transition.to( bala, {
			y = -500,
			time = 1500} )
	end
end

Runtime:addEventListener( "touch", touchListener )
sprite:addEventListener( "tap", disparoListener )
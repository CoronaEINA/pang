--
-- Project: menu
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2014 . All Rights Reserved.
-- 
local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()
local phisics = require("physics")
local const = require("const")
local sheetInfo = require("sprites")

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    local sceneGroup = self.view

    -- Initialize the scene here.
    -- Example: add display objects to "sceneGroup", add touch listeners, etc.
 	--juego = display.newText( "juego", 0, 0, native.systemFontBold, 24 )
 	--juego = display.newImage( "tittle.png" )
 	

-- tint the image red
titulo.alpha=0

	physics.setDrawMode( "hybrid" )   --shows collision engine outlines only
	
	
--local ballSprite = graphics.newImageSheet()
	

	
	
	
	
	
	
	
	----
local myImageSheet = graphics.newImageSheet( "images/sprites.png", sheetInfo:getSheet() )

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

 	fondo = display.newImageRect( "images/pilar.png", display.contentWidth, display.contentHeight )
	fondo.x = display.contentCenterX
	fondo.y = display.contentCenterY

bala = display.newImage( "images/flecha.png" )
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
sprite.width= sprite.width*const.sprite.escala
sprite.height= sprite.height*const.sprite.escala
	
	


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


 	--
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end


-- "scene:hide()"
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end


-- "scene:destroy()"
function scene:destroy( event )

    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene

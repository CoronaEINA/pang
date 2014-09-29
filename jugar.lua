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
local motor = require("motor")

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )
	   
	local sceneGroup = self.view

	function onLocalCollision( event )     
		if (event.other.myName=="personaje") then
			print( event.target.myName .. ": collision began with " .. event.other.myName )
			--vidas=vidas-1
			--personaje.x = display.contentCenterX
			--personaje.y= display.contentHeight-const.suelo.grosor
			--print("vidas"..vidas)
			--if vidas==0 then				--cero vidas, finaliza el juego
				--vidas=2
			timer.performWithDelay( 500, function()
				physics.stop()
			end, 1 )
			composer.gotoScene( "menu", "fade", 400 )
		elseif (event.other.myName == "flecha") then
			--event.target:removeSelf( )

			timer.performWithDelay( 1, function()
				physics.pause()
				physics.start()
				if (event.target.radius == 33) then
					bolaa= motor:crearBola(const.bolas.xDefault,const.bolas.yDefault,22) 
					bolaa:applyForce( -100, 0, bolaa.x, bolaa.y )
				elseif (event.target.radius == 22) then
					bolaa= motor:crearBola(const.bolas.xDefault,const.bolas.yDefault,11) 
					bolaa:applyForce( -50, 0, bolaa.x, bolaa.y )
				end
				bolaa:addEventListener( "collision", onLocalCollision )
				grupoBolas:insert(bolaa)
				sceneGroup:insert (bolaa)

				-- bolaa:applyForce( -500, 0, bolaa.x, bolaa.y )

				if (event.target.radius == 33) then
					bolaa= motor:crearBola(const.bolas.xDefault,const.bolas.yDefault,22) 
					bolaa:applyForce( 100, 0, bolaa.x, bolaa.y )
				elseif (event.target.radius == 22) then
					bolaa= motor:crearBola(const.bolas.xDefault,const.bolas.yDefault,11) 
					bolaa:applyForce( 50, 0, bolaa.x, bolaa.y )
				end
				bolaa:addEventListener( "collision", onLocalCollision )
				grupoBolas:insert(bolaa)
				sceneGroup:insert (bolaa)
				-- bolaa:applyForce( 500, 0, bolaa.x, bolaa.y )

			end, 1 )

			event.target:removeSelf( )
			event.other:removeSelf( )
		end
	end

	titulo.alpha=0
	
	motor:inicializar()
	
	back=motor:crearBackground(motor:crearFondo("images/pilar.png"),motor:crearSuelo(),motor:crearTecho(),motor:crearParedIzq(),motor:crearParedDer())
	pers=motor:crearPersonaje()
	sceneGroup:insert(back)
	sceneGroup:insert(pers)
	
	personaje:addEventListener( "tap", motor.disparoListener )
	Runtime:addEventListener( "touch", motor.movingListener )
	
	grupoBolas=display.newGroup()
	bolas={}
	for i=1, const.bolas.numInicial, 1 do 
		print (i) 
		bolas[i]= motor:crearBola(const.bolas.xDefault,const.bolas.yDefault,33) 
		bolas[i]:addEventListener( "collision", onLocalCollision )
 	end 

	--sceneGroup:insert(grupoBolas)
	--Cuando toque el suelo darle fuerza en y
	--ball:applyForce( 0, 10, ball.x, ball.y )
	
--COLISIONES--
	
	-- bolas[1].collision = onLocalCollision
	-- bolas[1]:addEventListener( "collision", bolas[1] )
	-- suelo.collision = onLocalCollision
	-- suelo:addEventListener( "collision", suelo )
 -----------------------------------------------------------------
 ----
 local function onPostCollisionn( event )
		 if ( event.force > 1.0 ) then
				-- print( "Collision force: " .. event.force .. " Friction: " 	)
		 end
 end
 Runtime:addEventListener( "postCollision", onPostCollisionn)
 ---
 ---------------------------------------------------------	

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

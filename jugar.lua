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
local motor = require("motor")

local scene = composer.newScene()


function scene:create( event )

	local sceneGroup = self.view
	--Sonido--

atontao = audio.loadSound( "sounds/atontao.wav" )
audio.play( atontao )
	function ballCollision (event)
    if ( event.phase == "began" ) then
		if (event.other.myName=="personaje") then
			print( event.target.myName .. ": collision began with " .. event.other.myName )
			const.fluvi=const.fluvi-1
            vidas.text=const.fluvi
			if const.fluvi==0 then				--cero vidas, finaliza el juego
				
				timer.performWithDelay( 500, function()
						physics.stop()
				end, 1 )
				const.fluvi=1
                mes = audio.loadSound( "sounds/mes.wav" )
                audio.play( mes )
				composer.removeScene( "jugar" )
				composer.gotoScene( "menu", "fade", 400 )
			end
			
		elseif (event.other.myName == "flecha") then
			--audio.play( chuache )
			print( event.target.myName .. ": collision began with " .. event.other.myName.."at"..event.x.."and ".. event.y)
			timer.performWithDelay( 1, function()

				for i = 0,2,1 do
					if (event.target.radius == 33) then
                        --event.x y event.y deberia dar la posicion del evento, pero nos devuelve 0 
                        --bola= motor:crearBola(event.x,const.y,22)
						bola= motor:crearBola(const.bolas.xDefault,const.bolas.yDefault,22) 
						if (i == 0) then     
							bola:applyForce( -100, 0, bola.x, bola.y )
						else
							bola:applyForce( 100, 0, bola.x, bola.y )
						end
						bola:addEventListener( "collision", ballCollision )
						grupoBolas:insert(bola)
						sceneGroup:insert (bola)
					elseif (event.target.radius == 22) then
                        --bola= motor:crearBola(event.x,const.event.y,11) 
						bola= motor:crearBola(const.bolas.xDefault,const.bolas.yDefault,11) 
						if (i == 0) then
							bola:applyForce( -50, 0, bola.x, bola.y )
						else
							bola:applyForce( 50, 0, bola.x, bola.y )
						end
						bola:addEventListener( "collision", ballCollision )
						grupoBolas:insert(bola)
						sceneGroup:insert (bola)
					end
				end
			end, 1 )

			event.target:removeSelf( )
			event.other:removeSelf( )
		end
            end
        
	end

	titulo.alpha=0

	
	motor:inicializar_fisica()
	vidas = display.newText(const.fluvi, 0, 0, native.systemFontBold, 24 )
    vidas.x=display.contentWidth-20
 	vidas.y=20
    vidas:setFillColor(0,1,0)
	suelo=motor:crearSuelo()
	techo=motor:crearTecho()
	paredI=motor:crearParedIzq()
	paredD=motor:crearParedDer()
	pers=motor:crearPersonaje()

	back=motor:crearBackground(motor:crearFondo("images/pilar.png"),suelo,techo,paredI,paredD)
	
    
    sceneGroup:insert(back)
	sceneGroup:insert(pers)
	sceneGroup:insert(suelo)
	sceneGroup:insert(paredI)
	sceneGroup:insert(paredD)
	sceneGroup:insert(techo)
	sceneGroup:insert(vidas)
	personaje:addEventListener( "touch", motor.disparoListener )
	Runtime:addEventListener( "touch", motor.movingListener )
	
	grupoBolas=display.newGroup()
	bolas={}
	for i=1, 1, 1 do 
		print (i) 
		--local bolica
		local bolica=motor:crearBola(const.bolas.xDefault,const.bolas.yDefault,33) 
		bolica:addEventListener( "collision", ballCollision )
		sceneGroup:insert (bolica)
		bolas[i]=bolica
        bolica:applyForce( 500, 0, circle.x, circle.y )
 	end 
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
	print("destroy")
	sceneGroup:removeSelf()
	end


-- -------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-- -------------------------------------------------------------------------------

return scene

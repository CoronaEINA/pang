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

--widget.setTheme("widget_theme_android_holo_light")
local scene = composer.newScene()

-- -----------------------------------------------------------------------------------------------------------------
-- All code outside of the listener functions will only be executed ONCE unless "composer.removeScene()" is called.
-- -----------------------------------------------------------------------------------------------------------------

-- local forward references should go here

-- -------------------------------------------------------------------------------


-- "scene:create()"
function scene:create( event )

    
    -- Initialize the scene here.
 	fondo = display.newImageRect( "images/pilar.png", display.contentWidth, display.contentHeight )
	fondo.x = display.contentCenterX
	fondo.y = display.contentCenterY
 	titulo = display.newImage( "images/tittle.png" )
 	titulo.x=display.contentWidth/2
 	titulo.y=display.contentHeight/4
 	--
	
	local sceneGroup = self.view
	
	-- Function to handle button events
	local function handleButtonEvent( event )
 	   if ( "ended" == event.phase ) then
 	   	print("dentro".. event.target.id)
 	   		if event.target.id =="opciones" then
        			composer.gotoScene( "opciones", "fade", 400 )
        		elseif event.target.id=="jugar" then
        			composer.gotoScene( "jugar", "fade", 400 )
        		elseif event.target.id=="creditos" then
        			composer.gotoScene( "creditos", "fade", 400 )
        		elseif event.target.id=="salir" then
        			os.exit()
 	   		end
 	   	
 	   end
	end

-- Crear botones --
local jugar = widget.newButton
{
  width =50,
    height = 20,
    id = "jugar",
  	defaultFile = "images/jugar.png",
    onEvent = handleButtonEvent
}
jugar.x=display.contentWidth/2
jugar.y=display.contentHeight/4+80
sceneGroup:insert(jugar)

local opciones = widget.newButton
{
    width =70,
    height = 20,
    id = "opciones",
    defaultFile = "images/opciones.png",
    onEvent = handleButtonEvent
}
opciones.x=display.contentWidth/2
opciones.y=display.contentHeight/4+80+30
sceneGroup:insert(opciones)

local creditos = widget.newButton
{
    width =70,
    height = 20,
    id = "creditos",
    defaultFile = "images/creditos.png",
    onEvent = handleButtonEvent
}
creditos.x=display.contentWidth/2
creditos.y=display.contentHeight/4+80+60
sceneGroup:insert(creditos)

local salir = widget.newButton
{
    width =40,
    height = 20,
    id = "salir",
    --label = "salir",
        defaultFile = "images/salir.png",
    onEvent = handleButtonEvent
}
salir.x=display.contentWidth/2
salir.y=display.contentHeight/4+80+90
sceneGroup:insert(salir)
	
------------------------------------
 -- Sort everything in the correct z-index order
local stage = display.getCurrentStage()
stage:insert( fondo )
stage:insert( composer.stage )
stage:insert( titulo )  
end


-- "scene:show()"
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase
		
    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
		print("showMenu")
		titulo.alpha=1
		fondo.aplha=1
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

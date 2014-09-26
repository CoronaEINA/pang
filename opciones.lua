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
local conts = require ( "const" )
--widget.setTheme("widget_theme_android_holo_light")
local scene = composer.newScene()

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
 	--titulo = display.newText( "PangMierder", 0, 0, native.systemFontBold, 24 )
 ---	titulo = display.newImage( "tittle.png" )
 	titulo.x=display.contentWidth/2
 	titulo.y=display.contentHeight/4
 	--
 		--sceneGroup:insert(titulo)

	-- Function to handle button events
	local function changeHeart( event )
 	   if ( "ended" == event.phase ) then
        	print( "Button was pressed and released" .. event.target.id)
			if event.target.id =="1" then
        			conts.hearts=1
							fluvi.alpha=1
							fluvi2.alpha=0
							fluvi3.alpha=0
        		elseif event.target.id=="2" then
        			conts.hearts=2
							fluvi.alpha=1
							fluvi2.alpha=1
							fluvi3.alpha=0
        		elseif event.target.id=="3" then
        			conts.hearts=3
							fluvi.alpha=1
							fluvi2.alpha=1
							fluvi3.alpha=1
 	   	end 
 	   end
	end
	----------
		local function returnFunc( event )
 	   if ( "ended" == event.phase ) then
        	composer.gotoScene( "menu", "fade", 0 )
        end
	end

-- Create the widget
--vidas = display.newText( "vidas", 0, 0, native.systemFontBold, 24 )
--vidas.x=display.contentWidth/2-60
--vidas.y=display.contentHeight/4+80
--sceneGroup:insert(vidas)
	
	
	fluvi = display.newImageRect( "images/fluviPixelado.png",  30,30 )
	fluvi.x = display.contentCenterX+40
	fluvi.y = display.contentCenterY+30
	sceneGroup:insert(fluvi)
	--
	fluvi2 = display.newImageRect( "images/fluviPixelado.png", 30,30)
	fluvi2.x = display.contentCenterX+80
	fluvi2.y = display.contentCenterY+30
	sceneGroup:insert(fluvi2)
	--
	fluvi3 = display.newImageRect( "images/fluviPixelado.png",  30,30)
	fluvi3.x = display.contentCenterX+120
	fluvi3.y = display.contentCenterY+30
	sceneGroup:insert(fluvi3)
	--
	fluvi.alpha=1
	fluvi2.alpha=0
	fluvi3.alpha=0
	--
local una = widget.newButton
{
    id = "1",
   -- label = "1",
		defaultFile = "images/uno.png",
    width =20,
    height = 20,
    onEvent = changeHeart
}
una.x=display.contentWidth/2-50
una.y=display.contentCenterY+30
sceneGroup:insert(una)

local dos = widget.newButton
{
    id = "2",
   -- label = "2",
		defaultFile = "images/dos.png",
    width =20,
    height = 20,
    onEvent = changeHeart
}
dos.x=display.contentWidth/2-25
dos.y=display.contentCenterY+30
sceneGroup:insert(dos)

local tres = widget.newButton
{
  
    id = "3",
    --label = "3",
		defaultFile = "images/tres.png",
            width =20,
    height = 20,
    onEvent = changeHeart
}
tres.x=display.contentWidth/2
tres.y=display.contentCenterY+30
sceneGroup:insert(tres)

local returnMenu = widget.newButton
{
  
    id = "returnMenu",
  --  label = "volver",
		defaultFile = "images/volver.png",
    width =70,
    height = 25,
    onEvent = returnFunc
}
returnMenu.x=display.contentWidth/2
returnMenu.y=display.contentHeight/4+140
sceneGroup:insert(returnMenu)



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

--
-- Project: menu
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2014 . All Rights Reserved.
-- 
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
 	pablo = display.newText( "Pablo Alegre: especialista en Ctrl+C Ctrl+V ", 0, 0, 				native.systemFontBold, 24 )
 	pablo.x=display.contentWidth/2
 	pablo.y=display.contentHeight/4+80
 	sceneGroup:insert(pablo)
 	cristofer = display.newText( "Cristofer Sanz: el de los cafes...", 0, 0, native.systemFontBold, 24 )
 	cristofer.x=display.contentWidth/2
 	cristofer.y=display.contentHeight/4+120
 	sceneGroup:insert(cristofer)
 	--
 	
 	
 			local function returnFunc( event )
 	   if ( "ended" == event.phase ) then
        	composer.gotoScene( "menu", "fade", 400 )
        end
	end
 	local returnMenu = widget.newButton
{
  
    id = "returnMenu",
   -- label = "volver",
		defaultFile = "images/volver.png",
    width =60,
    height = 25,
    onEvent = returnFunc
}
returnMenu.x=display.contentWidth/2
returnMenu.y=display.contentHeight/4+150
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
-- hide device status bar
display.setStatusBar( display.HiddenStatusBar )

-- require controller module
conts = require ( "const" )
local composer = require "composer"

-- load first scene
composer.gotoScene( "menu", "fade", 400 )
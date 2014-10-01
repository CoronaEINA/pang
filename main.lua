-- hide device status bar
display.setStatusBar( display.HiddenStatusBar )

-- require controller module
conts = require ( "const" )
local composer = require "composer"

iee = audio.loadSound( "sounds/iee.wav" )
audio.play( iee )
-- load first scene
composer.gotoScene( "menu", "fade", 400 )
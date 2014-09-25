local phisics = require("physics")

physics.start( )

local sheetInfo = require("sprites")
local myImageSheet = graphics.newImageSheet( "sprites.png", sheetInfo:getSheet() )

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


local sprite = display.newSprite( myImageSheet , sequence )
local suelo = display.newLine( 0, display.contentHeight-1, display.contentWidth,  display.contentHeight-1)
suelo:setColor( 0, 0, 0 )

physics.addBody( sprite, "dynamic", {
	bounce = 0.001
	} )
physics.addBody( suelo, "static" )

sprite.x = display.contentCenterX
sprite.y = display.contentHeight - 40
sprite.xScale = 1.5
sprite.yScale = 1.5
sprite:setSequence( "walkForward" )
sprite:play()

function listener(event)
	sprite:applyForce( 0, 30, sprite.x, sprite.y - 20 )
end

Runtime:addEventListener( "tap", listener )
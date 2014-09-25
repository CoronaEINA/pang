--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:6c2ab0c025465a0df95116136922e0ff:67d8e85d6c14e8a52e922f15996c8d30:ce59e0ef6b4af9fefc088af809f682f1$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- pang1
            x=2,
            y=2,
            width=49,
            height=55,

        },
        {
            -- pang2
            x=104,
            y=2,
            width=43,
            height=55,

            sourceX = 2,
            sourceY = 0,
            sourceWidth = 49,
            sourceHeight = 55
        },
        {
            -- pang3
            x=149,
            y=2,
            width=43,
            height=55,

            sourceX = 3,
            sourceY = 0,
            sourceWidth = 49,
            sourceHeight = 55
        },
        {
            -- pang4
            x=194,
            y=2,
            width=43,
            height=55,

            sourceX = 3,
            sourceY = 0,
            sourceWidth = 49,
            sourceHeight = 55
        },
        {
            -- pang5
            x=374,
            y=2,
            width=37,
            height=55,

            sourceX = 6,
            sourceY = 0,
            sourceWidth = 49,
            sourceHeight = 55
        },
        {
            -- pang6
            x=239,
            y=2,
            width=43,
            height=55,

            sourceX = 3,
            sourceY = 0,
            sourceWidth = 49,
            sourceHeight = 55
        },
        {
            -- pang7
            x=284,
            y=2,
            width=43,
            height=55,

            sourceX = 3,
            sourceY = 0,
            sourceWidth = 49,
            sourceHeight = 55
        },
        {
            -- pang8
            x=329,
            y=2,
            width=43,
            height=55,

            sourceX = 3,
            sourceY = 0,
            sourceWidth = 49,
            sourceHeight = 55
        },
        {
            -- pang9
            x=53,
            y=2,
            width=49,
            height=55,

        },
    },
    
    sheetContentWidth = 413,
    sheetContentHeight = 59
}

SheetInfo.frameIndex =
{

    ["pang1"] = 1,
    ["pang2"] = 2,
    ["pang3"] = 3,
    ["pang4"] = 4,
    ["pang5"] = 5,
    ["pang6"] = 6,
    ["pang7"] = 7,
    ["pang8"] = 8,
    ["pang9"] = 9,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo

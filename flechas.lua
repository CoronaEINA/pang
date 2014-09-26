--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:20f3869ea563ba639a4776b2b964358c:edc45e14a798d0404222e9880cab80eb:6e94618de6d8a99fca050a54981ff2f4$
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
            -- flecha1
            x=46,
            y=43,
            width=9,
            height=19,

        },
        {
            -- flecha2
            x=46,
            y=2,
            width=9,
            height=39,

        },
        {
            -- flecha3
            x=35,
            y=2,
            width=9,
            height=59,

        },
        {
            -- flecha4
            x=2,
            y=163,
            width=9,
            height=79,

        },
        {
            -- flecha5
            x=13,
            y=143,
            width=9,
            height=99,

        },
        {
            -- flecha6
            x=24,
            y=2,
            width=9,
            height=119,

        },
        {
            -- flecha7
            x=13,
            y=2,
            width=9,
            height=139,

        },
        {
            -- flecha8
            x=2,
            y=2,
            width=9,
            height=159,

        },
    },
    
    sheetContentWidth = 64,
    sheetContentHeight = 256
}

SheetInfo.frameIndex =
{

    ["flecha1"] = 1,
    ["flecha2"] = 2,
    ["flecha3"] = 3,
    ["flecha4"] = 4,
    ["flecha5"] = 5,
    ["flecha6"] = 6,
    ["flecha7"] = 7,
    ["flecha8"] = 8,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo

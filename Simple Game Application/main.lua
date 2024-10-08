-----------------------------------------------------------------------------------------
-- CS371-01 Programming Assignment 2
-- Displaying and Interacting with a Sprite
-- Eric Delgado
-- 10/11/24
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

local soundTable = {

    hitSound1 = audio.loadSound("hit1.wav"),
    hitSound2 = audio.loadSound("hit2.wav"),
    hitSound3 = audio.loadSound("hit3.wav"),
    gameOver = audio.loadSound("gameOver.wav")

}

local options =
{
    width = 38,
    height = 28,
    numFrames = 24,
    sheetContentWidth = 228,
    sheetContentHeight = 112
}

local sheet = graphics.newImageSheet("Esper.png", options)

local opt =
{
    frames = {
        {x = 0, y = 0, width = 38, height = 28},     -- frame 01: run text
        {x = 38, y = 0, width = 38, height = 28},    -- frame 02: blank 1
        {x = 76, y = 0, width = 38, height = 28},    -- frame 03: blank 2
        {x = 114, y = 0, width = 38, height = 28},   -- frame 04: blank 3
        {x = 152, y = 0, width = 38, height = 28},   -- frame 05: blank 4
        {x = 190, y = 0, width = 38, height = 28},   -- frame 06: blank 5
        {x = 0, y = 28, width = 38, height = 28},    -- frame 07: run 1
        {x = 38, y = 28, width = 38, height = 28},   -- frame 08: run 2
        {x = 76, y = 28, width = 38, height = 28},   -- frame 09: run 3
        {x = 114, y = 28, width = 38, height = 28},  -- frame 10: run 4
        {x = 152, y = 28, width = 38, height = 28},  -- frame 11: run 5
        {x = 190, y = 28, width = 38, height = 28},  -- frame 12: run 6
        {x = 0, y = 56, width = 38, height = 28},    -- frame 13: die text
        {x = 38, y = 56, width = 38, height = 28},   -- frame 14: blank
        {x = 76, y = 56, width = 38, height = 28},   -- frame 15: dead text
        {x = 114, y = 56, width = 38, height = 28},  -- frame 16: dead text
        {x = 152, y = 56, width = 38, height = 28},  -- frame 17: blank
        {x = 190, y = 56, width = 38, height = 28},  -- frame 18: blank
        {x = 0, y = 84, width = 38, height = 28},    -- frame 19: die 1
        {x = 38, y = 84, width = 38, height = 28},   -- frame 20: die 2
        {x = 76, y = 84, width = 38, height = 28},   -- frame 21: dead 1
        {x = 114, y = 84, width = 38, height = 28},  -- frame 22: dead 2
        {x = 152, y = 84, width = 38, height = 28},  -- frame 23: dead 3
        {x = 190, y = 84, width = 38, height = 28}   -- frame 24: blank
    }
}

local sequenceData =
{
    {name = "run", start = 7, count = 6, time = 1000, loopCount = 0},
    {name = "die", frames = {19, 20, 7}, time = 1000, loopCount = 1},
    {name = "dead", start = 21, count = 2, time = 1000, loopCount = 3}
}


local function startGame()

    local esper = display.newSprite(sheet, sequenceData)

    esper:scale(5, 5)

    esper.anchorX = 0;
    esper.anchorY = 0;
    esper.x = display.contentCenterX;
    esper.y = display.contentCenterY;
    esper.xScale = 5;
    esper.yScale = 5;
    esper.HP = 3
    esper.isMoving = false

    esper:setFrame(1)

    function pause(esper)

        esper:pause()
        esper:setFrame(1)

        esper.isMoving = false

    end

    function delete(esper)

        display.remove(esper)
        esper = nil

    end

    local function restartGame(event)

        display.remove(event.target)
        startGame()

    end

    local function showEndText()

        audio.play(soundTable["gameOver"])

        local endText = display.newText({

            text = "End",
            x = display.contentCenterX,
            y = display.contentCenterY,
            font = native.systemFont,
            fontSize = 80

        })

        endText:addEventListener("tap", restartGame)

    end
    local function onScreenTap(event)

        local bounds = esper.contentBounds
        
        -- Preveents this tap event from occurring while an animation is occurring.
        if esper.isMoving then
        
            return

        end

        -- Prevents this tap event from occurring while esper is no longer in memory.
        if bounds == nil then

            return

        end

        -- Prevents this tap event from occuring while tap is within esper's object bounds.
        if event.x >= bounds.xMin and event.x <= bounds.xMax and
        event.y >= bounds.yMin and event.y <= bounds.yMax then

            return

        end

        esper.isMoving = true

        esper:setSequence("run")

        transition.to(esper, {x = event.x, y = event.y, time = 1000, transition = easing.inQuad, onComplete = pause})
        
        esper:play()

    end

    local function damage(event)

        -- Prevents animation from being interrupted during execution.
        if esper.isMoving == true then

            return

        end

        esper.isMoving = true
        esper:setSequence("die")
        esper:play()

        if esper.HP == 3 then
        
            audio.play(soundTable["hitSound1"])
            esper.HP = esper.HP - 1

            -- Prevents any events during animation time duration.
            timer.performWithDelay(1000, function() esper.isMoving = false end)

        elseif esper.HP == 2 then
        
            audio.play(soundTable["hitSound2"])
            esper.HP = esper.HP - 1

            -- Prevents any events during animation time duration.
            timer.performWithDelay(1000, function() esper.isMoving = false end)

        elseif esper.HP == 1 then

            audio.play(soundTable["hitSound3"])
            esper:setSequence("dead")
            esper:play()

            -- Prevents any events during animation time duration.
            timer.performWithDelay(3000,

                function()

                    transition.fadeOut(esper, {time = 2000, onComplete = delete})

                end
            )

            timer.performWithDelay(5000, showEndText)
            
        end

    end

    Runtime:addEventListener("tap", onScreenTap)
    esper:addEventListener("tap", damage)

end

startGame()
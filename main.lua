local love = love

local random = math.random
function uuid()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(
        template,
        "[xy]",
        function(c)
            local v = (c == "x") and random(0, 0xf) or random(8, 0xb)
            return string.format("%x", v)
        end
    )
end

_G.class = require("libs.class")
_G.anim8 = require("src.anim8")
_G.List = require("src.List")
_G.Vector = require("src.Vector")
-- _G.SpriteAnimation = require("src.SpriteAnimation")
_G.Game = require("src.Game")
_G.Container = require("src.Container")
_G.Sprite = require("src.Sprite")
_G.Player = require("src.Player")

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    game = Game:new()
    testStuff()
end

function love.update(delta)
    game:update(delta)
end

function love.draw(delta)
    game:draw(delta)
end

function drawDebugData()
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Current  FPS: " .. tostring(love.timer.getFPS()), 20, 30)
    -- love.graphics.print(layer.hero.position:__tostring(), 20, 50)
    love.graphics.setColor(255, 255, 255)
end

function love.keypressed(key)
    if key == "escape" or key == "c" then
        love.event.quit()
    end
end

function testStuff()
    image = love.graphics.newImage("assets/gfx/characters/character1.png")
    function generateObject(props, animation, animationKey)
        local g = anim8.newGrid(14, 21, image:getWidth(), image:getHeight())
        animation = anim8.newAnimation(g("1-4", 1), 0.1)
        animation.image = image

        local sprite =
            Sprite:new {
            position = Vector(props.x, props.y),
            width = props.width,
            height = props.height
        }
        sprite:addAnimation(animation, animationKey)
        sprite.currentAnimation = animationKey
        sprite.debug = true
        game.scene:addChild(sprite)
    end

    game.scene.debug = true

    -- generateObject(
    --     {
    --         width = 14,
    --         height = 21,
    --         x = 100,
    --         y = 0
    --     },
    --     animation,
    --     "basic"
    -- )

    for i = 1, 30 do
        for j = 1, 30 do
            generateObject(
                {
                    width = 14,
                    height = 21,
                    x = 20 * i,
                    y = 25 * j
                },
                animation,
                "basic"
            )
        end
    end
end

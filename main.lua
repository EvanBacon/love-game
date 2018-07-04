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

class = require "libs.middleclass"
anim8 = require "libs.anim8"
List = require "src.List"
Vector = require "src.Vector"
Game = require "src.Game"
Container = require "src.Container"
Sprite = require "src.Sprite"
Player = require "src.Player"
Input = require "src/Input"

null = nil
undefined = nil
from = require
console = {
    log = function(...)
        -- local args = (...)
        -- if type(args) == "table" then
        --     for k, v in pairs(args) do
        --         if type(v) == "table" then
        --             console.log(v)
        --         else
        --             print(k, v)
        --         end
        --     end
        -- else
        print(...)
        -- end
    end
}

local projectSettings = require "projectSettings"
local Tilemap = require "src/Tilemap"

function love.load()
    local setupScreen = require "utils/setupScreen"
    setupScreen()
    testStuff()
end

function love.update(delta)
    game:update(delta)
end

function love.draw(delta)
    game:draw(delta)
    drawDebugData()
end

function drawDebugData()
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Current  FPS: " .. tostring(love.timer.getFPS()), 20, 30)
    -- love.graphics.print(layer.hero.position:__tostring(), 20, 50)
    love.graphics.setColor(255, 255, 255)
end

function love.keypressed(...)
    game:keypressed(...)
end

function love.wheelmoved(x, y)
    game:wheelmoved(x, y)
end

function testStuff()
    local config = projectSettings()

    local input = Input:new()

    game =
        Game:new(
        {
            input = input
        }
    )

    local tilemap = Tilemap:new()
    tilemap:load(
        {
            world = {
                map = "assets/maps/EmersonIsland.lua"
            }
        }
    )
    game:setTilemap(tilemap)

    game.scene.debug = true

    image = love.graphics.newImage("assets/characters/character1.png")
    function generasteObject(props, animation, animationKey)
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
        return sprite
    end

    -- GameWorld = Tilemap:new(Goblin, "goblins")

    -- for i = 1, 30 do
    --     for j = 1, 30 do
    --         local sprite =
    --             generateObject(
    --             {
    --                 width = 14,
    --                 height = 21,
    --                 x = 20 * i,
    --                 y = 25 * j
    --             },
    --             animation,
    --             "basic"
    --         )
    --     end
    -- end
end

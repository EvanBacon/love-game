local love = love

debugging = true

_G.class = require("libs.class")
_G.Vector = require("src.Vector")
_G.SpriteAnimation = require("src.SpriteAnimation")
_G.Game = require("src.Game")
_G.Container = require("src.Container")
_G.Sprite = require("src.Sprite")

-- GLOBAL DEBUG TOOLS
log = require "libs.debug.log"
inspect = require "libs.debug.inspect"

-- OTHER LIBS
sti = require "libs.sti.sti"
Moan = require "libs.Moan.Moan"
require "map"

-- local player = Sprite(love.graphics.newImage("assets/gfx/characters/character1.png"))
game = Game()

_G.drawMapStuff = true
function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    Moan.selectButton = "z"

    local screen_width = love.graphics.getWidth()
    local screen_height = love.graphics.getHeight()

    -- game.scene.position = Vector(-screen_width / 2, screen_height / 2)
    -- Moan.font = love.graphics.newFont("libs/Moan/assets/Pixel UniCode.ttf", 32)
    currentMap = "assets/maps/prueba.lua"
    playerSpawnObject = "player"
    loadMap(currentMap)
end

function love.update(delta)
    updateMap(delta)
    if drawMapStuff then
        Moan.update(delta)
    end

    if game then
        game:update(delta)
    end
end

function drawDebugData()
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Current  FPS: " .. tostring(love.timer.getFPS()), 20, 30)
    love.graphics.print(layer.hero.position:__tostring(), 20, 50)
    love.graphics.setColor(255, 255, 255)
end

function love.draw(dt)
    if not layer then
        return
    end
    action = not Moan.showingMessage

    if drawMapStuff then
        drawMap()
    end

    if game then
        game:draw(dt)
    end

    Moan.draw()

    drawDebugData()
end

function getObj(entity)
    local res
    for k, object in pairs(map.objects) do
        if object.name == entity then
            res = object
            break
        end
    end
    return res
end

function love.keyreleased(key, key, isrepeat)
    if key == "z" then
        action = true
    end
    Moan.keyreleased(key)
end

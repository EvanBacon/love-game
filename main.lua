debugging = true

function removeItemFromTable(t, item)
    local index = indexOf(t, item)
    t[index] = nifVectorl
end
function indexOf(t, object)
    if "table" == type(t) then
        for i = 1, #t do
            if object == t[i] then
                return i
            end
        end
        return -1
    else
        error("table.indexOf expects table for first argument, " .. type(t) .. " given")
    end
end

_G.class = require("libs.class")
_G.Vector = require("src.Vector")
_G.SpriteAnimation = require("src.SpriteAnimation")
_G.Container = require("src.Container")
_G.Sprite = require("src.Sprite")

-- LOCAL DEBUG TOOLS
local lurker = require "libs.debug.lurker"

-- GLOBAL DEBUG TOOLS
log = require "libs.debug.log"
inspect = require "libs.debug.inspect"

-- OTHER LIBS
sti = require "libs.sti.sti"
Moan = require "libs.Moan.Moan"
require "map"

local gameContainer = Container()
local player = Sprite(love.graphics.newImage("assets/gfx/characters/character1.png"))
_G.gameContainer = gameContainer

function love.load()
    love.graphics.setDefaultFilter("nearest", "nearest", 1)
    Moan.selectButton = "z"
    fuenteTexto = love.graphics.newFont("libs/Moan/assets/Pixel UniCode.ttf", 32)
    Moan.font = fuenteTexto
    mapafile = "assets/maps/prueba.lua"
    playerspawn = "player"
    loadMap(mapafile)
    fastmove = 1

    gameContainer.debug = true
    player.debug = true
    player:addAnimation(
        SpriteAnimation {
            spriteSheet = love.graphics.newImage("assets/gfx/characters/character1.png"),
            width = 14,
            height = 21
        },
        "front"
    )

    player:addAnimation(
        SpriteAnimation {
            spriteSheet = love.graphics.newImage("assets/gfx/characters/character2.png"),
            width = 14,
            height = 21
        },
        "back"
    )
    player.currentAnimation = "back"
    gameContainer:addChild(player)
end

function love.update(delta)
    updateMap(delta)
    Moan.update(delta)
    lurker.update()
    gameContainer:update(delta)
end

function love.draw(dt)
    if not layer then
        return
    end
    if (Moan.showingMessage) then
        action = true
    else
        action = false
    end

    drawMap()

    gameContainer:draw(dt)
    Moan.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("Current  FPS: " .. tostring(love.timer.getFPS()), 20, 30)
    love.graphics.print(tostring(layer.hero.x) .. " " .. tostring(layer.hero.y), 20, 50)
    love.graphics.setColor(255, 255, 255)
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
        if action then
            action = false
        else
            action = true
        end
    end
    Moan.keyreleased(key)
end

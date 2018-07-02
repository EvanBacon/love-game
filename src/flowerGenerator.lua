local love = _G.love
local newAnimation = require "src.newAnimation"

local flowerSprite = love.graphics.newImage("assets/gfx/characters/npc/boykid/back.png")
local flowerAnimation =
    SpriteAnimation {
    spriteSheet = flowerSprite,
    width = 14,
    height = 19
}

local function generateObject(thing, tipo, tabla)
    thing = getObj(thing)

    local flower = Sprite()
    flower:addAnimation(flowerAnimation:clone(), "back")
    flower.currentAnimation = "back"

    flower.body = love.physics.newBody(world, thing.x + 10, thing.y + 15, "static")
    flower.body:setLinearDamping(12)
    flower.body:setFixedRotation(true)
    flower.shape = love.physics.newRectangleShape(15, 10)
    flower.fixture = love.physics.newFixture(flower.body, flower.shape)

    table.insert(tabla, layerflower.nombre)
    return layerflower.nombre
end

function drawNPC(objetoNPC)
    love.graphics.draw(objetoNPC.image, objetoNPC.animation.quads[1], objetoNPC.x + 5, objetoNPC.y - 5)
end

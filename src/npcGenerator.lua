local love = _G.love
local newAnimation = require "src.newAnimation"

local animation = {}

local function generateNPC(nombre, tipo, tabla)
    nombre = getObj(nombre)
    layernpc.nombre = {
        x = nombre.x,
        y = nombre.y,
        width = nombre.width,
        height = nombre.height
    }

    -- animation = {
    --     side = love.graphics.newImage("assets/gfx/characters/character1.png"),
    --     top = love.graphics.newImage("assets/gfx/characters/character2.png"),
    --     bottom = love.graphics.newImage("assets/gfx/characters/character3.png"),
    --     dx = 14,
    --     dy = 21,
    -- }
    -- animation.animation = newAnimation(animation.side, animation.dx, animation.dy, 0.4)

    layernpc.nombre.body = love.physics.newBody(world, layernpc.nombre.x + 10, layernpc.nombre.y + 15, "static")
    layernpc.nombre.body:setLinearDamping(12)
    layernpc.nombre.body:setFixedRotation(true)
    layernpc.nombre.shape = love.physics.newRectangleShape(15, 10)
    layernpc.nombre.fixture = love.physics.newFixture(layernpc.nombre.body, layernpc.nombre.shape)

    layernpc.nombre.image = love.graphics.newImage("assets/gfx/characters/npc/" .. tipo .. "/back.png")
    layernpc.nombre.animation = newAnimation(layernpc.nombre.image, 14, 19, 1)
    table.insert(tabla, layernpc.nombre)
    return layernpc.nombre
end

function drawNPC(objetoNPC)
    --     local spriteNumRun =
    --     math.floor(heroAnimationRun.currentTime / heroAnimationRun.duration * #heroAnimationRun.quads) + 1
    -- local spriteNum = math.floor(heroAnimation.currentTime / heroAnimation.duration * #heroAnimation.quads) + 1

    -- love.graphics.draw(
    --     heroAnimationRun.spriteSheet,
    --     heroAnimationRun.quads[spriteNumRun],
    --     layer.hero.x,
    --     layer.hero.y,
    --     0,
    --     self.hero.escala,
    --     1,
    --     self.hero.offset,
    --     0
    -- )

    love.graphics.draw(objetoNPC.image, objetoNPC.animation.quads[1], objetoNPC.x + 5, objetoNPC.y - 5)
end

return generateNPC, drawNPC

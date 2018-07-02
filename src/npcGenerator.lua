local love = _G.love
local newAnimation = require "src.newAnimation"

function generateObject(layer, nombre, tipo, tabla)
    nombre = getObj(nombre)
    layer.nombre = {
        x = nombre.x,
        y = nombre.y,
        width = nombre.width,
        height = nombre.height
    }

    layer.nombre.body = love.physics.newBody(world, layer.nombre.x + 10, layer.nombre.y + 15, "static")
    layer.nombre.body:setLinearDamping(12)
    layer.nombre.body:setFixedRotation(true)
    layer.nombre.shape = love.physics.newRectangleShape(15, 10)
    layer.nombre.fixture = love.physics.newFixture(layer.nombre.body, layer.nombre.shape)

    layer.nombre.image = love.graphics.newImage("assets/gfx/characters/npc/" .. tipo .. "/back.png")
    layer.nombre.animation = newAnimation(layer.nombre.image, 14, 19, 1)
    table.insert(tabla, layer.nombre)
    return layer.nombre
end

function drawObject(object)
    love.graphics.draw(object.image, object.animation.quads[1], object.x + 5, object.y - 5)
end

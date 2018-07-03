local love = _G.love
local newAnimation = require "src.newAnimation"

function generateObject(layer, objectName, animation, animationKey)
    local object = getObj(objectName)

    local sprite =
        Sprite {
        position = Vector(object.x, object.y),
        width = object.width,
        height = object.height
    }
    print(object.x, object.y)
    sprite:addAnimation(animation, animationKey)
    sprite.currentAnimation = animationKey
    -- sprite:enablePhysics(object.width * 0.7, object.height * 0.7, "static")
    -- sprite.body:setLinearDamping(12)
    -- sprite.body:setFixedRotation(true)

    -- objectsContainer:addChild(sprite)
    --     love.physics.newBody(game.world, layer.npcObjectLayer.x + 10, layer.npcObjectLayer.y + 15, "static")
    return sprite
end

function drawObject(object)
    love.graphics.draw(object.image, object.animation.quads[1], object.x + 5, object.y - 5)
end

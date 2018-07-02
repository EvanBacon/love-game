local class = class
local love = love
local Container = Container

local Sprite =
    class {
    _extends = Container,
    constructor = function(self, image)
        Container.constructor(self)
        self.image = image
    end,
    animations = {},
    currentAnimation = nil
}

function Sprite:addAnimation(animation, key)
    self.animations[key or #self.animations + 1] = animation
end

function Sprite:setWorld(world)
    self.world = world
    self.body = love.physics.newBody(world, 650 / 2, 650 - 50 / 2)
    self.shape = love.physics.newRectangleShape(self.image.width, self.image.height) --make a rectangle with a width of 650 and a height of 50
    self.fixture = love.physics.newFixture(self.body, self.shape) --attach shape to body
end

function Sprite:update(dt)
    Container.draw(self, dt)
    -- maybe just update one animation
    for _, animation in pairs(self.animations) do
        animation:update(dt)
    end
    if self.body then
        self.position.x = self.body:getX()
        self.position.y = self.body:getY()
    end
end

require("table")

function Sprite:getCurrentAnimation()
    if self.currentAnimation and self.animations[self.currentAnimation] then
        return self.animations[self.currentAnimation]
    end
end

function Sprite:draw(dt)
    Container.draw(self, dt)

    local animation = self:getCurrentAnimation()
    if animation then
        local quad = animation:getQuad()
        love.graphics.draw(
            animation.spriteSheet,
            quad,
            self.position.x,
            self.position.y,
            self.rotation,
            self.scale.x,
            self.scale.y,
            self.anchor.x,
            self.anchor.y
        )
    elseif self.image then
        love.graphics.draw(
            self.image,
            self.position.x,
            self.position.y,
            self.rotation,
            self.scale.x,
            self.scale.y,
            self.anchor.x,
            self.anchor.y
        )
    end
end

return Sprite

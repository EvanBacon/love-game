local class = require 'libs/middleclass'
local love = love
local Container = require 'SpriteCore.Container'
--[[
body.setType()
body.getType()
--]]
local Sprite = class('Sprite', Container)

function Sprite:initialize(props)
    props = props or {}
    Container.initialize(self, props)
    self.input = props.input
    self.bodyType = props.bodyType
    self.animations = {}
    self.currentAnimation = nil
    self.moving = true
end

function Sprite:addAnimation(animation, key)
    key = key or animation.name
    self.animations[key or #self.animations + 1] = animation
    animation:update(0)
    if not self.currentAnimation then
        self.currentAnimation = key
    end
end

function Sprite:enablePhysics(width, height, type)
    self:setWorld(game.world, width, height, type)
end

function Sprite:setWorld(world, width, height, type)
    self.world = world
    self.body = love.physics.newBody(world, self.position.x, self.position.y, type)
    self.shape = love.physics.newRectangleShape(width, height) --make a rectangle with a width of 650 and a height of 50
    self.fixture = love.physics.newFixture(self.body, self.shape) --attach shape to body
end

function Sprite:move(dx, dy)
    if self.body then
        self.body:applyForce(dx, dy)
    end
end

function Sprite:update(dt)
    Container.update(self, dt)
    if self.moving then
        -- maybe just update one animation
        for _, animation in pairs(self.animations) do
            animation:update(dt)
        end
    else
        for _, animation in pairs(self.animations) do
            -- animation:reset()
        end
    end

    if self.body then
        self.position.x, self.position.y = self.body:getPosition()
    end

    self:updateInput(dt)
end

function Sprite:updateInput(dt)
    if self.input then
        local delta = self.input:getCameraMovement()
        self:move(delta.x * dt * self.speed, delta.y * dt * self.speed)
    end
end

function Sprite:getCurrentAnimation()
    if self.currentAnimation and self.animations[self.currentAnimation] then
        return self.animations[self.currentAnimation]
    end
end

function Sprite:draw(dt)
    Container.draw(self, dt)
    local animation = self:getCurrentAnimation()
    if animation then
        animation:draw(animation.image, 0, 0, self.rotation, 1, 1, 0, 0)
    elseif self.image then
        love.graphics.draw(self.image, 0, 0, self.rotation, 1, 1, 0, 0)
    end
end

return Sprite

local love = love
local class = require 'libs/middleclass'
local Sprite = require 'SpriteCore/Sprite'

local images = {
    side = love.graphics.newImage('assets/characters/character1.png'),
    back = love.graphics.newImage('assets/characters/character2.png'),
    front = love.graphics.newImage('assets/characters/character3.png')
}

local function generateAnimation(image, width, height, key)
    local g = anim8.newGrid(width, height, image:getWidth(), image:getHeight())
    local animation = anim8.newAnimation(g('1-4', 1), 0.1)
    animation.image = image
    animation.name = key
    return animation
end

local Player = class('Player', Sprite)

function Player:initialize(props)
    props = props or {}
    Sprite.initialize(self, props)

    self.width = 14
    self.height = 21

    local sideAnimation = generateAnimation(images.side, 14, 21, 'side')
    local frontAnimation = generateAnimation(images.front, 15, 21, 'front')
    local backAnimation = generateAnimation(images.back, 14, 21, 'back')

    self:addAnimation(sideAnimation)
    self:addAnimation(frontAnimation)
    self:addAnimation(backAnimation)

    self.scale.x = 2
    self.scale.y = 2
    self:setDirection('down')
    self.moving = true

    local scaledWidth = self.width * self.scale.x
    local scaledHeight = self.height * self.scale.y
    local boundingWidth = (scaledWidth * 0.7)
    local boundingHeight = (scaledHeight * 0.7)
    self.physicsOffset = Vector2(scaledWidth * -0.5, scaledHeight * -0.5)
    self:enablePhysics(boundingWidth, boundingHeight, 'dynamic')
    self.body:setLinearDamping(12)
    self.body:setFixedRotation(true)

    self.speed = 300000
end

function Player:setDirection(direction)
    if self.direction == 'left' or self.direction == 'right' then
        self.currentAnimation = 'side'
    elseif self.direction == 'up' then
        self.currentAnimation = 'front'
    else
        self.currentAnimation = 'back'
    end
end

function Player:updateInput(dt)
    if not game.isControllingCamera then
        Sprite.updateInput(self, dt)

        if love.keyboard.isDown('d') then
            self.currentAnimation = 'side'
            self.animations['side'].flippedH = false
        elseif love.keyboard.isDown('a') then
            self.currentAnimation = 'side'
            self.animations['side'].flippedH = true
        elseif love.keyboard.isDown('w') then
            self.currentAnimation = 'back'
        elseif love.keyboard.isDown('s') then
            self.currentAnimation = 'front'
        end
    end
end

function Player:setWorld(world, width, height, type)
    self.world = world
    self.body = love.physics.newBody(world, self.position.x, self.position.y, type)
    self.shape = love.physics.newCircleShape(height / 2) --make a rectangle with a width of 650 and a height of 50
    self.fixture = love.physics.newFixture(self.body, self.shape) --attach shape to body
end

return Player

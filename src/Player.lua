local class = class
local love = love

local images = {
    side = love.graphics.newImage("assets/characters/character1.png"),
    front = love.graphics.newImage("assets/characters/character2.png"),
    back = love.graphics.newImage("assets/characters/character3.png")
}
local function generateAnimation(image, width, height, key)
    local g = anim8.newGrid(width, height, image:getWidth(), image:getHeight())
    local animation = anim8.newAnimation(g("1-4", 1), 0.1)
    animation.image = image
    animation.name = key
    return animation
end

local Player = class("Player", Sprite)

function Player:initialize(props)
    props = props or {}
    Sprite.initialize(self, props)

    self.width = 14
    self.height = 21

    local sideAnimation = generateAnimation(images.side, 14, 21, "side")
    local frontAnimation = generateAnimation(images.front, 14, 21, "front")
    local backAnimation = generateAnimation(images.back, 15, 21, "back")

    self:addAnimation(sideAnimation)
    self:addAnimation(frontAnimation)
    self:addAnimation(backAnimation)

    self.scale.x = 5
    self.scale.y = 5
    self:setDirection("down")
    self.moving = true
end

function Player:setDirection(direction)
    if self.direction == "left" or self.direction == "right" then
        self.currentAnimation = "side"
    elseif self.direction == "up" then
        self.currentAnimation = "front"
    else
        self.currentAnimation = "back"
    end
end

-- function Player:update(dt)
--     Sprite.update(self, dt)
-- end

return Player

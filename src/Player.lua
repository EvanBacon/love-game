local class = class
local love = love

local Player = class("Player", Sprite)

function Player:initialize(props)
    props = props or {}
    Sprite.initialize(self, props)
    self.direction = "top"
end

function Player:update(dt)
    Sprite.update(self, dt)
    if self.direction == "left" or self.direction == "right" then
        self.currentAnimation = "side"
    elseif self.direction == "top" then
        self.currentAnimation = "top"
    else
        self.currentAnimation = "bottom"
    end
end

return Player

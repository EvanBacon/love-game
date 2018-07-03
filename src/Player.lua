local class = class
local love = love

local Player = class("Player", Sprite)
function Player:constructor(props)
    props = props or {}
    Sprite:constructor(props)
    self.direction = "top"
end

function Player:update(dt)
    Sprite:update(dt)
    if self.direction == "left" or self.direction == "right" then
        self.currentAnimation = "side"
    elseif self.direction == "top" then
        self.currentAnimation = "top"
    else
        self.currentAnimation = "bottom"
    end
end

return Player

local Input = class("Input")
local Vector2 = Vector
local love = love

function Input:initialize()
    self._delta = Vector2:new(0, 0)
    self._scrollDelta = 0
end

function Input:getCameraMovement()
    self._delta.x = 0
    self._delta.y = 0
    if love.keyboard.isDown("d") then
        self._delta.x = self._delta.x + 1
    end
    if love.keyboard.isDown("a") then
        self._delta.x = self._delta.x - 1
    end
    if love.keyboard.isDown("w") then
        self._delta.y = self._delta.y - 1
    end
    if love.keyboard.isDown("s") then
        self._delta.y = self._delta.y + 1
    end
    return self._delta
end

function Input:getCameraZoom()
    return self._scrollDelta
end

return Input

local love = _G.love
local Vector = _G.Vector
local class = class

local Container =
    class {
    constructor = function(self)
    end,
    children = {},
    position = Vector(),
    scale = Vector(1, 1),
    size = Vector(50, 50), --todo
    anchor = Vector(0.5, 0.5),
    rotation = 0
}

function Container:draw(dt)
    love.graphics.push() -- stores the default coordinate system
    love.graphics.translate(self.position.x, self.position.y) -- move the camera position
    love.graphics.scale(self.scale.x, self.scale.y) -- zoom the camera
    -- use the new coordinate system to draw the viewed scene
    for _, child in ipairs(self.children) do
        child:draw(dt)
    end
    if self.debug then
        love.graphics.rectangle("line", 0, 0, self.size.x, self.size.y)
    end
    love.graphics.pop() -- return to the default coordinates
end

function Container:update(dt)
    for _, child in ipairs(self.children) do
        child:update(dt)
    end
end

function Container:addChild(child)
    self.children[#self.children + 1] = child
end

function Container:removeChild(child)
    return removeItemFromTable(self.children, child)
end

return Container

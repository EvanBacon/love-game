local love = _G.love
local Vector = _G.Vector
local class = _G.class

local Container =
    class {
    constructor = function(self)
    end,
    children = {},
    position = Vector(),
    scale = Vector(1, 1),
    width = 50,
    height = 50,
    rotation = 0,
    flipH = false,
    flipV = false
}

function Container:preDraw(dt)
    love.graphics.push() -- stores the default coordinate system

    local translateX = self.position.x
    local translateY = self.position.y
    local scaleX = self.scale.x
    local scaleY = self.scale.y

    if self.flipH then
        scaleX = scaleX * -1
        translateX = translateX + (self.width or 0)
    end

    if self.flipV then
        scaleY = scaleY * -1
        translateY = translateY + (self.height or 0)
    end

    love.graphics.translate(translateX, translateY) -- move the camera position
    love.graphics.scale(scaleX, scaleY) -- zoom the camera
end

function Container:draw(dt)
    -- use the new coordinate system to draw the viewed scene
    for _, child in ipairs(self.children) do
        child:preDraw(dt)
        child:draw(dt)
        child:postDraw(dt)
    end
    self:drawDebug(dt)
end

function Container:drawDebug(dt)
    if self.debug then
        love.graphics.rectangle("line", 0, 0, self.width, self.height)
    end
end

function Container:fullDraw(dt)
    self:preDraw(dt)
    self:draw(dt)
    self:postDraw(dt)
end

function Container:postDraw(dt)
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

local love = _G.love
local Vector = _G.Vector
local class = _G.class

local Container =
    class {
    constructor = function(self, props)
        props = props or {}
        self.width = props.width or 0
        self.height = props.height or 0
        self.position = props.position or Vector()
    end,
    children = {},
    scale = Vector(1, 1),
    rotation = 0,
    flipH = false,
    flipV = false
}

function Container:getAbsolutePosition()
    if self.parent then
        return self.parent:getAbsolutePosition() + self.position
    else
        return self.position
    end
end

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
    child.parent = self
    self.children[#self.children + 1] = child
end

function Container:removeChild(child)
    child.parent = nil
    return removeItemFromTable(self.children, child)
end

return Container

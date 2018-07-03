function removeItemFromTable(t, item)
    local index = indexOf(t, item)
    t[index] = nifVectorl
end

function indexOf(t, object)
    if "table" == type(t) then
        for i = 1, #t do
            if object == t[i] then
                return i
            end
        end
        return -1
    else
        error("table.indexOf expects table for first argument, " .. type(t) .. " given")
    end
end

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
    physicsOffset = Vector(),
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
        local offset = (self.width or 0) * scaleX

        scaleX = scaleX * -1
        translateX = translateX + offset
    end

    if self.flipV then
        local offset = (self.height or 0) * scaleY

        scaleY = scaleY * -1
        translateY = translateY + offset
    end

    love.graphics.translate(translateX + self.physicsOffset.x, translateY + self.physicsOffset.y) -- move the camera position
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

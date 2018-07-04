local love = love
local Vector = Vector
local class = class

local Container = class("Container")

function Container:initialize(props)
    props = props or {}
    self.__key = uuid()
    self.width = props.width or 0
    self.height = props.height or 0
    self.position = props.position or Vector()

    if props.x or props.y then
        self.position = Vector(props.x or 0, props.y or 0)
    else
        self.position = props.position or Vector()
    end

    self.children = List()
    self.scale = Vector(1, 1)
    self.physicsOffset = Vector()
    self.rotation = 0
    self.flipH = false
    self.flipV = false
end

function Container:getAbsolutePosition()
    if self.parent then
        return self.parent:getAbsolutePosition() + self.position
    else
        return self.position
    end
end

function Container:getAbsoluteScale()
    if self.parent then
        local scale = self.parent:getAbsoluteScale()
        return Vector(scale.x * self.scale.x, scale.y * self.scale.y)
    else
        return self.scale
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

    love.graphics.translate(translateX + self.physicsOffset.x, translateY + self.physicsOffset.y)
    love.graphics.scale(scaleX, scaleY)
end

function Container:draw(dt)
    -- use the new coordinate system to draw the viewed scene
    self.children:forEach(
        function(child)
            if child.preDraw then
                child:preDraw(dt)
            end
            child:draw(dt)
            if child.postDraw then
                child:postDraw(dt)
            end
        end
    )
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
    love.graphics.pop()
end

function Container:update(dt)
    self.children:forEach(
        function(child, index)
            child:update(dt)
        end
    )
end

function Container:addChild(child, index)
    child.parent = self
    self.children:add(child, index or child.__key)
end

function Container:removeChild(child)
    child.parent = nil
    self.children:remove(child.__key)
end

function Container:removeAllChildren()
    self.children:forEach(
        function(child)
            child.parent = nil
        end
    )
    self.children = List()
end

return Container

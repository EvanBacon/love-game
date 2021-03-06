local love = love
local Vector2 = Vector2
local class = require 'libs/middleclass'
local Node = class('Node')
local List = require 'utils/List'
local uuid = require 'utils/uuid'

function Node:initialize(props)
    props = props or {}
    self.__key = uuid()
    self.width = props.width or 0
    self.height = props.height or 0
    self.position = props.position or Vector2()

    if props.x or props.y then
        self.position = Vector2(props.x or 0, props.y or 0)
    else
        self.position = props.position or Vector2()
    end

    self.children = List()
    self.scale = Vector2(1, 1)
    self.physicsOffset = Vector2()
    self.rotation = 0
    self.flipH = false
    self.flipV = false
    self.debugPhysics = props.debugPhysics
    self.debug = props.debug
end

function Node:getAbsolutePosition()
    if self.parent then
        return self.parent:getAbsolutePosition() + self.position
    else
        return self.position
    end
end

function Node:getAbsoluteScale()
    if self.parent then
        local scale = self.parent:getAbsoluteScale()
        return Vector2(scale.x * self.scale.x, scale.y * self.scale.y)
    else
        return self.scale
    end
end

function Node:preDraw(dt)
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

function Node:draw(dt)
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

function Node:drawDebug(dt)
    if self.debug then
        love.graphics.rectangle('line', 0, 0, self.width, self.height)
    end
end

function Node:fullDraw(dt)
    self:preDraw(dt)
    self:draw(dt)
    self:postDraw(dt)
end

function Node:postDraw(dt)
    love.graphics.pop()
end

function Node:update(dt)
    self.children:forEach(
        function(child, index)
            child:update(dt)
        end
    )
end

function Node:addChild(child, index)
    child.parent = self
    self.children:add(child, index or child.__key)
end

function Node:removeChild(child)
    child.parent = nil
    self.children:remove(child.__key)
end

function Node:removeAllChildren()
    self.children:forEach(
        function(child)
            child.parent = nil
        end
    )
    self.children = List()
end

return Node

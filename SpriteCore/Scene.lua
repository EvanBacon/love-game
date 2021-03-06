local class = require 'libs/middleclass'
local love = love

local Node = require 'SpriteCore/Node'
local Scene = class('Scene', Node)

function Scene:initialize(props)
    props = props or {}
    Node.initialize(self, props)
end

function Scene:draw(dt)
    Node.draw(self, dt)
    if self.debugPhysics then
        love.graphics.push('all')
        love.graphics.setColor(0, 1, 0)
        for _, body in pairs(game.world:getBodies()) do
            for _, fixture in pairs(body:getFixtures()) do
                local shape = fixture:getShape()
                if shape:typeOf('CircleShape') then
                    local cx, cy = body:getWorldPoints(shape:getPoint())
                    love.graphics.circle('line', cx, cy, shape:getRadius())
                elseif shape:typeOf('PolygonShape') then
                    love.graphics.polygon('line', body:getWorldPoints(shape:getPoints()))
                else
                    love.graphics.line(body:getWorldPoints(shape:getPoints()))
                end
            end
        end
        love.graphics.pop()
    end
end

return Scene

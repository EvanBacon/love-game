local love = _G.love
local class = _G.class
local Container = Container

local Game =
    class {
    constructor = function(self, props)
        props = props or {}

        if props.sceneProps then
            self.scene = Container(props.sceneProps)
        elseif props.scene then
            self.scene = props.scene
        else
            self.scene = Container()
        end

        self.world = love.physics.newWorld(0, 0)
    end
}

function Game:update(dt)
    self.scene:update(dt)
    self.world:update(dt)
end

function Game:draw(dt)
    self.scene:fullDraw(dt)
end

return Game

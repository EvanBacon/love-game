local love = _G.love
local class = _G.class

local Game = class("Game")

function Game:initialize(props)
    props = props or {}
    if props.sceneProps then
        self.scene = Container:new(props.sceneProps)
    elseif props.scene then
        self.scene = props.scene
    else
        self.scene = Container:new()
    end

    -- _G.playerContainer = Container()
    -- self.scene:addChild(_G.playerContainer)

    -- _G.objectsContainer = Container()
    -- self.scene:addChild(_G.objectsContainer)

    self.world = love.physics.newWorld(0, 0)
end

function Game:update(dt)
    self.scene:update(dt)
    self.world:update(dt)
end

function Game:draw(dt)
    self.scene:fullDraw(dt)
end

return Game

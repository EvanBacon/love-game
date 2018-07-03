local love = love
local class = class

local push = require "libs/push"
local Camera = require "src/Camera"
local Container = require "src/Container"
local Game = class "Game"

function Game:initialize(props)
    props = props or {}
    if props.sceneProps then
        self.scene = Container:new(props.sceneProps)
    elseif props.scene then
        self.scene = props.scene
    else
        self.scene = Container:new()
    end

    self.tilemap = props.tilemap
    self.input = props.input

    assert(self.tilemap, "Error: Game: need props.tilemap")
    assert(self.input, "Error: Game: need props.input")

    self.scene:addChild(self.tilemap)

    self.camera = Camera:new(self.input, self.tilemap)

    love.physics.setMeter(16)
    self.world = love.physics.newWorld(0, 0)
    self.tilemap.map:box2d_init(self.world)
end

function Game:update(dt)
    self.camera:checkInputs(dt)
    self.scene:update(dt)
    self.world:update(dt)
end

function Game:draw(dt)
    self.camera:set()
    -- push:start()
    self.scene:fullDraw(dt)
    -- push:finish()
    self.camera:unset()
end

-- Possibly move this to an abstraction of class

function Game:wheelmoved(x, y)
    self.input._scrollDelta = y
end

function Game:keypressed(key)
    print(key)
    if key == "escape" or key == "c" then
        love.event.quit()
    end
    self.input._scrollDelta = y
end

return Game

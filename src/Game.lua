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

    self.input = props.input

    assert(self.input, "Error: Game: need props.input")

    love.physics.setMeter(16)
    self.world = love.physics.newWorld(0, 0)
    -- self.camera:renderWithRelativePosition(1, 0)
end

function Game:setTilemap(tilemap)
    self.tilemap = tilemap
    self.tilemap.map:box2d_init(self.world)
    self:buildCamera(self.input, self.tilemap)
    if self.playerData then
        self:setPlayer(Player:new(self.playerData))
        self.player.width = 13
        self.player.height = 29
        self.player.debug = true
        -- self.player.position:setMuted(-10, 0)
        self.camera:renderWithRelativePosition(0.5, 0.8)
    end
end

function Game:buildCamera(input, tilemap)
    self.camera = Camera:new(input, tilemap)
    self.scene:addChild(self.camera)
end

function Game:setPlayer(player)
    self.player = player
    console.log("add player", self.player.position.x)

    self.scene:addChild(player)
end

function Game:update(dt)
    self.scene:update(dt)
    self.world:update(dt)
end

function Game:draw(dt)
    -- push:start()
    self.scene:fullDraw(dt)
    -- push:finish()
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

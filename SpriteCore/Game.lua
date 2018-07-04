local love = love

local class = require 'libs/middleclass'
local push = require 'libs/push'

local Scene = require 'SpriteCore/Scene'
local Camera = require 'SpriteCore/Camera'
--todo abstract
local Player = require 'game/Player'

local Game = class 'Game'

function Game:initialize(props)
    props = props or {}
    if props.sceneProps then
        self.scene = Scene:new(props.sceneProps)
    elseif props.scene then
        self.scene = props.scene
    else
        self.scene = Scene:new()
    end

    self.debugPhysics = true
    self.isControllingCamera = false
    self.input = props.input

    assert(self.input, 'Error: Game: need props.input')

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
        self.player.debug = true
        self.player.input = self.input
        self.camera:renderWithRelativePosition(0.5, 0.8)
    end
end

function Game:buildCamera(input, tilemap)
    self.camera = Camera:new(input, tilemap)
    self.scene:addChild(self.camera)
end

function Game:setPlayer(player)
    self.player = player
    print('add player', self.player.position.x)

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
    if key == 'escape' or key == 'c' then
        love.event.quit()
    elseif key == 'e' then
        self.isControllingCamera = not self.isControllingCamera
    end
    self.input._scrollDelta = y
end

return Game

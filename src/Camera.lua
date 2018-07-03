local Camera = class("Camera")
local HumpCam = require("libs.hp_camera")
local Vector2 = require("src.Vector")

function Camera:initialize(inputManager, map)
    self.camera = HumpCam.new()
    self.map = map
    self.position = Vector2:new(0, 0)
    self.delta = Vector2:new(0, 0)
    self.movementSpeed = 250 * 2
    self.scale = Vector2:new(1, 1)
    self.input = inputManager
end

function Camera:checkInputs(dt)
    delta = self.input:getCameraMovement()

    local deltaVector = {
        x = delta.x * dt * self.movementSpeed,
        y = delta.y * dt * self.movementSpeed
    }
    self.camera:move(deltaVector.x, deltaVector.y)
end

function Camera:getCenter()
    local tx = self.camera.x - self.viewportWidth / 2
    local ty = self.camera.y - self.viewportHeight / 2
    return tx, ty
end

function Camera:follow(x, y)
    self.camera:lock(x, y)
end

function Camera:setWithBounds(minX, maxX, minY, maxY)
    assert(minX <= maxX, "ERROR: Camera: setWithBounds: minX must be smaller than maxX")
    assert(minY <= maxY, "ERROR: Camera: setWithBounds: minY must be smaller than maxY")
    -- assert(
    --     (minY == maxY and maxY == 0) or (minX == maxX and maxX == 0),
    --     "ERROR: Camera: setWithBounds: Bounds must be larger than zero"
    -- )
    local tx, ty = self:getCenter()

    ty = math.min(maxY, math.max(minY, ty))
    tx = math.min(maxX, math.max(minX, tx))

    tx = math.floor(tx)
    ty = math.floor(ty)

    self.camera:attach()
    self.map.map:draw(-tx, ty)

    self.camera.x = tx + self.viewportWidth / 2
    self.camera.y = ty + self.viewportHeight / 2
end

function Camera:set()
    self.viewportWidth = love.graphics.getWidth()
    self.viewportHeight = love.graphics.getHeight()

    local tilemapW = self.map.width * self.map.tilewidth
    local tilemapH = self.map.height * self.map.tileheight

    local minX = 0
    local maxX = tilemapW - self.viewportWidth

    local minY = self.viewportHeight - tilemapH
    local maxY = 0

    self:setWithBounds(minX, maxX, minY, maxY)
end

function Camera:unset()
    self.camera:detach()
end

return Camera

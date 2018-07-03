local Camera = class("Camera")
local HumpCam = require("libs.hp_camera")
local Vector2 = require("src.Vector")

function Camera:initialize(inputManager, map)
    self.camera = HumpCam.new()
    self.map = map
    self.position = Vector2:new(0, 0)
    self.delta = Vector2:new(0, 0)
    self.movementSpeed = 250
    self.scale = Vector2:new(1, 1)
    self.input = inputManager
end

function Camera:checkInputs(dt)
    delta = self.input:getCameraMovement()
    self.camera:move(delta.x * dt * self.movementSpeed, delta.y * dt * self.movementSpeed)

    -- Clamps
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()
    local tilemapW = self.map.width * self.map.tilewidth
    local tilemapH = self.map.height * self.map.tileheight
    local centerX = w / 2
    local centerY = h / 2
    if self.camera.x - centerX < 0 then
        self.camera.x = centerX
    end
    if self.camera.x + centerX > tilemapW then
        self.camera.x = tilemapW - centerX
    end
    if self.camera.y + centerY < 0 then
        self.camera.y = -centerY
    end
    if self.camera.y > centerY then
        self.camera.y = centerY
    end
end

function Camera:set()
    local tilemapW = self.map.width * self.map.tilewidth
    local tilemapH = self.map.height * self.map.tileheight
    local tx = self.camera.x - love.graphics.getWidth() / 2
    local ty = self.camera.y - love.graphics.getHeight() / 2
    if tx < 0 then
        tx = 0
    end
    if tx > tilemapW - love.graphics.getWidth() then
        tx = tilemapW - love.graphics.getWidth()
    end
    if ty > tilemapH - love.graphics.getHeight() then
        ty = tilemapH - love.graphics.getHeight()
    end

    tx = math.floor(tx)
    ty = math.floor(ty)

    self.camera:attach()
    self.map.map:draw(-tx, ty)
end

function Camera:unset()
    self.camera:detach()
end

return Camera

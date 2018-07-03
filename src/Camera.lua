local Camera = class("Camera")
local Vector2 = require("src.Vector")

function Camera:initialize(inputManager, map)
    self.viewportWidth = love.graphics.getWidth()
    self.viewportHeight = love.graphics.getHeight()
    self.map = map
    self.position = Vector2:new(0, 0)
    self.delta = Vector2:new(0, 0)
    self.movementSpeed = 250 * 2
    self.scale = Vector2:new(1, 1)
    self.input = inputManager
    self.x = 0
    self.y = 0
end

function Camera:move(x, y)
    self.x = self.x + x
    self.y = self.y + y
end

function Camera:getCameraCenter()
    local width, height = self:availableSize()
    local tx = self.x + (width / 2)
    local ty = self.y + (height / 2)
    return tx, ty
end

function Camera:update(dt)
    local delta = self.input:getCameraMovement()
    self:move(delta.x * dt * self.movementSpeed, delta.y * dt * self.movementSpeed)
end

function Camera:draw()
    self.viewportWidth = love.graphics.getWidth()
    self.viewportHeight = love.graphics.getHeight()

    local x, y = self:clampPoint(self.x, self.y)
    self.x = x
    self.y = y
    self.map.map:draw(-x, -y)
end

function Camera:clampPoint(x, y)
    local minX, maxX, minY, maxY = self:getBounds()
    x = math.min(maxX, math.max(minX, x))
    y = math.min(maxY, math.max(minY, y))
    x = math.floor(x)
    y = math.floor(y)
    return x, y
end

function Camera:getBounds()
    local w, h = self:availableSize()
    return 0, w, 0, h
end

function Camera:availableSize()
    local tilemapW = self.map.width * self.map.tilewidth
    local tilemapH = self.map.height * self.map.tileheight

    local w = tilemapW - self.viewportWidth
    local h = tilemapH - self.viewportHeight

    return w, h
end

function Camera:renderWithRelativePosition(x, y, isCenter)
    local w, h = self:availableSize()
    self.x = w * x
    self.y = h * y

    if isCenter then
        self.x = self.x + (self.viewportWidth / 2)
        self.y = self.y + (self.viewportWidth / 2)
    end
end

return Camera

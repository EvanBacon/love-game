local class = class
local love = love

local SpriteAnimation =
    class {
    _kind = "SpriteAnimation",
    -- { spriteSheet: Image, width: number, height: number, duration: double }
    init = function(self, props)
        self.spriteSheet = props.spriteSheet
        self.width = props.width or self.spriteSheet.getHeight()
        self.height = props.height or self.spriteSheet.getWidth()
        self.duration = props.duration or 1.0
        self:build()
    end,
    quads = {},
    currentTime = 0
}

function SpriteAnimation:build()
    for y = 0, self.spriteSheet:getHeight() - self.height, self.height do
        for x = 0, self.spriteSheet:getWidth() - self.width, self.width do
            table.insert(
                self.quads,
                love.graphics.newQuad(x, y, self.width, self.height, self.spriteSheet:getDimensions())
            )
        end
    end
end

function SpriteAnimation:reset()
    self.currentTime = 0
    self:update(0)
end

function SpriteAnimation:update(dt)
    self.spriteIndex = math.floor(self.currentTime / self.duration * #self.quads) + 1
    self.currentTime = self.currentTime + dt
    if self.currentTime >= self.duration then
        self.currentTime = self.currentTime - self.duration
    end
end

function SpriteAnimation:getQuad()
    return self.quads[self.spriteIndex]
end

return SpriteAnimation

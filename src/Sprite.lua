local class = class
local Container = Container
local Sprite =
    class {
    _extends = Container,
    constructor = function(self, image)
        Container.constructor(self)
        self.image = image
    end
}

function Sprite:setWorld(world)
    self.world = world
    self.body = love.physics.newBody(world, 650 / 2, 650 - 50 / 2)
    self.shape = love.physics.newRectangleShape(self.image.width, self.image.height) --make a rectangle with a width of 650 and a height of 50
    self.fixture = love.physics.newFixture(self.body, self.shape) --attach shape to body
end

function Sprite:update(dt)
    Container.draw(self, dt)
    if self.body then
        self.position.x = self.body:getX()
        self.position.y = self.body:getY()
    end
end

function Sprite:draw(dt)
    Container.draw(self, dt)

    love.graphics.draw(
        self.image,
        self.position.x,
        self.position.y,
        self.rotation,
        self.scale.x,
        self.scale.y,
        self.anchor.x,
        self.anchor.y
    )
end

return Sprite

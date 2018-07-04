local class = require "libs/middleclass"
local sti = require "libs/sti/sti"
local Dynamic = require "maps/dynamic"

local Tilemap = class "Tilemap"

function Tilemap:initialize(being_class, config_key)
    self.being_class = being_class
    self.config_key = config_key
end

function Tilemap:load(config)
    local mapLocator = config.world.map
    local dynamic = Dynamic:new("assets/maps/EmersonIsland") -- config.world.map
    -- randomize the ground layer of the map
    dynamic:randomize("ground")

    self.map = sti(dynamic:getMap(), {"box2d"})
    self.width = self.map.width
    self.tilewidth = self.map.tilewidth
    self.height = self.map.height
    self.tileheight = self.map.tileheight
    self.entities = {}

    local walls = self.map.layers["walls"]
    local walkTable = {}

    if walls ~= nil then
        for y = 1, walls.height do
            walkTable[y] = {}
            for x = 1, walls.width do
                if walls.data[y][x] ~= nil then
                    walkTable[y][x] = 1
                else
                    walkTable[y][x] = 0
                end
            end
        end
    end

    -- get our spawn location
    self.entities["spawn"] = {}

    local spawn = self.map.layers["spawn"]

    if spawn and spawn.objects then
        local spawnPoint = nil
        if spawn ~= nil then
            for index, object in ipairs(spawn.objects) do
                if object.type == "player" and not game.player then
                    game.playerData = object
                elseif object.type == "npc" then
                end
                -- for x, _ in pairs(xTable) do
                --     spawnPoint = Point:new(x, y)
                --     break
                -- end
            end
        end
    end

    -- food layer
    self.entities["food"] = {}
    local food = self.map.layers["food"]
    if food and food.data then
        for y, xTable in pairs(food.data) do
            for x, _ in pairs(xTable) do
                local point = Point:new(x, y)
                table.insert(self.entities["food"], point)
            end
        end
    end

    --   Beings layers
    self.walkTable = walkTable

    -- if spawnPoint ~= nil then
    --     self.map:addCustomLayer("Beings", 5)
    --     local beingLayer = self.map.layers["Beings"]
    --     beingLayer.beings = {}
    --     local being = self.being_class:new(config[self.config_key], spawnPoint, self)
    --     table.insert(beingLayer.beings, being)

    --     function beingLayer:update(dt)
    --         for _, being in ipairs(self.beings) do
    --             being:update(dt)
    --         end
    --     end

    --     function beingLayer:draw()
    --         for _, being in ipairs(self.beings) do
    --             being:draw()
    --         end
    --     end
    -- end
end

function Tilemap:getSize()
    local tilemapW = self.map.width * self.map.tilewidth
    local tilemapH = self.map.height * self.map.tileheight
    return tilemapW, tilemapH
end

function Tilemap:getPoints(entity)
    return self.entities[entity]
end

function Tilemap:update(dt)
    self.map:update(dt)
end

function Tilemap:draw()
    -- Draw the map and all objects within
    love.graphics.setColor(255, 255, 255)
    -- self.map:draw(1, 1, 0.45, 0.45)
end

return Tilemap

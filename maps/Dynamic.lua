local Dynamic = class("Dynamic")

function Dynamic:initialize(example_map_path)
    -- require tiled map.lua file, removing the lua portion of the substring
    self.mapTable = require(example_map_path) --example_map_path:sub(1, -5)
    self.mapPath = example_map_path
    self.width = self.mapTable.width
    self.height = self.mapTable.height
end

function Dynamic:getMap()
    return self.mapPath .. ".lua" --self.mapTable
end

function Dynamic:randomize(layer_name)
    math.randomseed(os.time())
    local random_layer
    local unique_values = {}
    local hash = {}
    local randomized_data = {}
    local layer_position = 0

    -- Get the layer specified
    for k, layer in ipairs(self.mapTable.layers) do
        if layer.name == layer_name then
            layer_position = k
            random_layer = layer
        end
    end

    -- get unique values within data
    for _, v in ipairs(random_layer.data) do
        if (not hash[v]) then
            unique_values[#unique_values + 1] = v
            hash[v] = true
        end
    end

    -- create a table using randomized data
    for i = 1, (self.width * self.height) do
        local rand = unique_values[math.random(#unique_values)]
        table.insert(randomized_data, rand)
    end

    -- set the new randomized layer
    self.mapTable.layers[layer_position].data = randomized_data
end
return Dynamic

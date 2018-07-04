local exports = {
    'Container',
    'Scene',
    'Tilemap',
    'Camera',
    'Sprite',
    'Game'
}
local lib = {}
for _, v in pairs(exports) do
    lib[v] = require((...) .. '.' .. v)
end
return lib

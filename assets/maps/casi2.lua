require "src.maphelper"
path = "assets/maps/tiledmaps/casi2.lua"

local map
function Mapload()
    mapmusic = "assets/music/tracks/route2bw.ogg"
    map = getObj("world")
end
function Mapdraw()
end
function Mapupdate(delta)
    changeMap("down", map, "assets/maps/world.lua", "casi2")
end

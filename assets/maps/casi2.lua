require "src.maphelper"
path = "assets/maps/tiledmaps/casi2.lua"

local map
function Mapload()
    mapmusic = "assets/music/tracks/route2bw.ogg"
    map = getObj("prueba")
end
function Mapdraw()
end
function Mapupdate(delta)
    changeMap("down", map, "assets/maps/prueba.lua", "casi2")
end

require "src.maphelper"
path = "assets/maps/tiledmaps/cave.lua"

function Mapload()
    mapmusic = "assets/music/tracks/route2bw.ogg"
    --warps
    prueba = getObj("prueba")
end

function Mapdraw()
end

function Mapupdate(delta)
    --function changeMap(mirada, nombrewarp, destinofile, positionDestino, miradadestino)
    changeMap("down", prueba, "assets/maps/prueba.lua", "cave")
end

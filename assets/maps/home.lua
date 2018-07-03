require "src.maphelper"
path = "assets/maps/tiledmaps/home.lua"
function Mapload()
    -- mapmusic = "assets/music/tracks/route2bw.ogg"
    player.direction = "top"
end
function Mapdraw()
end
function Mapupdate()
    changeMap("down", getObj("warp"), "assets/maps/world.lua", "home")
end

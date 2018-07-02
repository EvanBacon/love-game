require "src.maphelper"
path = "assets/maps/tiledmaps/casita.lua"
local map = "assets/maps/prueba.lua"
function Mapload()
    mapmusic = "assets/music/tracks/route2bw.ogg"
    herofacing = "top"
end
function Mapdraw()
end
function Mapupdate(delta)
    -- Collision detection function;
    -- Returns true if two boxes overlap, false if they don't;
    -- x1,y1 are the top-left coords of the first box, while w1,h1 are its width and height;
    -- x2,y2,w2 & h2 are the same, but for the second box.
    poster1 = getObj("warp")
    changeMap("down", poster1, map, "casita")
end

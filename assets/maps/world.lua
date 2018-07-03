require "src.maphelper"
require("src.npcGenerator")
local love = _G.love
path = "assets/maps/tiledmaps/world.lua"

local playerTopAnimation =
    SpriteAnimation {
    spriteSheet = love.graphics.newImage("assets/gfx/characters/character2.png"),
    width = 14,
    height = 21
}
function Mapload()
    mapmusic = "assets/music/tracks/route2bw.ogg"
    --signs
    -- poster1 = getObj("poster1")
    --warps
    home = getObj("home")
    -- club = getObj("club")
    -- cave = getObj("cave")
    --npcs
    -- npcs = {}
    sven = generateObject(layernpc, "charlie", playerTopAnimation, "top")
    sven.moving = true
    -- manuel = generateObject(layernpc, "manuel", "boykid", npcs)

    -- drawObjects(npcs)
end
function Mapdraw()
end
function Mapupdate(delta)
    --function changeMap(mirada, nameDoor, destinofile, positionDestino, miradadestino)
    changeMap("top", home, "assets/maps/home.lua", "warp")
    -- changeMap("top", club, "assets/maps/casi2.lua", "prueba", "top")
    -- changeMap("top", cave, "assets/maps/cave.lua", "prueba", "top")
    -- if canispeaktothesign("top", poster1) then
    --     allowMove = false --lockall
    --     avatarmoan = love.graphics.newImage("assets/gfx/imagesmoan/wallSign.png")
    --     Moan.speak("Cartel", {"It's-a me, your cartel"}, {0, 0, image = avatarmoan})
    -- end
    --releaseall equivalent. Not implemented in a function by convenience for complex map scripts
    -- if Moan.showingMessage == false then
    --     allowMove = true
    -- end
    -- if canispeaktothenpc(sven) then
    --     allowMove = false --lockall
    --     avatarmoan = love.graphics.newImage("assets/gfx/imagesmoan/wallSign.png")
    --     Moan.speak("Sven", {"Acaso tengo cara-cartel?"}, {0, 0, image = avatarmoan})
    -- end
    --releaseall equivalent. Not implemented in a function by convenience for complex map scripts
    -- if Moan.showingMessage == false then
    --     allowMove = true
    -- end
end

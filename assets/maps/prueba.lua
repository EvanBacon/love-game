require "src.maphelper"
local generateNPC = require("src.npcGenerator")
local love = _G.love
path = "assets/maps/tiledmaps/prueba.lua"

function Mapload()
    mapmusic = "assets/music/tracks/route2bw.ogg"
    --signs
    poster1 = getObj("poster1")
    --warps
    casita = getObj("casita")
    casi2 = getObj("casi2")
    cave = getObj("cave")
    --npcs
    npcs = {}
    sven = generateNPC("sven", "boykid", npcs)
    manuel = generateNPC("manuel", "boykid", npcs)
    drawnpcs(npcs)
end
function Mapdraw()
end
function Mapupdate(delta)
    --function changemapa(mirada, nombrewarp, destinofile, positionDestino, miradadestino)
    changemapa("top", casita, "assets/maps/casita.lua", "warp")
    changemapa("top", casi2, "assets/maps/casi2.lua", "prueba", "top")
    changemapa("top", cave, "assets/maps/cave.lua", "prueba", "top")
    if canispeaktothesign("top", poster1) then
        allowMove = false --lockall
        avatarmoan = love.graphics.newImage("assets/gfx/imagesmoan/wallSign.png")
        Moan.speak("Cartel", {"It's-a me, your cartel"}, {0, 0, image = avatarmoan})
    end
    --releaseall equivalent. Not implemented in a function by convenience for complex map scripts
    if Moan.showingMessage == false then
        allowMove = true
    end
    if canispeaktothenpc(sven) then
        allowMove = false --lockall
        avatarmoan = love.graphics.newImage("assets/gfx/imagesmoan/wallSign.png")
        Moan.speak("Sven", {"Acaso tengo cara-cartel?"}, {0, 0, image = avatarmoan})
    end
    --releaseall equivalent. Not implemented in a function by convenience for complex map scripts
    if Moan.showingMessage == false then
        allowMove = true
    end
end

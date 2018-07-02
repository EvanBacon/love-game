require "src.npcGenerator"

function changeMap(mirada, nombrewarp, destinofile, positionDestino, miradadestino)
    local action = _G.action
    local herofacing = _G.herofacing
    local layer = _G.layer
    local herodx = _G.herodx
    local herody = _G.herody
    local CheckCollision = _G.CheckCollision

    if
        action and herofacing == mirada and
            CheckCollision(
                layer.hero.x,
                layer.hero.y,
                herodx,
                herody,
                nombrewarp.x,
                nombrewarp.y,
                nombrewarp.width,
                nombrewarp.height
            )
     then
        _G.newMapa = destinofile
        playerspawn = positionDestino
        if miradadestino == nil then
            herofacing = "down"
        else
            herofacing = miradadestino
        end
    end
end
function canispeaktothesign(facing, signObj)
    return action and not Moan.showingMessage and facing == herofacing and
        CheckCollision(layer.hero.x, layer.hero.y, herodx, herody, signObj.x, signObj.y, signObj.width, signObj.height)
end
function canispeaktothenpc(npc)
    return action and not Moan.showingMessage and
        CheckCollision(layer.hero.x, layer.hero.y, herodx, herody, npc.x, npc.y, npc.width, npc.height)
end

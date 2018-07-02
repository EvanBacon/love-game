require "src.npcGenerator"

function changemapa(mirada, nombrewarp, destinofile, positionDestino, miradadestino)
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
        newMapa = destinofile
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

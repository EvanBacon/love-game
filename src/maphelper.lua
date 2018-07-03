require "src.npcGenerator"

function changeMap(mirada, nameDoor, destinofile, positionDestino, miradadestino)
    local action = _G.action

    local layer = _G.layer

    local CheckCollision = _G.CheckCollision

    if
        action and
            CheckCollision(
                layer.hero.position.x,
                layer.hero.position.y,
                layer.hero.width,
                layer.hero.height,
                nameDoor.x,
                nameDoor.y,
                nameDoor.width,
                nameDoor.height
            )
     then
        _G.newMapa = destinofile
        playerSpawnObject = positionDestino
        if miradadestino == nil then
            player.direction = "down"
        else
            player.direction = miradadestino
        end
    end
end
function canispeaktothesign(facing, signObj)
    return action and not Moan.showingMessage and facing == player.direction and
        CheckCollision(
            layer.hero.position.x,
            layer.hero.position.y,
            layer.hero.width,
            layer.hero.height,
            signObj.x,
            signObj.y,
            signObj.width,
            signObj.height
        )
end
function canispeaktothenpc(npc)
    return action and not Moan.showingMessage and
        CheckCollision(
            layer.hero.position.x,
            layer.hero.position.y,
            layer.hero.width,
            layer.hero.height,
            npc.x,
            npc.y,
            npc.width,
            npc.height
        )
end

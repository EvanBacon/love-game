require "controls"
require "libs.boundingball"

local love = _G.love

local newAnimation = require "src.newAnimation"

local tx
local ty
local scale
function drawMap()
    if not map then
        return
    end
    map:draw(-tx, -ty, scale)
    Mapdraw()
end

function loadMap(currentMap)
    love.filesystem.load(currentMap)()
    love.filesystem.load("src/npcGenerator.lua")
    --update mapa
    newMapa = currentMap
    mapa = currentMap

    --create map
    map = sti((path), {"box2d"})

    layernpc = map.layers["npc"]

    layer = map:addCustomLayer("sprites", 6)
    --escala
    if love.graphics.getHeight() >= 1080 then
        scale = 4
    elseif love.graphics.getHeight() >= 720 then
        scale = 3
    else
        scale = 2
    end

    --load map and boxes
    Mapload()
    map:box2d_init(game.world)

    screen_width = love.graphics.getWidth() / scale
    screen_height = love.graphics.getHeight() / scale

    --hero
    if herofacing == nil then
        herofacing = "down"
    end
    xt, yt = 0, 0

    playerSpawnObject = getObj(playerSpawnObject)

    --heroes images
    local player =
        Sprite {
        width = 14,
        height = 21,
        position = Vector(playerSpawnObject.x, playerSpawnObject.y)
    }
    player.debug = true

    player:addAnimation(
        SpriteAnimation {
            spriteSheet = love.graphics.newImage("assets/gfx/characters/character1.png"),
            width = 14,
            height = 21
        },
        "side"
    )
    player:addAnimation(
        SpriteAnimation {
            spriteSheet = love.graphics.newImage("assets/gfx/characters/character2.png"),
            width = 14,
            height = 21
        },
        "top"
    )
    player:addAnimation(
        SpriteAnimation {
            spriteSheet = love.graphics.newImage("assets/gfx/characters/character3.png"),
            width = 14 + 1,
            height = 21
        },
        "bottom"
    )
    player.currentAnimation = "top"

    game.scene:addChild(player)
    --physics
    player:enablePhysics("dynamic")
    player.body:setLinearDamping(12)
    player.body:setFixedRotation(true)

    layer.hero = player

    --when changing map, we can move by default
    allowMove = true
    doMusicStuff()
    doGameDayCycleStuff()
end

function doMusicStuff()
    --override layer:draw
    love.filesystem.load("src/playerlayerdraw.lua")()

    --create musicplayer
    --comprobamos si se carga nueva musica
    if music == mapmusic then
        music = mapmusic
    else
        -- musicplayer= love.audio.newSource(music)
        -- musicplayer:setLooping(true)
        -- musicplayer:setVolume(0.5)
        -- musicplayer:play()
        music = mapmusic
        if (musicplayer ~= nil) then
            musicplayer:stop()
        end
    end
end

function doGameDayCycleStuff()
    --DAYNIGHT SYSTEM
    time = os.date("*t")
    if time.hour > 19 or time.hour < 6 then
        if map.layers["shadow"] ~= nil and map.layers["light1"] ~= nil then
            map.layers["shadow"].visible = true
            map.layers["light1"].visible = true
            if map.layers["light2"] ~= nil then
                map.layers["light2"].visible = true
            end
        end
    end
end

function updateMap(delta)
    if not Mapupdate then
        return
    end
    Mapupdate(delta)
    game.world:update(delta)

    if love.keyboard.isDown("x") then
        speed = 15000
    else
        speed = 7500
    end
    speed = speed * delta

    local x, y = controls(0, 0, speed, delta)
    layer.hero.body:applyForce(x, y)

    tx = math.floor(layer.hero.position.x - screen_width / 2)
    ty = math.floor(layer.hero.position.y - screen_height / 2)

    map:update(delta)

    if (newMapa ~= mapa) then
        loadMap(newMapa)
    end
end

function drawObjects(npcs)
    function layernpc:draw()
        for k, nombre in pairs(npcs) do
            drawObject(nombre)
        end
    end
end

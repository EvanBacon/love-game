require "controls"
require "libs.boundingball"
local generateNPC = require("src.npcGenerator")

local newAnimation = require "src.newAnimation"

function drawMap()
    if not map then
        return
    end
    map:draw(-tx, -ty, scale)
    Mapdraw()
end

function loadMap(mapafile)
    love.filesystem.load(mapafile)()
    love.filesystem.load("src/npcGenerator.lua")
    --update mapa
    newMapa = mapafile
    mapa = mapafile

    --create map
    map = sti((path), {"box2d"})
    world = love.physics.newWorld(0, 0)

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
    map:box2d_init(world)

    screen_width = love.graphics.getWidth() / scale
    screen_height = love.graphics.getHeight() / scale

    --hero
    fastmove = 0.4
    if herofacing == nil then
        herofacing = "down"
    end
    xt, yt = 0, 0

    --heroes images
    heroImage = love.graphics.newImage("assets/gfx/characters/character1.png")
    heroImageTop = love.graphics.newImage("assets/gfx/characters/character2.png")
    heroImageBot = love.graphics.newImage("assets/gfx/characters/character3.png")
    herodx = 14
    herody = 21
    heroAnimation = newAnimation(heroImage, herodx, herody, 1)
    heroTopAnimation = newAnimation(heroImageTop, herodx, herody, 1)
    heroBotAnimation = newAnimation(heroImageBot, herodx + 1, herody, 1)
    heroAnimationRun = newAnimation(heroImage, herodx, herody, fastmove)
    heroTopAnimationRun = newAnimation(heroImageTop, herodx, herody, fastmove)
    heroBotAnimationRun = newAnimation(heroImageBot, herodx + 1, herody, fastmove)

    --spawn
    playerspawn = getObj(playerspawn)

    --hero position definition
    layer.hero = {
        x = playerspawn.x,
        y = playerspawn.y,
        moving = false,
        escala = 1,
        offset = 0
    }
    player = layer.hero --alias
    --physics
    tx = math.floor(layer.hero.x - screen_width / 2)
    ty = math.floor(layer.hero.y - screen_height / 2)
    layer.hero.body = love.physics.newBody(world, layer.hero.x + 6, layer.hero.y + 15, "dynamic")
    layer.hero.body:setLinearDamping(12)
    layer.hero.body:setFixedRotation(true)
    layer.hero.shape = love.physics.newRectangleShape(13, 13)
    layer.hero.fixture = love.physics.newFixture(layer.hero.body, layer.hero.shape)

    --when changing map, we can move by default
    allowMove = true
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
    world:update(delta)

    --defining sprite's position of the player
    local sprite = map.layers["sprites"].hero

    --running in the 90s
    if love.keyboard.isDown("x") then
        speed = 15000
    else
        speed = 7500
    end
    speed = speed * delta
    x, y = 0, 0
    --player movement
    heroAnimation.currentTime = heroAnimation.currentTime + delta
    if heroAnimation.currentTime >= heroAnimation.duration then
        heroAnimation.currentTime = heroAnimation.currentTime - heroAnimation.duration
    end
    heroAnimationRun.currentTime = heroAnimationRun.currentTime + delta
    if heroAnimationRun.currentTime >= heroAnimationRun.duration then
        heroAnimationRun.currentTime = heroAnimationRun.currentTime - heroAnimationRun.duration
    end

    --movement applying forces
    x, y = controls(x, y, speed, delta)
    layer.hero.body:applyForce(x, y)

    --fixing player position
    sprite.x, sprite.y = sprite.body:getPosition()
    sprite.x = sprite.x - 6
    sprite.y = sprite.y - 14

    --update shiftment
    tx = math.floor(layer.hero.x - screen_width / 2)
    ty = math.floor(layer.hero.y - screen_height / 2)

    --map update
    map:update(delta)

    --comprobacion si hay nuevo mapa cargado
    if (newMapa ~= mapa) then
        loadMap(newMapa)
    end
end

function drawnpcs(npcs)
    function layernpc:draw()
        for k, nombre in pairs(npcs) do
            drawNPC(nombre)
        end
    end
end

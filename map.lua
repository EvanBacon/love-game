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
    player = Sprite()
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

    gameContainer:addChild(player)
    --spawn
    playerspawn = getObj(playerspawn)

    player.debug = true

    player.moving = false
    player.position.x = playerspawn.x
    player.position.y = playerspawn.y
    player.width = 14
    player.height = 21

    --hero position definition
    layer.hero = player
    --physics
    tx = math.floor(layer.hero.position.x - screen_width / 2)
    ty = math.floor(layer.hero.position.y - screen_height / 2)
    layer.hero.body = love.physics.newBody(world, layer.hero.position.x + 6, layer.hero.position.y + 15, "dynamic")
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

    x, y = controls(x, y, speed, delta)
    layer.hero.body:applyForce(x, y)

    sprite.x, sprite.y = sprite.body:getPosition()
    -- sprite.x = sprite.x - 6
    -- sprite.y = sprite.y - 14

    tx = math.floor(layer.hero.x - screen_width / 2)
    ty = math.floor(layer.hero.y - screen_height / 2)

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

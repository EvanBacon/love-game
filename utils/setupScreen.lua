local push = require "libs/push"

function setupScreen()
    local windowWidth, windowHeight = love.window.getDesktopDimensions()
    windowHeight = windowHeight * 0.9
    windowWidth = windowWidth * 0.9
    --make the window a bit smaller than the screen itself

    local gameWidth = windowWidth * 0.9
    local gameHeight = windowHeight * 0.9

    print("setupScreen")
    push:setupScreen(gameWidth, gameHeight, windowWidth, windowHeight, {fullscreen = false})

    love.graphics.setDefaultFilter("nearest", "nearest")
end

return setupScreen

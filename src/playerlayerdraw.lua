function layer:draw()
    local x = math.floor(self.hero.x)
    local y = math.floor(self.hero.y)
    local spriteNumRun =
        math.floor(heroAnimationRun.currentTime / heroAnimationRun.duration * #heroAnimationRun.quads) + 1
    local spriteNum = math.floor(heroAnimation.currentTime / heroAnimation.duration * #heroAnimation.quads) + 1
    --sprite logic
    if herofacing == "left" or herofacing == "right" then
        if layer.hero.moving then
            if love.keyboard.isDown("x") or tactil then
                love.graphics.draw(
                    heroAnimationRun.spriteSheet,
                    heroAnimationRun.quads[spriteNumRun],
                    layer.hero.x,
                    layer.hero.y,
                    0,
                    self.hero.escala,
                    1,
                    self.hero.offset,
                    0
                )
            else
                love.graphics.draw(
                    heroAnimation.spriteSheet,
                    heroAnimation.quads[spriteNum],
                    layer.hero.x,
                    layer.hero.y,
                    0,
                    self.hero.escala,
                    1,
                    self.hero.offset,
                    0
                )
            end
        else
            love.graphics.draw(
                heroAnimation.spriteSheet,
                heroAnimation.quads[1],
                layer.hero.x,
                layer.hero.y,
                0,
                self.hero.escala,
                1,
                self.hero.offset
            )
        end
    else
        if layer.hero.moving then
            if herofacing == "top" then
                if love.keyboard.isDown("x") or tactil then
                    love.graphics.draw(
                        heroTopAnimationRun.spriteSheet,
                        heroTopAnimationRun.quads[spriteNumRun],
                        layer.hero.x,
                        layer.hero.y,
                        0,
                        self.hero.escala,
                        1,
                        self.hero.offset,
                        0
                    )
                else
                    love.graphics.draw(
                        heroTopAnimation.spriteSheet,
                        heroTopAnimation.quads[spriteNum],
                        layer.hero.x,
                        layer.hero.y,
                        0,
                        self.hero.escala,
                        1,
                        self.hero.offset,
                        0
                    )
                end
            else
                if love.keyboard.isDown("x") or tactil then
                    love.graphics.draw(
                        heroBotAnimationRun.spriteSheet,
                        heroBotAnimationRun.quads[spriteNumRun],
                        layer.hero.x,
                        layer.hero.y,
                        0,
                        self.hero.escala,
                        1,
                        self.hero.offset,
                        0
                    )
                else
                    love.graphics.draw(
                        heroBotAnimation.spriteSheet,
                        heroBotAnimation.quads[spriteNum],
                        layer.hero.x,
                        layer.hero.y,
                        0,
                        self.hero.escala,
                        1,
                        self.hero.offset,
                        0
                    )
                end
            end
        else
            if herofacing == "top" then
                love.graphics.draw(
                    heroTopAnimation.spriteSheet,
                    heroTopAnimation.quads[1],
                    layer.hero.x,
                    layer.hero.y,
                    0,
                    self.hero.escala,
                    1,
                    self.hero.offset
                )
            else
                love.graphics.draw(
                    heroBotAnimation.spriteSheet,
                    heroTopAnimation.quads[1],
                    layer.hero.x,
                    layer.hero.y,
                    0,
                    self.hero.escala,
                    1,
                    self.hero.offset,
                    0
                )
            end
        end
    end
end

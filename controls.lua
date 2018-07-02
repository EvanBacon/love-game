function controls(x, y, speed, delta)
    if allowMove == true then
        if not tactil then
            if love.keyboard.isDown("right") then
                layer.hero.moving = true
                layer.hero.escala = 1
                layer.hero.offset = 0
                x = x + speed
            elseif love.keyboard.isDown("left") then
                x = x - speed
                layer.hero.moving = true
                layer.hero.escala = -1
                layer.hero.offset = 12
            end
            if love.keyboard.isDown("down") then
                layer.hero.moving = true
                y = y + speed
            elseif love.keyboard.isDown("up") then
                layer.hero.moving = true
                y = y - speed
            end
            if x == 0 then
                if y > 0 then
                    herofacing = "down"
                elseif y < 0 then
                    herofacing = "top"
                end
            else
                if x > 0 then
                    herofacing = "right"
                elseif x < 0 then
                    herofacing = "left"
                end
            end
        else
            x = (xt - love.graphics.getWidth() / 2)
            y = (yt - love.graphics.getHeight() / 2)
            layer.hero.moving = true
            if x < 0 then
                layer.hero.escala = -1
                layer.hero.offset = 12
            else
                layer.hero.escala = 1
                layer.hero.offset = 0
            end
            if math.abs(x) < 50 then
                if y > 0 then
                    herofacing = "down"
                elseif y < 0 then
                    herofacing = "top"
                end
            else
                if x > 0 then
                    herofacing = "right"
                elseif x < 0 then
                    herofacing = "left"
                end
            end
            if (x > 200) then
                x = 200
            end
            if (x < -200) then
                x = -200
            end
            if (y > 200) then
                y = 200
            end
            if (y < -200) then
                y = -200
            end
        end
    else
        x, y = 0, 0
    end
    if x == 0 and y == 0 then
        layer.hero.moving = false
    end
    return x, y
end

function love.touchmoved(id, xtf, ytf)
    xt = xtf
    yt = ytf
    tactil = true
end
function love.touchreleased()
    xt = 0
    yt = 0
    tactil = false
end

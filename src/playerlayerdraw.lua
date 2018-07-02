function layer:draw()
    local x = math.floor(self.hero.x)
    local y = math.floor(self.hero.y)
    if herofacing == "left" or herofacing == "right" then
        layer.hero.currentAnimation = "side"
    else
        if layer.hero.moving then
            if herofacing == "top" then
                layer.hero.currentAnimation = "top"
            else
                layer.hero.currentAnimation = "bottom"
            end
        end
    end
end

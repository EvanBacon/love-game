function layer:draw()
    if herofacing == "left" or herofacing == "right" then
        layer.hero.currentAnimation = "side"
    elseif herofacing == "top" then
        layer.hero.currentAnimation = "top"
    else
        layer.hero.currentAnimation = "bottom"
    end
end

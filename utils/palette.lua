local palettes = {
    player = {

    }
}

Palette = {
    setColors = function(player)
        local pal = player.palette
        function remapColors (x, y, r, g, b, a)
        
        end

        player.img:mapPixel(remapColors)
    end
}

return Palette
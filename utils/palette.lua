local palettes = {
    P_DEFAULT = {
        {0.2, 0.5, 0.2},
        {},
        {},
        {},
        {}
    }
}

local Palette = {
    setPal = function(self, object, palName)
        self.currentPal = palName
        object.img:mapPixel(self.mapColors)
    end,
    mapColors = function(x,y,r,g,b,a,o)
        if r == 1 and b == 1 then
            a = 0
        elseif r == 0 then
            r, g, b = unpack(palettes[self.currentPal][1])
        end
    
        return r, g, b, a
    end
}

return Palette
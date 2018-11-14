local thresholds = {
    {-.1, .1},
    {.1, .3},
    {.3, .5},
    {.5, .7},
    {.7, .9},
    {.9, 1.1}
}

local pals = {
    P_DEFAULT = {
        {0, 46, 85},
        {153, 150, 0},
        {240, 128, 106},
        {255, 212, 203},
        {142, 137, 255},
        {255, 255, 255}
    }
}

Palette = {
    mapColors = function(x,y,r,g,b,a)
        if r == 1 and g == 0 and b == 1 then
            a = 0
        end

        for i = 1, #thresholds do
            if g > thresholds[i][1] and g < thresholds[i][2] then
                r = pals[Palette.curPal][i][1] / 255
                g = pals[Palette.curPal][i][2] / 255
                b = pals[Palette.curPal][i][3] / 255
                break
            end
        end
        
        return r,g,b,a
    end,
    setPal = function(self, object, palName)
        self.curPal = palName
        object.img:mapPixel(self.mapColors)
    end
}

return Palette
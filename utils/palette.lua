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
        {1, 0, 0},
        {1, 1, 0},
        {1, 1, 1},
        {0, 1, 1},
        {0, 0, 1},
        {0, 0, 0}
    }
}

Palette = {
    mapColors = function(x,y,r,g,b,a)
        if r == 1 and g == 0 and b == 1 then
            return 0, 0, 0, 0
        end
print(g)
        if g > thresholds[1][1] and g < thresholds[1][2] then
            r, g, b = unpack(pals[Palette.curPal][1])
            return r,g,b,a
        elseif g > thresholds[2][1] and g < thresholds[2][2] then
            r, g, b = unpack(pals[Palette.curPal][2])
            return r,g,b,a
        elseif g > thresholds[3][1] and g < thresholds[3][2] then
            r, g, b = unpack(pals[Palette.curPal][3])
            return r,g,b,a
        elseif g > thresholds[4][1] and g < thresholds[4][2] then
            r, g, b = unpack(pals[Palette.curPal][4])
            return r,g,b,a
        elseif g > thresholds[5][1] and g < thresholds[5][2] then
            r, g, b = unpack(pals[Palette.curPal][5])
            return r,g,b,a
        elseif g > thresholds[6][1] and g < thresholds[6][2] then
            r, g, b = unpack(pals[Palette.curPal][6])
            return r,g,b,a
        end

        return r,g,b,a
    end,
    setPal = function(self, object, palName)
        self.curPal = palName
        object.img:mapPixel(self.mapColors)
    end
}

return Palette
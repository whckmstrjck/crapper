local P = {}
local palRepo = require 'utils.palettes'

local mapColors = function(x,y,r,g,b,a)
    if
    r == palRepo.VALUES[1][1]/255 and 
    g == palRepo.VALUES[1][2]/255 and
    b == palRepo.VALUES[1][3]/255 then
        a = 0
        do return r,g,b,a end
    end

    for i = 2, #palRepo.VALUES do
        if g == palRepo.VALUES[i]/255 then
            r = palRepo.MASTER[palRepo[P.curObj][P.curPal][i]][1]/255
            g = palRepo.MASTER[palRepo[P.curObj][P.curPal][i]][2]/255
            b = palRepo.MASTER[palRepo[P.curObj][P.curPal][i]][3]/255
            break
        end
    end
    
    return r,g,b,a
end


function P.processPal(self, object)
    P.curObj = object.id
    P.curPal = object.pal

    object.img:mapPixel(mapColors)
end

return P
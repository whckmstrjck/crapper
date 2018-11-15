local PR = {}
PR.VALUES = {{255,0,255},0,64,128,192,255}
PR.MASTER = {
    SPACE = {31,24,51},
    MOUNTN = {43,46,66},
    BOULDR = {65,72,89},
    ROCK = {104,113,122},
    STONE = {144,161,168},
    PEBBLE = {182,203,207},
    IVORY = {255,255,255},
    SAND = {252,191,138},
    SOIL = {181,128,87},
    DIRT = {138,80,62},
    MUD = {92,58,65},
    CRIMSN = {201,48,56},
    ORANGE = {222,106,56},
    LION = {255,173,59},
    SUN = {255,229,150},
    LEMON = {252,249,96},
    PEA = {180,214,69},
    GREEN = {81,196,63},
    AQUA = {48,156,99},
    LAKE = {35,109,122},
    SEA = {38,79,110},
    OCEAN = {35,54,99},
    RAIN = {65,114,145},
    FOG = {76,147,173},
    SKY = {99,194,201},
    MIST = {148,210,212},
    CLOUD = {184,253,255},
    GRAPE = {60,41,64},
    POISON = {70,39,92},
    PALE = {130,100,129},
    PEACH = {247,164,139},
    ROSE = {194,113,130},
    PLUM = {133,45,102}
}

PR.PLAYER = {
    DEFAULT = {nil, 'SPACE', 'AQUA', 'SUN', 'PEA', 'PEACH'},
    CRAPPY = {nil, 'RAIN', 'LEMON', 'IVORY', 'SEA', 'BOULDR'},
    BUNGY = {nil, 'OCEAN', 'PEBBLE', 'GREEN', 'CRIMSN', 'ORANGE'}
}

return PR
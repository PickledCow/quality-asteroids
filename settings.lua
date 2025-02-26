-- settings.lua

data:extend({
    {
        type = "double-setting",
        name = "quality-asteroids-default-quality",
        setting_type = "startup",
        default_value = 0.25,
        minimum_value = 0,
        maximum_value = 1,
        order = "a"
    },
    {
        type = "bool-setting",
        name = "quality-asteroids-per-planet-quality",
        setting_type = "startup",
        default_value = true,
        order = "b"
    },
    {
        type = "double-setting",
        name = "quality-asteroids-nauvis-quality",
        setting_type = "startup",
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1,
        order = "ca"
    },
    {
        type = "double-setting",
        name = "quality-asteroids-vulcanus-quality",
        setting_type = "startup",
        default_value = 0.25,
        minimum_value = 0,
        maximum_value = 1,
        order = "cb"
    },
    {
        type = "double-setting",
        name = "quality-asteroids-gleba-quality",
        setting_type = "startup",
        default_value = 0.3,
        minimum_value = 0,
        maximum_value = 1,
        order = "cc"
    },
    {
        type = "double-setting",
        name = "quality-asteroids-fulgora-quality",
        setting_type = "startup",
        default_value = 0.4,
        minimum_value = 0,
        maximum_value = 1,
        order = "cd"
    },
    {
        type = "double-setting",
        name = "quality-asteroids-aquilo-quality",
        setting_type = "startup",
        default_value = 0.6,
        minimum_value = 0,
        maximum_value = 1,
        order = "ce"
    },
    {
        type = "double-setting",
        name = "quality-asteroids-solar-system-edge-quality",
        setting_type = "startup",
        default_value = 0.8,
        minimum_value = 0,
        maximum_value = 1,
        order = "cf"
    },
    {
        type = "double-setting",
        name = "quality-asteroids-shattered-planet-quality",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        order = "cg"
    }
})

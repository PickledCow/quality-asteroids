-- settings.lua

-- Base settings
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
        order = "ab"
    },
    {
        type = "bool-setting",
        name = "quality-asteroids-use-modded-quality",
        setting_type = "startup",
        default_value = false,
        order = "ac"
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
        default_value = 0.35,
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
        order = "ea"
    },
    {
        type = "double-setting",
        name = "quality-asteroids-shattered-planet-quality",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0,
        maximum_value = 1,
        order = "eb"
    }
})

-- Modded locations

--- Moons share the same default settings as their planet and are listed alongside them
--- 
---- Nauvis moons
if mods["planet-muluna"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-muluna-quality",
            setting_type = "startup",
            default_value = 0,
            minimum_value = 0,
            maximum_value = 1,
            order = "caa"
        }
    })
end

if mods["lignumis"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-lignumis-quality",
            setting_type = "startup",
            default_value = 0,
            minimum_value = 0,
            maximum_value = 1,
            order = "cab"
        }
    })
end

---- Vulcanus moons (none I could find)

---- Gleba moons
if mods["terrapalus"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-terrapalus-quality",
            setting_type = "startup",
            default_value = 0.3,
            minimum_value = 0,
            maximum_value = 1,
            order = "cca"
        }
    })
end

---- Fulgora moons
if mods["Cerys-Moon-of-Fulgora"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-cerys-quality",
            setting_type = "startup",
            default_value = 0.35,
            minimum_value = 0,
            maximum_value = 1,
            order = "cda"
        }
    })
end

---- Aquilo moons (none I could find)


---- Shattered Planet mod values are made to use the same value as the vanilla one
if mods["skewer_shattered_planet"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-skewer_shattered_planet-quality",
            setting_type = "startup",
            default_value = 1,
            minimum_value = 0,
            maximum_value = 1,
            order = "eba"
        },
        {
            type = "double-setting",
            name = "quality-asteroids-skewer_lost_beyond-quality",
            setting_type = "startup",
            default_value = 1,
            minimum_value = 0,
            maximum_value = 1,
            order = "ebaa"
        }
    })
end

--- Other popular planet mods
--- Planets that don't have any special prerequisites have 0.3 to match Vulcanus
--- Planets with one Space Age prerequisites have 0.4 to be higher than all inner planets
--- Other stuff I pulled out of my ass

if mods["maraxsis"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-maraxsis-quality",
            setting_type = "startup",
            default_value = 0.7,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-maraxsis"
        }
    })
end

if mods["Moshine"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-moshine-quality",
            setting_type = "startup",
            default_value = 0.4,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-moshine"
        }
    })
end

if mods["Igrys"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-igrys-quality",
            setting_type = "startup",
            default_value = 0.4,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-igrys"
        }
    })
end

if mods["rubia"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-rubia-quality",
            setting_type = "startup",
            default_value = 0.3,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-rubia"
        }
    })
end

if mods["castra"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-castra-quality",
            setting_type = "startup",
            default_value = 0.3,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-castra"
        }
    })
end

if mods["planetaris-arig"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-arig-quality",
            setting_type = "startup",
            default_value = 0.4,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-arig"
        }
    })
end

if mods["pelagos"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-pelagos-quality",
            setting_type = "startup",
            default_value = 0.4,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-pelagos"
        }
    })
end

if mods["planet-arrakis"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-arrakis-quality",
            setting_type = "startup",
            default_value = 0.6,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-arrakis"
        }
    })
end

if mods["planetaris-hyarion"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-hyarion-quality",
            setting_type = "startup",
            default_value = 0.6,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-hyarion"
        }
    })
end

if mods["skewer_planet_vesta"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-vesta-quality",
            setting_type = "startup",
            default_value = 0.8,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-vesta"
        }
    })
end

if mods["secretas"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-secretas-quality",
            setting_type = "startup",
            default_value = 0.85,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-secretas"
        },
        {
            type = "double-setting",
            name = "quality-asteroids-frozeta-quality",
            setting_type = "startup",
            default_value = 0.85,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-secretas-frozeta"
        }
    })
end

if mods["Paracelsin"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-paracelsin-quality",
            setting_type = "startup",
            default_value = 0.7,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-paracelsin"
        }
    })
end

if mods["tenebris-prime"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-tenebris-quality",
            setting_type = "startup",
            default_value = 0.8,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-tenebris"
        }
    })
end

if mods["corrundum"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-corrundum-quality",
            setting_type = "startup",
            default_value = 0.3,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-tenebris"
        }
    })
end

if mods["janus"] then 
    data:extend({
        {
            type = "double-setting",
            name = "quality-asteroids-janus-quality",
            setting_type = "startup",
            default_value = 0,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-janus"
        }
    })
end

--- Dea Dia has a bunch of stuff
if mods["dea-dia-system"] then 
    data:extend({ 
        {
            type = "double-setting",
            name = "quality-asteroids-dea-dia-system-edge-quality",
            setting_type = "startup",
            default_value = 0.7,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-dea-dia-system-edge"
        },
        {
            type = "double-setting",
            name = "quality-asteroids-prosephina-quality",
            setting_type = "startup",
            default_value = 0.725,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-dea-dia-system-edge-aa"
        },
        {
            type = "double-setting",
            name = "quality-asteroids-lemures-quality",
            setting_type = "startup",
            default_value = 0.725,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-dea-dia-system-edge-ab"
        },
        {
            type = "double-setting",
            name = "quality-asteroids-planet-dea-dia-quality",
            setting_type = "startup",
            default_value = 0.75,
            minimum_value = 0,
            maximum_value = 1,
            order = "d-dea-dia-system-edge-az"
        }
    })
end
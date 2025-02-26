-- entities.lua

-- These deepcopies are a bit ineffecient but it only runs once during load so idc

-- Double the size of the quality indicator, default 0.5
for _, value in pairs(data.raw["asteroid"]) do
    value.quality_indicator_scale = 1
end


-- Create dummy entities that call scripts 
for _, value in pairs(table.deepcopy(data.raw["asteroid"])) do
    local asteroid = {
        name = "quality-asteroids-"..value.name.."-dummy",
        type = "asteroid",
        hidden = true,
        hidden_in_factoriopedia = true,
        created_effect = {
            type = "direct",
            action_delivery = {
                type = "instant",
                target_effects = {
                    type = "script",
                    effect_id = value.name.."-trigger"
                }
            }
        }
    }
    data:extend({asteroid})
end

-- Iterate over space locations to add quality dummies

for i, _ in pairs(table.deepcopy(data.raw["space-location"])) do
    if data.raw["space-location"][i].asteroid_spawn_definitions ~= nil then
        local location = table.deepcopy(data.raw["space-location"][i])
        data.raw["space-location"][i] = nil
        local spawns = #location.asteroid_spawn_definitions
        local j2 = 1 -- Extend index for skipping over asteroid chunks

        local quality_factor = settings.startup["quality-asteroids-default-quality"].value

        if settings.startup["quality-asteroids-per-planet-quality"].value then
            if settings.startup["quality-asteroids-"..location.name.."-quality"] ~= nil then
                quality_factor = settings.startup["quality-asteroids-"..location.name.."-quality"].value
            end
        end

        for j = 1,spawns,1 do
            if location.asteroid_spawn_definitions[j].type ~= "asteroid-chunk" then
                -- Copy data over
                location.asteroid_spawn_definitions[spawns + j2] = location.asteroid_spawn_definitions[j]
                -- Change spawn to be the dummy instead
                location.asteroid_spawn_definitions[spawns + j2].asteroid = "quality-asteroids-"..location.asteroid_spawn_definitions[j].asteroid.."-dummy"
                -- Set probability of new asteroid
                location.asteroid_spawn_definitions[spawns + j2].probability = location.asteroid_spawn_definitions[j].probability * quality_factor
                -- Lower original asteroid probability to compensate for new clone
                location.asteroid_spawn_definitions[j].probability = location.asteroid_spawn_definitions[j].probability * (1.0 - quality_factor)
                j2 = j2 + 1
            end
        end
        data:extend({location})
    end
end

-- Interate over planets
for i, _ in pairs(table.deepcopy(data.raw["planet"])) do
    if data.raw["planet"][i].asteroid_spawn_definitions ~= nil then
        local location = table.deepcopy(data.raw["planet"][i])
        data.raw["planet"][i] = nil
        local spawns = #location.asteroid_spawn_definitions
        local j2 = 1 -- Extend index for skipping over asteroid chunks

        local quality_factor = settings.startup["quality-asteroids-default-quality"].value

        if settings.startup["quality-asteroids-per-planet-quality"].value then
            if settings.startup["quality-asteroids-"..location.name.."-quality"] ~= nil then
                quality_factor = settings.startup["quality-asteroids-"..location.name.."-quality"].value
            end
        end

        for j = 1,spawns,1 do
            if location.asteroid_spawn_definitions[j].type ~= "asteroid-chunk" or location.asteroid_spawn_definitions[j].type == nil then
                -- Copy data over
                location.asteroid_spawn_definitions[spawns + j2] = location.asteroid_spawn_definitions[j]
                -- Change spawn to be the dummy instead
                location.asteroid_spawn_definitions[spawns + j2].asteroid = "quality-asteroids-"..location.asteroid_spawn_definitions[j].asteroid.."-dummy"
                location.asteroid_spawn_definitions[spawns + j2].type = "entity"
                -- Set probability of new asteroid
                location.asteroid_spawn_definitions[spawns + j2].probability = location.asteroid_spawn_definitions[j].probability * quality_factor
                -- Lower original asteroid probability to compensate for new clone
                location.asteroid_spawn_definitions[j].probability = location.asteroid_spawn_definitions[j].probability * (1.0 - quality_factor)
                j2 = j2 + 1
            end
        end
        data:extend({location})
    end
end


-- Iterate over space connections to add quality dummies

for i, _ in pairs(table.deepcopy(data.raw["space-connection"])) do
    if data.raw["space-connection"][i].asteroid_spawn_definitions ~= nil then
        local connection = table.deepcopy(data.raw["space-connection"][i])
        data.raw["space-connection"][i] = nil
        local spawns = #connection.asteroid_spawn_definitions
        local j2 = 1 -- Extend index for skipping over asteroid chunks

        local from_quality_factor = settings.startup["quality-asteroids-default-quality"].value
        local to_quality_factor = settings.startup["quality-asteroids-default-quality"].value

        if settings.startup["quality-asteroids-per-planet-quality"].value then
            if settings.startup["quality-asteroids-"..connection.from.."-quality"] ~= nil then
                from_quality_factor = settings.startup["quality-asteroids-"..connection.from.."-quality"].value
            end
            if settings.startup["quality-asteroids-"..connection.to.."-quality"] ~= nil then
                to_quality_factor = settings.startup["quality-asteroids-"..connection.from.."-quality"].value
            end
        end

        for j = 1,spawns,1 do
            if connection.asteroid_spawn_definitions[j].type ~= "asteroid-chunk" then
                -- Copy data over
                connection.asteroid_spawn_definitions[spawns + j2] = table.deepcopy(connection.asteroid_spawn_definitions[j])
                -- Change spawn to be the dummy instead 
                connection.asteroid_spawn_definitions[spawns + j2].asteroid = "quality-asteroids-"..connection.asteroid_spawn_definitions[j].asteroid.."-dummy"
                connection.asteroid_spawn_definitions[spawns + j2].type = "entity"
                -- Change probabilities
                local spawn_points = connection.asteroid_spawn_definitions[spawns + j2].spawn_points
                for k = 1,#spawn_points,1 do
                    local quality_factor = to_quality_factor * connection.asteroid_spawn_definitions[j].spawn_points[k].distance + from_quality_factor * (1 - connection.asteroid_spawn_definitions[j].spawn_points[k].distance)
                    connection.asteroid_spawn_definitions[spawns + j2].spawn_points[k].probability = connection.asteroid_spawn_definitions[j].spawn_points[k].probability * quality_factor
                end
                -- Lower original asteroid probability to compensate for new clone
                for k = 1,#spawn_points,1 do
                    local quality_factor = to_quality_factor * connection.asteroid_spawn_definitions[j].spawn_points[k].distance + from_quality_factor * (1 - connection.asteroid_spawn_definitions[j].spawn_points[k].distance)
                    connection.asteroid_spawn_definitions[j].spawn_points[k].probability = connection.asteroid_spawn_definitions[j].spawn_points[k].probability * (1.0 - quality_factor)
                end
                j2 = j2 + 1
            end
        end
        data:extend({connection})
    end
end


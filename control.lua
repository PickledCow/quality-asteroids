
local asteroids = prototypes.get_entity_filtered({{ filter = "type", type = "asteroid" }})
local qualities = { "uncommon", "rare", "epic", "legendary" }

function create_asteroid(event)
    for i, _ in pairs(asteroids) do
        if event.effect_id == asteroids[i].name.."-trigger" then
            local asteroid = event.source_entity

            local quality_factor = settings.startup["quality-asteroids-default-quality"].value
            local platform = asteroid.surface.platform

            if platform.space_location ~= nil then
                if settings.startup["quality-asteroids-"..platform.space_location.name.."-quality"] ~= nil then
                    quality_factor = settings.startup["quality-asteroids-"..platform.space_location.name.."-quality"].value
                end
            else
                local smooth_quality_enabled = false
                local last_visited_available = false
                for name, version in pairs(script.active_mods) do
                    if name == "base" then
                        local _, minor, patch = version:match("(%d+)%.(%d+)%.(%d+)")
                        -- Convert to numbers
                        minor, patch = tonumber(minor), tonumber(patch)

                        if minor > 0 or patch >= 25 then
                            last_visited_available = true
                        end
                        if minor > 0 or patch >= 34 then
                            smooth_quality_enabled = true
                        end
                        break
                    end
                end

                if smooth_quality_enabled and platform.space_connection ~= nil then
                    local from = platform.space_connection.from
                    local to = platform.space_connection.to
                    if from ~= nil and to ~= nil then
                        if settings.startup["quality-asteroids-"..from.name.."-quality"] ~= nil and settings.startup["quality-asteroids-"..to.name.."-quality"] ~= nil then
                            local from_quality_factor = settings.startup["quality-asteroids-"..from.name.."-quality"].value
                            local to_quality_factor = settings.startup["quality-asteroids-"..to.name.."-quality"].value
                            quality_factor = to_quality_factor * platform.distance + from_quality_factor * (1 - platform.distance)
                        end
                    end
                elseif smooth_quality_enabled == false and last_visited_available == true then
                    if settings.startup["quality-asteroids-"..platform.last_visited_space_location .name.."-quality"] ~= nil then
                        quality_factor = settings.startup["quality-asteroids-"..platform.last_visited_space_location .name.."-quality"].value
                    end
                end
            end

            local quality_index = 1
            while quality_index < #qualities do
                if math.random() > quality_factor ^ quality_index then break end
                quality_index = quality_index + 1
            end
            -- Create new asteroid where the old one was with updated quality
            asteroid.surface.create_entity{
                name = asteroids[i].name,
                position = asteroid.position,
                direction = asteroid.direction,
                force = asteroid.force,
                quality = qualities[quality_index]
            }
            -- Delete old asteroid
            asteroid.destroy()
            return

        end
    end

end


script.on_event(defines.events.on_script_trigger_effect, create_asteroid)
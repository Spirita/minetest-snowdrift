--- snowdrift/src/definitions.lua
-- Metada of the weather



-- Sky brightness
-- ==============

snowdrift.difsval = snowdrift.DASVAL - snowdrift.NISVAL


-- Sky particles
-- =============

-- TODO Textures functions should be replaced by a analysis of folder (or a convention like snowdrift_snowflake.X.png if it work with textures)



-- Metadata
-- ========

snowdrift.weathers_data = {}



-- It's recommended to use the same string for name_for_index and for weather_name.
function snowdrift.register_weather(weather_data, name_for_index)
	snowdrift.weathers_data[name_for_index] = weather_data
end


function snowdrift.clear_weather(name_for_index)
	snowdrift.weathers_data[name_for_index] = nil
end


--- snowdrift/src/definitions.lua
-- Metada of the weather



-- Sky brightness
-- ==============

snowdrift.difsval = snowdrift.DASVAL - snowdrift.NISVAL


-- Sky particles
-- =============


-- TODO These functions should be replaced by a analysis of folder (or a convention like snowdrift_snowflake.X.png if it work with textures)

-- Create a table with the textures to use, one texture is chosen randomly
local snowtexture_table = function ()
	local number_of_texture = 4
	local texture_table = {}
	for i = 1, number_of_texture do
		table.insert(texture_table, ("snowdrift_snowflake" .. i .. ".png"))
	end
	return texture_table
end


local raintexture_table = function ()
	return {"snowdrift_raindrop.png"}
end


local particles_data_rain = {
	base_number = snowdrift.DROPS,
	min_box = {x = -8, y = 8, z = -8},
	random_vector = {x = 16, y = 5, z = 16},
	base_velocity = {x = 0.0, y = -10.0, z = 0.0},
	base_acceleration = {x = 0, y = 0, z = 0},
	expirationtime = 2.1,
	size = 2.8,
	texture = raintexture_table()
}

local particles_data_snow = {
	base_number = snowdrift.FLAKES,
	min_box = {x = -24, y = 8, z = -20},
	random_vector = {x = 47, y = 1, z = 47},
	base_velocity = {x = 0.0, y = -2.0, z = -1.0},
	base_acceleration = {x = 0, y = 0, z = 0},
	expirationtime = 8.5,
	size = 2.8,
	texture = snowtexture_table()
}

local particles_data_clear = nil



-- Metadata
-- ========

 -- Sound volume
local RAINGAIN = 0.2
local SNOWGAIN = 0.2


snowdrift.weathers_data = {}


snowdrift.weathers_data.rain = {
	weather_name = "rain"
	particles_data = particles_data_rain
	sounds_data = {song = "snowdrift_rain", base_gain = RAINGAIN}
	skybrightness_data =
}

snowdrift.weathers_data.snow = {
	weather_name = "snow"
	particles_data = particles_data_snow
	sounds_data = {song = "cobratronik_wind_artic_cold", base_gain = SNOWGAIN}
	skybrightness_data =
}

snowdrift.weathers_data.clear = {
	weather_name = "clear"
	particles_data = particles_data_clear
	sounds_data = nil
	skybrightness_data =
}


function snowdrift.register_weather(weather_data, name_for_index)
	snowdrift.weathers_data[name_for_index] = weather_data
end


function snowdrift.clear_weather(name_for_index)
	snowdrift.weathers_data[name_for_index] = nil
end


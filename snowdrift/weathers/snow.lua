
-- Sky brightness
-- ==============


-- Sky particles
-- =============


-- Create a table with the textures to use, one texture is chosen randomly
local snowtexture_table = function ()
	local number_of_texture = 4
	local texture_table = {}
	for i = 1, number_of_texture do
		table.insert(texture_table, ("snowdrift_snowflake" .. i .. ".png"))
	end
	return texture_table
end



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


-- Metadata
-- ========

 -- Sound volume
local SNOWGAIN = 0.2


snowdrift.weathers_data.snow = {
	weather_name = "snow"
	particles_data = particles_data_snow
	sounds_data = {song = "cobratronik_wind_artic_cold", base_gain = SNOWGAIN}
	skybrightness_data =
}



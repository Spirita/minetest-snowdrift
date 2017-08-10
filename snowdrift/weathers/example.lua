--[[

-- Sky brightness
-- ==============


-- Sky particles
-- =============

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


-- Metadata
-- ========

 -- Sound volume
local RAINGAIN = 0.2


snowdrift.weathers_data.rain = {
	weather_name = "rain"
	particles_data = particles_data_rain
	sounds_data = {song = "snowdrift_rain", base_gain = RAINGAIN}
	skybrightness_data =
}

]]

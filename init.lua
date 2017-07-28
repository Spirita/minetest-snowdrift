--- snowdrift/src/init.lua
-- Main file of the mod snowdrift.
-- Include other file and launch the main loop.


-- Mod name
snowdrift = {}


-- Including other files
-- =====================


dofile(minetest.get_modpath("snowdrift").."/lib/utils.lua")
dofile(minetest.get_modpath("snowdrift").."/futuresettings.lua")
dofile(minetest.get_modpath("snowdrift").."/src/definitions.lua")

dofile(minetest.get_modpath("snowdrift").."/src/playermetada.lua")
dofile(minetest.get_modpath("snowdrift").."/src/skyparticleshandler.lua")
dofile(minetest.get_modpath("snowdrift").."/src/skybrightness.lua")
dofile(minetest.get_modpath("snowdrift").."/src/calculation.lua")
dofile(minetest.get_modpath("snowdrift").."/src/soundhandler.lua")

dofile(minetest.get_modpath("snowdrift").."/src/commands.lua")


-- Globalstep function
-- ===================


local timer = 0

minetest.register_globalstep(function(dtime)
 -- Timer
	timer = timer + dtime
	if timer < snowdrift.GSCYCLE then
		return
	end
	timer = 0
	snowdrift.main_loop_players()
	snowdrift.main_loop_others()
end)


-- Function for loop
-- =================


--- Main loop that calculate weather for the player
function snowdrift.main_loop_players()
	for _, player in ipairs(minetest.get_connected_players()) do
		local player_data = snowdrift.get_player_data(player)
		
		player_data.ppos = snowdrift.round_player_position(player)
		
		snowdrift.calcul_weather(player_data)
		snowdrift.set_particules(player_data)
		
		player_data.has_changed = false
	end
end


--- Main loop for not players
function snowdrift.main_loop_others()
	-- TODO
end



--- snowdrift/init.lua
-- Main file of the mod snowdrift.
-- Include other file and launch the main loop.


-- Mod name
snowdrift = {}


-- Including other files
-- =====================


dofile(minetest.get_modpath("snowdrift").."/lib/utils.lua")
dofile(minetest.get_modpath("snowdrift").."/futuresettings.lua")

dofile(minetest.get_modpath("snowdrift").."/src/weathermetadata.lua")
dofile(minetest.get_modpath("snowdrift").."/src/playermetada.lua")

dofile(minetest.get_modpath("snowdrift").."/src/playerloop.lua")
dofile(minetest.get_modpath("snowdrift").."/src/notplayerloop.lua")
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



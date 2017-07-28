



--- Call the initialization of metadata, set the listeners, call a first loop
-- @param player the concerned player
function snowdrift.initialize_player(player)
	-- initialization
	snowdrift.initialize_player_data(player)
	-- listener
	local player_data = snowdrift.get_player_data(player)
	snowdrift.register_on_changeweather(player_data, snowdrift.set_sound_for_particles, "snowdrift_sound_listener")
	snowdrift.register_on_changeboolquota(player_data, snowdrift.set_sound_for_particles, "snowdrift_sound_listener")
	snowdrift.register_on_changeweather(player_data, snowdrift.set_sky_brightness, "snowdrift_sky_listener")
	-- first loop
	snowdrift.main_loop_players()
end


-- Registers
-- =========


-- Initialization on joinplayer
minetest.register_on_joinplayer(snowdrift.initialize_player_data)


-- Cleanning on leaveplayer
minetest.register_on_leaveplayer(function(player)
	local player_name = player:get_player_name()
		snowdrift.stop_sound(snowdrift.players_data[player_name])
		snowdrift.players_data[player_name] = nil
	end)



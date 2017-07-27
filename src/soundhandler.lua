--- snowdrift/src/soundhandler.lua
-- File to handle sound of the weather.


-- Functions
-- =========


--- Play (or stop) the sound according the weather if it's not already played.
-- @param quota percent of particules that have been generated
-- @param has_changed if the weather have changed
-- @param weather the weather to play the according sound
-- @param player the player to play the sound
function snowdrift.set_sound_for_particles(player_data)
	local new_handle
	if (player_data.has_changed and player_data.bool_quota) then
		local sound_data = snowdrift.sounds_data[player_data.weather]
		snowdrift.stop_sound(player_data)
		if sound_data then
			new_handle = minetest.sound_play(
			sound_data.song,
			{
				to_player =  player_data.player_name,
				gain = sound_data.gain,
				loop = true,
			})
		end
	end
	if new_handle then
		player_data.sound_handle = new_handle
	end
end


--- Stop sound to the player called name.
-- @param player the player to stop the sound
function snowdrift.stop_sound(player_data)
local handle = player_data.sound_handle
	if handle then
		minetest.sound_stop(handle)
		player_data.sound_handle = nil
	end
end


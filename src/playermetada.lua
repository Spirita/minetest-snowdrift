--- snowdrift/src/playermetada.lua
-- Metadata of the player


snowdrift.players_data = {}


-- Initialization
-- ==============


--- Initialize the table of metadata for the player
-- @param player the concerned player
function snowdrift.initialize_player_data(player)
	local player_name = player:get_player_name()
		snowdrift.players_data[player_name] = {
		player = player,
		player_name = player_name,
		ppos = nil,
		weather = "clear",
		is_weather_forced = false, -- TODO new
		bool_quota = false,
		sound_handle = nil,
		has_changed = false, -- TODO must disapear with listener
		is_particles_activated = true, -- TODO new
		visual_details_level = snowdrift.VISUALDETAILSINITPLAYER, -- TODO new
		listener_weather = {},
		listener_bool_quota = {}
	}
end


snowdrift.visual_details_levels = {
 none = 0,
 very_low = 1,
 low = 2,
 normal = 3
}


-- Getter and Setter
-- =================


--- Alias to short the call.
-- @param player the player to get metadata
-- @return the metadata of the player
function snowdrift.get_player_data(player)
	return snowdrift.players_data[player:get_player_name()]
end


--- Setter of weather, trigger the listeners
-- @param player_data metadata to set
-- @param new_weather weather to set
function snowdrift.set_weather(player_data, new_weather)
	if (player_data.weather ~= new_weather) then
		player_data.has_changed = true
		for _, funct in pairs(player_data.listener_weather) do
			funct (player_data, new_weather)
		end
	end
	player_data.weather = new_weather
end


--- Setter of the boolean of the quota, trigger the listeners
-- @param player_data metadata to set
-- @param new_quota raw percent to compare at the quota to set the boolean
function snowdrift.set_quota(player_data, new_quota)
	local new_bool_quota = not (new_quota < snowdrift.OUTSIDE_QUOTA)
	if (player_data.bool_quota ~= new_bool_quota) then
		player_data.has_changed = true
		for _, funct in pairs(player_data.listener_bool_quota) do
			funct (player_data, new_weather)
		end
	end
	player_data.bool_quota = new_bool_quota
end


-- Listeners
-- =========


function snowdrift.register_on_changeweather(player_data, funct, listener_name)
	player_data.listener_weather[listener_name] = funct
end


function snowdrift.register_on_changeboolquota(player_data, funct, listener_name)
	player_data.listener_bool_quota[listener_name] = funct
end

function snowdrift.clear_changeweather(player_data, listener_name)
	player_data.listener_weather[listener_name] = nil
end


function snowdrift.clear_changeboolquota(player_data, listener_name)
	player_data.listener_bool_quota[listener_name] = nil
end


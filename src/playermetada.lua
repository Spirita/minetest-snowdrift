--- snowdrift/src/playermetada.lua
-- Metadata about the player


snowdrift.players_data = {}


-- Getter and Setter
-- =================


--- Initialize the table of metadata for the player
-- @param player the concerned player
function snowdrift.initialize_player_data(player)
	local player_name = player:get_player_name()
		snowdrift.players_data[player_name] = {
		player = player,
		player_name = player_name,
		ppos = nil,
		weather = "clear",
		bool_quota = false,
		sound_handle = nil,
		has_changed = false, -- TODO must disapear with listener
		listener_weather = {},
		listener_bool_quota = {}
	}
end


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



---------------------------------


-- Global variables -- TODO be a metadata for each player
-- ================

--- force_weather is a a string representing a weather or the string "default".
-- "default" let the calculations decide of the wheather.
-- "rain", "snow" or "clear" escape calculations and are applyed for every player without checking theirs environnements.
-- Not persistent when server is reboot.
snowdrift.force_weather = "default"


-- Getter and setter

function snowdrift.get_force_weather()
	return snowdrift.force_weather
end


--- Force the weather to be weather or unforce a forced weather.
-- @param weather <rain|snow|clear|default>, default unforce a weather
function snowdrift.set_force_weather(weather)
	snowdrift.force_weather = weather
end



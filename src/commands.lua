--- snowdrift/src/commands.lua
-- File for privileges and chat commandes registration.


-- Privilege weather
minetest.register_privilege("weather", {
	description = "Force the weather",
	give_to_singleplayer = false
})


-- Commande to force weather
minetest.register_chatcommand("setweather", {
	params = "<rain|snow|clear|default>",
	description = "Force the weather to rain, snow or clear, without limit of time. Use default to let it do.",
	privs = {weather = true},
	func = function(player_name, param)
		snowdrift.set_force_weather(param)
	end
})

-- Commande to receive informations, in the chat, about weather
minetest.register_chatcommand("weather", {
	params = "",
	description = "Send information about what weather is and if it's forced or natural",
	func = function(player_name, param)
		snowdrift.chat_send_player_weather(player_name)
	end
})



-- Function
-- ========

--- Send information about what weather is and if it's forced or not to the chat of the player called name.
-- @param player_name a name of a valid player
function snowdrift.chat_send_player_weather(player_name)
	local msg = "The weather is "
	msg = (msg .. snowdrift.players_data[player_name].weather)
	if (snowdrift.force_weather ~="default") then
		msg = (msg .. ".\nThe weather is forced.")
	else
		msg = (msg .. " naturally.")
	end
	minetest.chat_send_player(player_name, msg)
end


-- force_weather is a a string representing a weather or the string "default".
-- "default" let the calculations decide of the wheather.
-- "rain", "snow" or "clear" escape calculations and are applyed for every player without checking theirs environnements.

--- Force the weather to be weather or unforce a forced weather.
-- @param weather <rain|snow|clear|default>, default unforce a weather
function snowdrift.set_force_weather(player_name, weather_name)
	local player_data = snowdrift.players_data[player_name]
	if (weather_name == "default") then
		player_data.is_weather_forced = false
		snowdrift.calcul_weather(player_data)
	else
		if snowdrift.weathers_data[weather_name] then
			player_data.is_weather_forced = true
			player_data.weather = weather_name
		else
			minetest.chat_send_player(player_name, "The asked weather is not recognize.")
		end
	end
end




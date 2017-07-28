--- snowdrift/src/calculation.lua
-- File of functions about calculations of snowdrift.



-- Function to calculate the weather
-- =================================

--- Calculate the weather for the given position.
-- @param player_data the metadata of the player, get player_data.ppos and set_weather(player_data, new_weather)
function snowdrift.calcul_weather(player_data)
	if (snowdrift.force_weather ~="default") then -- Avoid calculations
		snowdrift.set_weather(player_data, snowdrift.force_weather)
		return
	end
	local ppos = player_data.ppos
	if not (ppos.y >= snowdrift.YLIMIT) then
		snowdrift.set_weather(player_data, "clear") -- TODO issue : change the sky color
	else
		
		-- TODO link with new mod
		
		local freeze = nval_temp < 35
		local precip = nval_prec < (nval_humid - 50) / 50 + snowdrift.PRECOFF and
					nval_humid - grad * nval_temp > yint
		
		if precip then
			if freeze then
				snowdrift.set_weather(player_data, "snow")
			else
				snowdrift.set_weather(player_data, "rain")
			end
		else
			snowdrift.set_weather(player_data, "clear")
		end
	end
end


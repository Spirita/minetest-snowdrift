--- snowdrift/src/playermetada.lua
-- Manage the loop for others


snowdrift.others_data = {}


-- Registers new others
-- ====================


function snowdrift.register_other(player_data, functs, params, other_name)
	snowdrift.others_data[other_name] = {
		other_name = other_name,
		player_data = player_data,
		functs = functs,
		params = params
	}
end


function snowdrift.clear_other(other_name)
	snowdrift.others_data[other_name] = nil
end


function snowdrift.add_funct_other(other_name, funct, params) -- TODO create a fresh copy to undo if problem
	local check
	local other_data = snowdrift.others_data[other_name]
	table.insert(other_data.functs, funct)
	table.insert(other_data.params, params)
	check = snowdrift.check_coherence_funct_other(other_data)
	if not check then
		minetest.log("Snodrift.add_funct_other :coherenc of the table of functions lost on the other named "..other_name)
	end
	return check
end


function snowdrift.check_coherence_funct_other(other_data)
	return(table.getn(other_data.functs) == table.getn(other_data.params))
end


-- Loop
-- ====


--- Main loop for not players
function snowdrift.main_loop_others()
	for _, other_data in ipairs(snowdrift.others_data) do
		snowdrift.loop_on_funct_other(other_data)
	end
end


function snowdrift.loop_on_funct_other(other_data)
	local params = other_data.params
	for i, funct in ipairs(other_data.funct) do
		funct (params[i]) -- TODO params[i] must be converted from table to tuple
	end
end



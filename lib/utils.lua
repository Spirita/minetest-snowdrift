--- snowdrift/src/utils.lua
--Small librairy of functions that are not specific at snowdrift.


-- Test inside / outside

--- Test if the pos is outside using ligth at midday (may issue with glass).
-- @param pos position to test
-- @return true if outside
function snowdrift.is_outside(pos)
	return (minetest.get_node_light(pos, 0.5) == 15)
end


--- Alias for "not snowdrift.is_outside(pos)".
-- @param pos position to test
-- @return true if inside
-- @see snowdrift.is_outside(pos)
function snowdrift.is_inside(pos)
	return (not snowdrift.is_outside(pos))
end


-- Calculate position

--- Round the player position.
-- @param player player to calculate the position
-- @return a table with a value for x, y and z.
function snowdrift.round_player_position(player)
	return vector.round(player:getpos())
end


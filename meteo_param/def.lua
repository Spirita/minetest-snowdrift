

-- For calculations
-- ================

snowdrift.np_prec = {
	offset = 0,
	scale = 1,
	spread = {x = snowdrift.PRECSPR, y = snowdrift.PRECSPR, z = snowdrift.PRECSPR},
	seed = 813,
	octaves = 1,
	persist = 0,
	lacunarity = 2.0
}

-- These 2 must match biome heat and humidity noise parameters for a world
snowdrift.np_temp = {
	offset = 50,
	scale = 50,
	spread = {x = 1000, y = 1000, z = 1000},
	seed = 5349,
	octaves = 3,
	persist = 0.5,
	lacunarity = 2.0
}

snowdrift.np_humid = {
	offset = 50,
	scale = 50,
	spread = {x = 1000, y = 1000, z = 1000},
	seed = 842,
	octaves = 3,
	persist = 0.5,
	lacunarity = 2.0
}


-- Stuff
local grad = 14 / 95
local yint = 1496 / 95


-- Initialization
-- ==============

-- Initialise noise objects to nil
local nobj_temp = nil
local nobj_humid = nil
local nobj_prec = nil



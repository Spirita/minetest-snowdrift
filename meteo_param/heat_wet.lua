

		local nobj_temp = nobj_temp or minetest.get_perlin(snowdrift.np_temp)
		local nobj_humid = nobj_humid or minetest.get_perlin(snowdrift.np_humid)
		local nobj_prec = nobj_prec or minetest.get_perlin(snowdrift.np_prec)

		local nval_temp = nobj_temp:get2d({x = ppos.x, y = ppos.z})
		local nval_humid = nobj_humid:get2d({x = ppos.x, y = ppos.z})
		local nval_prec = nobj_prec:get2d({x = os.clock() / 60, y = 0})


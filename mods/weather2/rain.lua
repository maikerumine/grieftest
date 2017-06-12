rain_sounds = {}
rain_inside = {}

local function find_glass(pos)
	for i=1,12 do
		if minetest.get_node({x=pos.x, y=pos.y+i, z=pos.z}).name ~= "air" then
			return true
		end
	end
	return false
end

-- Rain
minetest.register_globalstep(function(dtime)
	if weather ~= "rain" then
		for _, player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			if rain_sounds[name] then
				minetest.sound_stop(rain_sounds[name])
				rain_sounds[name] = nil
			end
		end
		return
	end
	for _, player in ipairs(minetest.get_connected_players()) do
		local ppos = player:getpos()
		local name = player:get_player_name()
		local desnode = {"default:desert_sand", "default:desert_stone"}
		local inside = find_glass(ppos)

		-- Make sure player is not in a cave/house...
		local ppos2 = addvectors(ppos, {x=0, y=12, z=0})
		if minetest.find_node_near(ppos, 14, desnode) or (minetest.get_node_light(ppos, 0.5) and minetest.get_node_light(ppos, 0.5) < 3) or ppos.y < -5 then
			if rain_sounds[name] then
				minetest.sound_stop(rain_sounds[name])
				rain_sounds[name] = nil
			end
			return
		end

		if not rain_sounds[name] or inside ~= rain_inside[name] then
			if rain_sounds[name] then
				minetest.sound_stop(rain_sounds[name])
				rain_sounds[name] = nil
			end
			if not inside then
				rain_sounds[name] = minetest.sound_play("rain", {to_player = name, loop = true})
			else
				rain_sounds[name] = minetest.sound_play("rain_inside", {to_player = name, loop = true})
			end
			rain_inside[name] = inside
		end
		if inside then return end
		local minp = addvectors(ppos, {x=-9, y=7, z=-9})
		local maxp = addvectors(ppos, {x= 9, y=7, z= 9})

		local vel = {x=0, y=   -4, z=0}
		local acc = {x=0, y=-9.81, z=0}

		minetest.add_particlespawner({amount=25, time=0.5,
			minpos=minp, maxpos=maxp,
			minvel=vel, maxvel=vel,
			minacc=acc, maxacc=acc,
			minexptime=0.8, maxexptime=0.8,
			minsize=25, maxsize=25,
			collisiondetection=false, vertical=true, texture="weather_rain.png", player=player:get_player_name()})
	end
end)

minetest.register_abm({
	nodenames = {"default:basic_flame"},
	interval = 8,
	chance = 1,
	action = function (pos, node, active_object_count, active_object_count_wider)
		if weather2 == "rain" and minetest.get_node_light(pos, 0.5) > 3 then
			minetest.remove_node(pos)
		end
	end
})


-- Snow

local function find_glass(pos)
	for i=1,12 do
		if minetest.get_node({x=pos.x, y=pos.y+i, z=pos.z}).name ~= "air" then
			return true
		end
	end
	return false
end

minetest.register_globalstep(function(dtime)
	if weather ~= "snow" then return end
	for _, player in ipairs(minetest.get_connected_players()) do
		local ppos = player:getpos()
		local desnode = {"default:desert_sand", "default:desert_stone", "default:jungletree", "default:jungleleaves", "default:junglegrass", "moreblocks:rope"}

		-- Make sure player is not in a cave/house...
		if minetest.find_node_near(ppos, 14, desnode) or (minetest.get_node_light(ppos, 0.5) and minetest.get_node_light(ppos, 0.5) < 12) or find_glass(ppos) then return end

		local minp = addvectors(ppos, {x=-9, y=7, z=-9})
		local maxp = addvectors(ppos, {x= 9, y=7, z= 9})

		local minp_deep = addvectors(ppos, {x=-10, y=3.2, z=-10})
		local maxp_deep = addvectors(ppos, {x= 10, y=2.6, z= 10})

		local vel = {x=0, y=   -0.5, z=0}
		local acc = {x=0, y=   -0.5, z=0}

		minetest.add_particlespawner(5, 0.5,
			minp, maxp,
			vel, vel,
			acc, acc,
			5, 5,
			25, 25,
			false, "weather_snow.png", player:get_player_name())

		minetest.add_particlespawner(4, 0.5,
			minp_deep, maxp_deep,
			vel, vel,
			acc, acc,
			4, 4,
			25, 25,
			false, "weather_snow.png", player:get_player_name())
	end
end)

local snow_box =
{
	type  = "fixed",
	fixed = {-0.5, -0.5, -0.5, 0.5, -0.4, 0.5}
}

-- Snow cover
minetest.register_node("weather2:snow_cover", {
	tiles = {"weather_snow_cover.png"},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = snow_box,
	selection_box = snow_box,
	groups = {not_in_creative_inventory = 1, crumbly = 3, attached_node = 1},
	drop = {}
})

minetest.register_abm({
	nodenames = {"group:crumbly", "group:snappy", "group:cracky", "group:choppy"},
	neighbors = {"default:air"},
	interval = 10.0, 
	chance = 100,
	action = function (pos, node, active_object_count, active_object_count_wider)
		if weather == "snow" then
			if minetest.registered_nodes[node.name].drawtype == "normal"
			or minetest.registered_nodes[node.name].drawtype == "allfaces_optional" then
				local np = addvectors(pos, {x=0, y=1, z=0})
				if minetest.get_node_light(np, 0.5) == 15
				and minetest.get_node_light(np, 0) <= 10
				and minetest.get_node(np).name == "air" then
					local desnode = {"default:desert_sand", "default:desert_stone", "default:jungletree", "default:jungleleaves", "default:junglegrass", "moreblocks:rope"}

					if minetest.find_node_near(pos, 8, desnode) then return end
					if find_glass(pos) then return end
					local p0 = {x=np.x-2, y=np.y-2, z=np.z-2}
					local p1 = {x=np.x+2, y=np.y+2, z=np.z+2}
					local count = #minetest.find_nodes_in_area(p0, p1, {"default:snow"})

					if math.random(0,30) > count then
						minetest.add_node(np, {name="default:snow"})
					end
				end
			end
		end
	end
})
-- water freezes during snowfall at night
minetest.register_abm({
	nodenames = {"default:water_source"},
	neighbors = {"group:crumbly", "group:snappy", "group:cracky", "group:choppy", "default:ice"},
	interval = 10.0,
	chance = 100,
	action = function (pos, node, active_object_count, active_object_count_wider)
		local desnode = {"default:desert_sand", "default:desert_stone", "default:jungletree", "default:jungleleaves", "default:junglegrass", "moreblocks:rope"}
		if minetest.find_node_near(pos, 8, desnode) then return end
		if weather == "snow" then
				local np = addvectors(pos, {x=0, y=1, z=0})
				if minetest.get_node_light(np, 0.5) == 15
				and minetest.get_node_light(np) < 13 then
						minetest.add_node(pos, {name="default:ice"})
				end
		end
	end
})

-- melt snow cover and ice around light sources
minetest.register_abm({
	nodenames = {"default:snow", "default:ice"},
	interval = 3,
	chance = 10,
	action = function(pos, node, active_object_count, active_object_count_wider)
			if minetest.get_node_light(pos, 0) >= 12 then
				if node.name == "default:snow" then
					minetest.remove_node(pos)
					if minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name == "default:dirt_with_snow" then
						minetest.set_node({x=pos.x, y=pos.y-1, z=pos.z}, {name="default:dirt_with_grass"})
					end
				elseif node.name == "default:ice" then
					minetest.set_node(pos, {name="default:water_source"})
				end
			end
	end,
})


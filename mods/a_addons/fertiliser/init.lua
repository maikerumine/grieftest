fertiliser = {}
fertiliser.grows = {
	stdtree = function(pos, def)
		if farming~=nil and farming.generate_tree~=nil then
			farming:generate_tree(pos, def[4][1], def[4][2], def[4][3], def[4][4])
        	end
	end,
	jungletree = function(pos, def)
--		farming:generate_tree(pos, def[4][1], def[4][2], def[4][3], def[4][4])
		local nu = minetest.get_node({x=pos.x, y=pos.y-1, z=pos.z}).name
		local is_soil = minetest.get_item_group(nu, "soil")
		if is_soil == 0 then
        		return
		end
		
		print("[fertiliser] spawned "..node.name.." tree")
		local vm = minetest.get_voxel_manip()
        	local minp, maxp = vm:read_from_map({x=pos.x-16, y=pos.y, z=pos.z-16}, {x=pos.x+16, y=pos.y+16, z=pos.z+16})
	 	local a = VoxelArea:new{MinEdge=minp, MaxEdge=maxp}
        	local data = vm:get_data()
        	default.grow_jungletree(data, a, pos, math.random(1,100000))
        	vm:set_data(data)
        	vm:write_to_map(data)
        	vm:update_map()
	end,
	moretrees = function(pos, def)
		local node = minetest.get_node(pos)
		print("[fertiliser] spawned "..node.name.." tree")
		plantslib.growing[def[1]](pos, node, nil, nil)
	end,
	clone = function(pos, def)
		local node = minetest.get_node(pos)
		
		while minetest.get_node(pos).name == node.name do
			pos.y = pos.y + 1
		end
		
		if minetest.get_node(pos).name=="air" then
			minetest.set_node(pos, node)
			return true
		end
		return false
	end,
}
fertiliser.saplings = {
	{
		"default:sapling",  --  name
		5,					--  chance
		fertiliser.grows.stdtree,
		{
			"default:tree",
			"default:leaves",
			{"default:dirt", "default:dirt_with_grass"},
			{},
		},
	},
	{
		"default:junglesapling",  --  name
		5,					--  chance
		fertiliser.grows.jungletree,
		{
			"default:tree",
			"default:leaves",
			{"default:dirt", "default:dirt_with_grass"},
			{},
		},
	},

	{
		"default:cactus",
		1,
		fertiliser.grows.clone,
	},
	{
		"default:papyrus",
		1,
		fertiliser.grows.clone,
	},
}

minetest.after(0, function()
	
	local register = function(val)
		for i = 1, #val.names do
			local name = val.names[i]
			fertiliser.saplings[#fertiliser.saplings + 1] = {
				name,
				1,
				function(pos, def)
					minetest.set_node(pos, {name = (val.names[i+1] or val.full_grown)})
				end,
			}
		end
	end
	
	if farming.registered_plants~=nil then
		for _, val in ipairs(farming.registered_plants) do
			register(val)
		end
	end
	
	local names = {"farming:wheat_1",
					"farming:wheat_2",
					"farming:wheat_3",
					"farming:wheat_4",
					"farming:wheat_5",
					"farming:wheat_6",
					"farming:wheat_7"}
	
	register( {
		full_grown = "farming:wheat_8",
		names = names
	})
	
	names = {		"farming:cotton_1",
					"farming:cotton_2",
					"farming:cotton_3",
					"farming:cotton_4",
					"farming:cotton_5",
					"farming:cotton_6",
					"farming:cotton_7"}
	
	register( {
		full_grown = "farming:cotton_8",
		names = names
	})
end)

minetest.register_craftitem("fertiliser:fertiliser", {
	description = "Fertiliser",
	inventory_image = "fertiliser_fertiliser.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type=="node" then
			local pos = pointed_thing.under
			local node = minetest.get_node(pos)
			for i=1, #fertiliser.saplings do
				local def = fertiliser.saplings[i]
				if node.name==def[1] then
					local res
					if math.random(def[2])==1 then
						res = def[3](pos, def)
					end
					if res~=false then itemstack:take_item() end
				end
			end
		end
		return itemstack
	end,
})

minetest.register_craft({
    output = 'fertiliser:fertiliser 9',
    recipe = {
        {'default:dirt',	'default:dirt',			'default:dirt'},
        {'default:dirt',	'bones:single_bone',	        'default:dirt'},
        {'default:dirt',	'default:dirt',			'default:dirt'},
    },
})

minetest.register_craft({
	type = 'shapeless',
    output = 'fertiliser:fertiliser 2',
    recipe = {'bones:single_bone'},
})

minetest.register_craft({
    output = 'dye:white 3',
    recipe = {
        {'fertiliser:fertiliser'},
    },
})

minetest.register_craft({
    output = 'fertiliser:fertiliser 19',
    recipe = {
        {'bones:single_bone', 'bones:single_bone', 'bones:single_bone'},
        {'bones:single_bone', 'bones:single_bone', 'bones:single_bone'},
        {'bones:single_bone', 'bones:single_bone', 'bones:single_bone'},
    },
})

minetest.register_craft({
	type = 'shapeless',
    output = 'bones:single_bone 9',
    recipe = {'bones:bones'},
})

minetest.register_craftitem(":bones:single_bone", {
	description = "Single Bone",
	inventory_image = "fertiliser_bone.png",
})

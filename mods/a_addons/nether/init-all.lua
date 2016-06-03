-- Minetest 0.4 Mod: Nether

local NETHER_DEPTH = -2000
local NETHER_AMBIENT = 6
local nether_created = false


--RND CODE
--NO GRIEF WITH liquids
local function disable_placing_above_ground(name)

   local table = minetest.registered_nodes[name]; if not table then return end
   local table2 = {}
   for i,v in pairs(table) do table2[i] = v end
   table2.after_place_node = function(pos, placer, itemstack, pointed_thing)
      if pos.y<= -2000 then minetest.set_node(pos,{name = "air"}) end
   end
   minetest.register_node(":"..name, table2)
end

minetest.after(0,function()
   disable_placing_above_ground("default:water_source");
   disable_placing_above_ground("default:river_water_source");
   disable_placing_above_ground("default:lava_source");
   disable_placing_above_ground("es:toxic_water_source");
   disable_placing_above_ground("es:mud");
   disable_placing_above_ground("bucket:bucket_water");
   disable_placing_above_ground("bucket:bucket_river_water");
   -- add here all other sources: toxic water, mud ,....
end)


minetest.register_node("nether:portal", {
	description = "Nether Portal",
	tiles = {
		"nether_transparent.png",
		"nether_transparent.png",
		"nether_transparent.png",
		"nether_transparent.png",
		{
			name = "nether_portal.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 32,
				aspect_h = 32,
				length = 2,
			},
		},
		{
			name = "nether_portal.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 32,
				aspect_h = 32,
				length = 2,
			},
		},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = true,
	walkable = false,
	digable = false,
	pointable = false,
	buildable_to = false,
	drop = "",
	light_source = 11,
	post_effect_color = {a=180, r=145, g=50, b=230},
	alpha = 192,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1,  0.5, 0.5, 0.1},
		},
	},
	groups = {not_in_creative_inventory=1}
})


local function build_portal(pos, target)
	local p = {x=pos.x-1, y=pos.y-1, z=pos.z}
	local p1 = {x=pos.x-1, y=pos.y-1, z=pos.z}
	local p2 = {x=p1.x+3, y=p1.y+4, z=p1.z}
	local emin = {x=pos.x-100, y=pos.y-100, z=pos.z-100}
	local emax = {x=p1.x+100, y=p1.y+100, z=p1.z+100}
	local perlin1 = minetest.get_perlin(11,3, 0.5, 100)
	local perlin2 = minetest.get_perlin(23,3, 0.5, 50)
	local perlin3 = minetest.get_perlin(17,3, 0.5, 100)
	local vm = minetest.get_voxel_manip()
	local gmin
	local gmax

	gmin, gmax = vm:read_from_map(emin, emax)

	local data = vm:get_data()
	local area = VoxelArea:new{MinEdge=gmin, MaxEdge=gmax}
	local c_air = minetest.get_content_id("air")
	local c_fire = minetest.get_content_id("nether:permanent_flame")
	local c_lava = minetest.get_content_id("lava_source")
	local c_netherrack = minetest.get_content_id("nether:rack")
	
	--insert cavegen here
	
	


	for i=1,4 do
		minetest.set_node(p, {name="default:obsidian"})
		p.y = p.y+1
	end
	for i=1,3 do
		minetest.set_node(p, {name="default:obsidian"})
		p.x = p.x+1
	end
	for i=1,4 do
		minetest.set_node(p, {name="default:obsidian"})
		p.y = p.y-1
	end
	for i=1,3 do
		minetest.set_node(p, {name="default:obsidian"})
		p.x = p.x-1
	end
	for x=p1.x,p2.x do
	for y=p1.y,p2.y do
		p = {x=x, y=y, z=p1.z}
		if not (x == p1.x or x == p2.x or y==p1.y or y==p2.y) then
			minetest.set_node(p, {name="nether:portal", param2=0})
		end
		local meta = minetest.get_meta(p)
		meta:set_string("p1", minetest.pos_to_string(p1))
		meta:set_string("p2", minetest.pos_to_string(p2))
		meta:set_string("target", minetest.pos_to_string(target))

	end
	end
	nether_created = true
end


--begin to make broken

minetest.register_abm({
	nodenames = {"nether:portal"},
	--interval = 1,
	interval = 7,
	--chance = 2,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32, --amount
			4, --time
			{x=pos.x-0.25, y=pos.y-0.25, z=pos.z-0.25}, --minpos
			{x=pos.x+0.25, y=pos.y+0.25, z=pos.z+0.25}, --maxpos
			{x=-0.8, y=-0.8, z=-0.8}, --minvel
			{x=0.8, y=0.8, z=0.8}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"nether_particle.png" --texture
		)
		--for _,obj in ipairs(minetest.get_objects_inside_radius(pos, 1)) do
		for _,obj in ipairs(minetest.get_objects_inside_radius(pos,1)) do
		local lua_entity = obj:get_luaentity()
			--if not obj:is_player() or lua_entity or lua_entity.itemstring ~= "" then
			--local detected_obj = lua_entity.name or ""
			if obj:is_player() or lua_entity then
				local meta = minetest.get_meta(pos)
				local target = minetest.string_to_pos(meta:get_string("target"))
				if target then
					minetest.after(3, function(obj, pos, target)
						local objpos = obj:getpos()  if objpos == nil then return end
						objpos.y = objpos.y+0.5  -- Fix some glitches at -8000
						if minetest.get_node(objpos).name ~= "nether:portal" then
							return
						end
						obj:setpos(target)
						minetest.sound_play("tng_transporter1", {pos=target,gain=0.5,max_hear_distance = 8,})

						local function check_and_build_portal(pos, target)
							local n = minetest.get_node_or_nil(target)
							if n and n.name ~= "nether:portal" then
								build_portal(target, pos)
								minetest.after(1, check_and_build_portal, pos, target)
								minetest.after(4, check_and_build_portal, pos, target)
							elseif not n then
								minetest.after(1, check_and_build_portal, pos, target)
							end
						end

						minetest.after(1, check_and_build_portal, pos, target)

					end, obj, pos, target)
				end
				--end
			end
		end
	end,
})
--end make broken


local function move_check(p1, max, dir)
	local p = {x=p1.x, y=p1.y, z=p1.z}
	local d = math.abs(max-p1[dir]) / (max-p1[dir])
	p[dir] = p[dir] + d
	while p[dir] ~= max - d do
		p[dir] = p[dir] + d
		if minetest.get_node(p).name ~= "default:obsidian" then
			return false
		end
	end
	return true
end

local function check_portal(p1, p2)
	if p1.x ~= p2.x then
		if not move_check(p1, p2.x, "x") then
			return false
		end
		if not move_check(p2, p1.x, "x") then
			return false
		end
	elseif p1.z ~= p2.z then
		if not move_check(p1, p2.z, "z") then
			return false
		end
		if not move_check(p2, p1.z, "z") then
			return false
		end
	else
		return false
	end

	if not move_check(p1, p2.y, "y") then
		return false
	end
	if not move_check(p2, p1.y, "y") then
		return false
	end

	return true
end

local function is_portal(pos)
	for d=-3,3 do
		for y=-4,4 do
			local px = {x=pos.x+d, y=pos.y+y, z=pos.z}
			local pz = {x=pos.x, y=pos.y+y, z=pos.z+d}
			if check_portal(px, {x=px.x+3, y=px.y+4, z=px.z}) then
				return px, {x=px.x+3, y=px.y+4, z=px.z}
			end
			if check_portal(pz, {x=pz.x, y=pz.y+4, z=pz.z+3}) then
				return pz, {x=pz.x, y=pz.y+4, z=pz.z+3}
			end
		end
	end
end
--[[]]
local function make_portal(pos)
	local p1, p2 = is_portal(pos)
	if not p1 or not p2 then
		return false
	end

	for d=1,2 do
	for y=p1.y+1,p2.y-1 do
		local p
		if p1.z == p2.z then
			p = {x=p1.x+d, y=y, z=p1.z}
		else
			p = {x=p1.x, y=y, z=p1.z+d}
		end
		if minetest.get_node(p).name ~= "air" then
			return false
		end
	end
	end

	local param2
	if p1.z == p2.z then param2 = 0 else param2 = 1 end

	local target = {x=p1.x, y=p1.y, z=p1.z}
	target.x = target.x + 1
	if target.y < NETHER_DEPTH then
		--target.y = math.random(-230, -240)  --this makes return portal
		target.y = math.random(8, 32)  --this makes return portal
	else
		target.y = NETHER_DEPTH - 1000
	end

	for d=0,3 do
	for y=p1.y,p2.y do
		local p = {}
		if param2 == 0 then p = {x=p1.x+d, y=y, z=p1.z} else p = {x=p1.x, y=y, z=p1.z+d} end
		if minetest.get_node(p).name == "air" then
			minetest.set_node(p, {name="nether:portal", param2=param2})
		end
		local meta = minetest.get_meta(p)
		meta:set_string("p1", minetest.pos_to_string(p1))
		meta:set_string("p2", minetest.pos_to_string(p2))
		meta:set_string("target", minetest.pos_to_string(target))
	end
	end
	return true
end
--[[]]
minetest.register_node(":default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky=1,level=2},

	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local p1 = minetest.string_to_pos(meta:get_string("p1"))
		local p2 = minetest.string_to_pos(meta:get_string("p2"))
		local target = minetest.string_to_pos(meta:get_string("target"))
		if not p1 or not p2 then
			return
		end
		for x=p1.x,p2.x do
		for y=p1.y,p2.y do
		for z=p1.z,p2.z do
			local nn = minetest.get_node({x=x,y=y,z=z}).name
			if nn == "default:obsidian" or nn == "nether:portal" then
				if nn == "nether:portal" then
					minetest.remove_node({x=x,y=y,z=z})
				end
				local m = minetest.get_meta({x=x,y=y,z=z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end
		meta = minetest.get_meta(target)
		if not meta then
			return
		end
		p1 = minetest.string_to_pos(meta:get_string("p1"))
		p2 = minetest.string_to_pos(meta:get_string("p2"))
		if not p1 or not p2 then
			return
		end
		for x=p1.x,p2.x do
		for y=p1.y,p2.y do
		for z=p1.z,p2.z do
			local nn = minetest.get_node({x=x,y=y,z=z}).name
			if nn == "default:obsidian" or nn == "nether:portal" then
				if nn == "nether:portal" then
					minetest.remove_node({x=x,y=y,z=z})
				end
				local m = minetest.get_meta({x=x,y=y,z=z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target", "")
			end
		end
		end
		end
	end,
})

minetest.register_craftitem(":fire:flint_and_steel", {
	description = "Flint -n- Steel",
	inventory_image = "fire_flint_steel.png",
	on_place = function(stack,_, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:obsidian" then
			local done = make_portal(pt.under)
			if done and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end
		return stack
	end,
	on_use = function(itemstack, user, pointed_thing)
		local player_name = user:get_player_name()
		local pt = pointed_thing

		if pt.type == "node" and minetest.get_node(pt.above).name == "air" then
			itemstack:add_wear(1000)
			local node_under = minetest.get_node(pt.under).name

			if minetest.get_item_group(node_under, "flammable") >= 0 then
				if not minetest.is_protected(pt.above, player_name) then
					--minetest.set_node(pt.above, {name = "fire:basic_flame"})
					minetest.set_node(pt.above, {name = "fire:permanent_flame"})
				else
					minetest.chat_send_player(player_name, "This area is protected")
				end
			end
		end

		if not minetest.setting_getbool("creative_mode") then
			return itemstack
		end
	end
})

--[[
minetest.register_node("nether:bedrock", {
	description = "Bedrock",
	tiles = {"bedrock2_bedrock.png"},
	groups = {immortal=1, not_in_creative_inventory=1},
	sounds = { footstep = { name = "default_gravel_footstep", gain = 1 } },
	is_ground_content = false,
	on_blast = function() end,
	on_destruct = function () end,
	can_dig = function() return false end,
	diggable = false,
	drop = "",
})
]]
minetest.register_node("nether:rack", {
	description = "Netherrack",
	tiles = {"nether_rack.png"},
	is_ground_content = true,
	drop = {
		max_items = 1,
		items = {{
			rarity = 3,
			items = {"nether:rack"},
		}}
	},
	light_source = NETHER_AMBIENT,
	groups = {cracky=3,level=0},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:sand", {
	description = "Soul Sand",
	tiles = {"nether_sand.png"},
	is_ground_content = true,
	light_source = NETHER_AMBIENT,
	groups = {crumbly=1,level=2,falling_node=1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.45},
	}),
})

minetest.register_craftitem("nether:glowstone_dust", {
	description = "Glowstone Dust",
	inventory_image = "nether_glowstone_dust.png",
	stack_max = 64,
})

minetest.register_node("nether:glowstone", {
	description = "Glowstone",
	tiles = {"nether_glowstone.png"},
	is_ground_content = true,
	light_source = 15,
	stack_max = 64,
	drop = {
		items = {
			{items = {'nether:glowstone_dust'}},
			{items = {'nether:glowstone_dust'}},
			{items = {'nether:glowstone_dust'},rarity=2},
			{items = {'nether:glowstone_dust'},rarity=0},
		}
	},
	--groups = {dig=default.dig.glowstone},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft{
	output = "nether:glowstone",
	recipe = {
		{"nether:glowstone_dust", "nether:glowstone_dust"},
		{"nether:glowstone_dust", "nether:glowstone_dust"},
	}
}



minetest.register_node("nether:brick", {
	description = "Nether Brick",
	tiles = {"nether_brick.png"},
	groups = {cracky=2,level=2},
	light_source = NETHER_AMBIENT-2,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:rack_with_diamond", {
	description = "Diamond Ore",
	tiles = {"nether_rack.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	light_source = 10,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:permanent_flame", {
	description = "Permanent Flame",
	drawtype = "firelike",
	tiles = {
		{
			name = "fire_basic_flame_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1
			},
		},
	},
	inventory_image = "fire_basic_flame.png",
	paramtype = "light",
	light_source = 14,
	walkable = false,
	buildable_to = true,
	sunlight_propagates = true,
	damage_per_second = 4,
	groups = {igniter = 2, dig_immediate = 3},
	drop = "",

	on_blast = function()
	end,
})




local fencenether_texture = "default_fence_overlay.png^nether_brick.png^default_fence_overlay.png^[makealpha:255,126,126"
minetest.register_node("nether:fence", {
	description = "Nether Brick Fence",
	drawtype = "fencelike",
	tiles = {"nether_brick.png"},
	inventory_image = fencenether_texture,
	wield_image = fencenether_texture,
	paramtype = "light",
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.2, -0.5, -0.2, 0.2, 1.0, 0.2},
		},
	},
	groups = {cracky=3,oddly_breakable_by_hand=2,flammable=2},
	sounds = default.node_sound_stone_defaults(),
})
minetest.register_craft({
	output = 'nether:fence 6',
	recipe = {
		{'nether:brick', 'nether:brick', 'nether:brick'},
		{'nether:brick', 'nether:brick', 'nether:brick'},
	}
})

--Mapgen stuffs


	-- nether
--[[
	minetest.register_ore({
	ore_type       = "scatter",
	ore            = "air",
	wherein        = {"nether:rack"},
	clust_scarcity = 1,
	clust_num_ores = 20,  --per node  laggy
	clust_size     = 3, --thick
	height_min     = -3005,
	height_max     = -2990,
	noise_threshhold = 1,
	--noise_params = {offset=0, scale=1, spread={x=0.5, y=2, z=0.5}, seed=24, octaves=2, persist=1.0}  --solid
	noise_params = {offset=0, scale=1, spread={x=1, y=2, z=1}, seed=24, octaves=2, persist=0.8}
})
]]

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "nether:glowstone",
		wherein         = {"nether:rack"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = -2000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

		minetest.register_ore({
		ore_type        = "blob",
		ore             = "nether:brick",
		wherein         = {"nether:rack"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = -2000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:lava_source",
		wherein        = "nether:rack",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min           = -31000,
		y_max           = -2100,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:rack_with_diamond",
		wherein        = "nether:rack",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 12,
		clust_size     = 5,
		y_min           = -31000,
		y_max           = -3000,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:glowstone",
		wherein        = "nether:rack",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min           = -31000,
		y_max           = -2000,
	})

minetest.register_ore({
	--ore_type       = "blob",
	ore_type       = "scatter",
	ore            = "default:gravel",
	wherein        = {"nether:rack"},
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 12,
	clust_size     = 8,
	height_min     = -31000,
	height_max     = -2000,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "nether:sand",
	wherein        = {"nether:rack"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 8,
	height_min     = -31000,
	height_max     = -2000,
	noise_threshhold = 0.9,
	noise_params = {offset=0, scale=1, spread={x=30, y=30, z=30}, seed=24, octaves=3, persist=0.70}
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:permanent_flame",
		--ore            = "fire:basic_flame",
		wherein        = "nether:rack",
		clust_scarcity = 18 *18 * 18,
		clust_num_ores = 8,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -2000,
	})

		minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:glowstone",
		wherein        = "nether:rack",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -2000,
	})


	-- Underground

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "nether:rack",
		--depth_filler = ,
		--node_stone =  "nether:rack",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2280,
		y_max = -113,
		heat_point = 50,
		humidity_point = 50,
	})

		minetest.register_biome({
		name = "bedrock_upper",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "nether:bedrock",
		--depth_filler = ,
		node_stone =  "default:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2900,
		y_max = -2281,
		heat_point = 50,
		humidity_point = 50,
	})

		minetest.register_biome({
		name = "Nunderground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "nether:rack",
		--depth_filler = ,
		node_stone =  "nether:rack",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3100,
		y_max = -2901,
		heat_point = 50,
		humidity_point = 50,
	})

		minetest.register_biome({
		name = "lava",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "default:lava_source",
		--depth_filler = ,
		node_stone =  "default:lava_source",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5000,
		y_max = -3101,
		heat_point = 50,
		humidity_point = 50,
	})

		minetest.register_biome({
		name = "bedrock_lower",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "nether:bedrock2",
		--depth_filler = ,
		node_stone =  "default:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = -5001,
		heat_point = 50,
		humidity_point = 50,
	})


--paramats cavegen
--hacked by maikerumine


--params
local TCAVE = 0.6
local BLEND = 128

-- 3D noise

local np_cave = {
	offset = 0,
	scale = 1,
	spread = {x = 384, y = 128, z = 384}, -- squashed 3:1
	seed = 59033,
	octaves = 5,
	persist = 0.7
}


-- Stuff

local yblmax = NETHER_DEPTH - BLEND * 2

-- Register stair and slab

stairs.register_stair_and_slab(
	"nether_brick",
	"nether:brick",
	{cracky = 2, level = 2},
	{"nether_brick.png"},
	"nether stair",
	"nether slab",
	default.node_sound_stone_defaults()
)

-- Craftitems

minetest.register_craftitem(":default:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "default_mese_crystal_fragment.png",
	on_place = function(stack, _, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:obsidian" then
			local done = make_portal(pt.under)
			if done and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end

		return stack
	end,
})


-- Crafting

minetest.register_craft({
	output = "nether:brick 4",
	recipe = {
		{"nether:rack", "nether:rack"},
		{"nether:rack", "nether:rack"},
	}
})

minetest.register_craft({
	output = "nether:fence_nether_brick 6",
	recipe = {
		{"nether:brick", "nether:brick", "nether:brick"},
		{"nether:brick", "nether:brick", "nether:brick"},
	},
})

-- Mapgen

-- Initialize noise object and localise noise buffer

local nobj_cave = nil
local nbuf_cave


-- Content ids

local c_air = minetest.get_content_id("air")
--[[
local c_stone_with_coal = minetest.get_content_id("default:stone_with_coal")
local c_stone_with_iron = minetest.get_content_id("default:stone_with_iron")
local c_stone_with_mese = minetest.get_content_id("default:stone_with_mese")
local c_stone_with_diamond = minetest.get_content_id("default:stone_with_diamond")
local c_stone_with_gold = minetest.get_content_id("default:stone_with_gold")
local c_stone_with_copper = minetest.get_content_id("default:stone_with_copper")
local c_mese = minetest.get_content_id("default:mese")

local c_gravel = minetest.get_content_id("default:gravel")
local c_dirt = minetest.get_content_id("default:dirt")
local c_sand = minetest.get_content_id("default:sand")
]]
local c_cobble = minetest.get_content_id("default:cobble")
local c_mossycobble = minetest.get_content_id("default:mossycobble")
local c_stair_cobble = minetest.get_content_id("stairs:stair_cobble")

local c_lava_source = minetest.get_content_id("default:lava_source")
local c_lava_flowing = minetest.get_content_id("default:lava_flowing")
local c_water_source = minetest.get_content_id("default:water_source")
local c_water_flowing = minetest.get_content_id("default:water_flowing")

local c_glowstone = minetest.get_content_id("nether:glowstone")
local c_nethersand = minetest.get_content_id("nether:sand")
local c_netherbrick = minetest.get_content_id("nether:brick")
local c_netherrack = minetest.get_content_id("nether:rack")






-- On-generated function

minetest.register_on_generated(function(minp, maxp, seed)
	if minp.y > NETHER_DEPTH then
		return
	end

	local t1 = os.clock()

	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge = emin, MaxEdge = emax}
	local data = vm:get_data()

	local x11 = emax.x -- Limits of mapchunk plus mapblock shell
	local y11 = emax.y
	local z11 = emax.z
	local x00 = emin.x
	local y00 = emin.y
	local z00 = emin.z

	local ystride = x1 - x0 + 1
	local zstride = ystride * ystride
	local chulens = {x = ystride, y = ystride, z = ystride}
	local minposxyz = {x = x0, y = y0, z = z0}

	nobj_cave = nobj_cave or minetest.get_perlin_map(np_cave, chulens)
	local nvals_cave = nobj_cave:get3dMap_flat(minposxyz, nbuf_cave)

	for y = y00, y11 do -- Y loop first to minimise tcave calculations
		local tcave
		local in_chunk_y = false
		if y >= y0 and y <= y1 then
			if y > yblmax then
				tcave = TCAVE + ((y - yblmax) / BLEND) ^ 2
			else
				tcave = TCAVE
			end
			in_chunk_y = true
		end

		for z = z00, z11 do
			local vi = area:index(x00, y, z) -- Initial voxelmanip index
			local ni
			local in_chunk_yz = in_chunk_y and z >= z0 and z <= z1

			for x = x00, x11 do
				if in_chunk_yz and x == x0 then
					-- Initial noisemap index
					ni = (z - z0) * zstride + (y - y0) * ystride + 1
				end
				local in_chunk_yzx = in_chunk_yz and x >= x0 and x <= x1 -- In mapchunk

				local id = data[vi] -- Existing node
				-- Cave air, cave liquids and dungeons are overgenerated,
				-- convert these throughout mapchunk plus shell
				if id == c_air or -- Air and liquids to air
				--		id == c_lava_source or
				--		id == c_lava_flowing or
						id == c_water_source or
						id == c_water_flowing then
					data[vi] = c_air
				-- Dungeons are preserved so we don't need
				-- to check for cavern in the shell
				elseif id == c_cobble or -- Dungeons (preserved) to netherbrick
						id == c_mossycobble or
						id == c_stair_cobble then
					data[vi] = c_netherbrick
				end

				if in_chunk_yzx then -- In mapchunk
					if nvals_cave[ni] > tcave then -- Only excavate cavern in mapchunk
						data[vi] = c_air
						--[[
					elseif id == c_mese then -- Mese block to lava
						data[vi] = c_lava_source
					elseif id == c_stone_with_gold or -- Precious ores to glowstone
							id == c_stone_with_mese or
							id == c_stone_with_diamond then
						data[vi] = c_glowstone
					elseif id == c_gravel or -- Blob ore to nethersand
							id == c_dirt or
							id == c_sand then
						data[vi] = c_nethersand
					else -- All else to netherstone
						data[vi] = c_netherrack
						]]
					end

					ni = ni + 1 -- Only increment noise index in mapchunk
				end

				vi = vi + 1
			end
		end
	end

	vm:set_data(data)
	vm:set_lighting({day = 0, night = 0})
	vm:calc_lighting()
	vm:update_liquids()
	vm:write_to_map()

	local chugent = math.ceil((os.clock() - t1) * 1000)
	print ("[nether] generate chunk " .. chugent .. " ms")
end)




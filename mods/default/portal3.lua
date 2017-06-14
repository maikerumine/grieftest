-- Parameters

local END_DEPTH = -5750  --5600 is good emerald area
local TCAVE = 0.6
local nobj_cave = nil
-- 3D noise

local np_cave = {
	offset = 0,
	scale = 1,
	spread = {x = 384, y = 128, z = 384}, -- squashed 3:1
	seed = 59033,
	octaves = 5,
	persist = 0.7
}


-- Functions

local function build_end_portal(pos, target3)
	local p = {x = pos.x - 1, y = pos.y - 1, z = pos.z}
	local p1 = {x = pos.x - 1, y = pos.y - 1, z = pos.z}
	local p2 = {x = p1.x + 3, y = p1.y + 4, z = p1.z}

	for i = 1, 4 do
		minetest.set_node(p, {name = "default:purpur_block"})
		p.y = p.y + 1
	end
	for i = 1, 3 do
		minetest.set_node(p, {name = "default:purpur_block"})
		p.x = p.x + 1
	end
	for i = 1, 4 do
		minetest.set_node(p, {name = "default:purpur_block"})
		p.y = p.y - 1
	end
	for i = 1, 3 do
		minetest.set_node(p, {name = "default:purpur_block"})
		p.x = p.x - 1
	end

	for x = p1.x, p2.x do
	for y = p1.y, p2.y do
		p = {x = x, y = y, z = p1.z}
		if not (x == p1.x or x == p2.x or y == p1.y or y == p2.y) then
			minetest.set_node(p, {name = "default:end_portal", param2 = 0})
		end
		local meta = minetest.get_meta(p)
		meta:set_string("p1", minetest.pos_to_string(p1))
		meta:set_string("p2", minetest.pos_to_string(p2))
		meta:set_string("target3", minetest.pos_to_string(target3))

		if y ~= p1.y then
			for z = -2, 2 do
				if z ~= 0 then
					p.z = p.z + z
					if minetest.registered_nodes[
							minetest.get_node(p).name].is_ground_content then
						minetest.remove_node(p)
					end
					p.z = p.z - z
				end
			end
		end
	end
	end
end

local function find_nether_target3_y2(target3_x, target3_z)
	--local start_y = NETHER_DEPTH - math.random(500, 1500) -- Search start
	local start_y = END_DEPTH - math.random(30,1130) -- Search start
	local nobj_cave_point = minetest.get_perlin(np_cave)
	local air = 0 -- Consecutive air nodes found

	for y = start_y, start_y -3096, -1 do  --was 4096  then -1096
		local nval_cave = nobj_cave_point:get3d({x = target3_x, y = y, z = target3_z})

		if nval_cave > TCAVE then -- Cavern
			air = air + 1
		else -- Not cavern, check if 4 nodes of space above
			if air >= 4 then
				return y + 2
			else -- Not enough space, reset air to zero
				air = 0
			end
		end
	end

	return y -- Fallback
end

local function move_check2(p1, max, dir)
	local p = {x = p1.x, y = p1.y, z = p1.z}
	local d = math.abs(max - p1[dir]) / (max - p1[dir])

	while p[dir] ~= max do
		p[dir] = p[dir] + d
		if minetest.get_node(p).name ~= "default:purpur_block" then
			return false
		end
	end

	return true
end

local function check_end_portal(p1, p2)
	if p1.x ~= p2.x then
		if not move_check2(p1, p2.x, "x") then
			return false
		end
		if not move_check2(p2, p1.x, "x") then
			return false
		end
	elseif p1.z ~= p2.z then
		if not move_check2(p1, p2.z, "z") then
			return false
		end
		if not move_check2(p2, p1.z, "z") then
			return false
		end
	else
		return false
	end

	if not move_check2(p1, p2.y, "y") then
		return false
	end
	if not move_check2(p2, p1.y, "y") then
		return false
	end

	return true
end

local function is_end_portal(pos)
	for d = -3, 3 do
		for y = -4, 4 do
			local px = {x = pos.x + d, y = pos.y + y, z = pos.z}
			local pz = {x = pos.x, y = pos.y + y, z = pos.z + d}

			if check_end_portal(px, {x = px.x + 3, y = px.y + 4, z = px.z}) then
				return px, {x = px.x + 3, y = px.y + 4, z = px.z}
			end
			if check_end_portal(pz, {x = pz.x, y = pz.y + 4, z = pz.z + 3}) then
				return pz, {x = pz.x, y = pz.y + 4, z = pz.z + 3}
			end
		end
	end
end

--local function make_end_portal2(pos)
function make_end_portal(pos)
	local p1, p2 = is_end_portal(pos)
	if not p1 or not p2 then
		return false
	end

	for d = 1, 2 do
	for y = p1.y + 1, p2.y - 1 do
		local p
		if p1.z == p2.z then
			p = {x = p1.x + d, y = y, z = p1.z}
		else
			p = {x = p1.x, y = y, z = p1.z + d}
		end
		if minetest.get_node(p).name ~= "air" then
			return false
		end
	end
	end

	local param2
	if p1.z == p2.z then
		param2 = 0
	else
		param2 = 1
	end

	local target3 = {x = p1.x, y = p1.y, z = p1.z}
	target3.x = target3.x + 1
	if target3.y < END_DEPTH then
		--target3.y = math.random(-32, 1)
		target3.y = math.random(-52, 100)
	else
		target3.y = find_nether_target3_y2(target3.x, target3.z)
	end

	for d = 0, 3 do
	for y = p1.y, p2.y do
		local p = {}
		if param2 == 0 then
			p = {x = p1.x + d, y = y, z = p1.z}
		else
			p = {x = p1.x, y = y, z = p1.z + d}
		end
		if minetest.get_node(p).name == "air" then
			minetest.set_node(p, {name = "default:end_portal", param2 = param2})
		end
		local meta = minetest.get_meta(p)
		meta:set_string("p1", minetest.pos_to_string(p1))
		meta:set_string("p2", minetest.pos_to_string(p2))
		meta:set_string("target3", minetest.pos_to_string(target3))
	end
	end

	return true
end


-- ABMs

minetest.register_abm({
	nodenames = {"default:end_portal"},
	interval = 1,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			32, --amount
			4, --time
			{x = pos.x - 0.25, y = pos.y - 0.25, z = pos.z - 0.25}, --minpos
			{x = pos.x + 0.25, y = pos.y + 0.25, z = pos.z + 0.25}, --maxpos
			{x = -0.8, y = -0.8, z = -0.8}, --minvel
			{x = 0.8, y = 0.8, z = 0.8}, --maxvel
			{x = 0, y = 0, z = 0}, --minacc
			{x = 0, y = 0, z = 0}, --maxacc
			0.5, --minexptime
			1, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			"default_particle.png^[colorize:#000000:150" --texture
		)
		--for _, obj in ipairs(minetest.get_objects_inside_radius(pos, 1)) do
		for _,obj in ipairs(minetest.get_objects_inside_radius(pos,1)) do		--maikerumine added for objects to travel
		local lua_entity = obj:get_luaentity()							--maikerumine added for objects to travel
			--if obj:is_player() then
			if obj:is_player() or lua_entity then
				local meta = minetest.get_meta(pos)
				local target3 = minetest.string_to_pos(meta:get_string("target3"))
				if target3 then
					-- force emerge of target3 area
					minetest.get_voxel_manip():read_from_map(target3, target3)
					if not minetest.get_node_or_nil(target3) then
						minetest.emerge_area(
							vector.subtract(target3, 4), vector.add(target3, 4))
					end
					-- teleport the player
					minetest.after(3, function(obj, pos, target3)
						local objpos = obj:getpos()   if objpos == nil then return end	--maikerumine added for objects to travel
						objpos.y = objpos.y + 0.1 -- Fix some glitches at -8000
						if minetest.get_node(objpos).name ~= "default:end_portal" then
							return
						end

						obj:setpos(target3)
						minetest.sound_play("tng_transporter1", {pos=target3,gain=0.5,max_hear_distance = 8,})	--maikerumine added sound when travel

						local function check_and_build_end_portal(pos, target3)
							local n = minetest.get_node_or_nil(target3)
							if n and n.name ~= "default:end_portal" then
								build_end_portal(target3, pos)
								minetest.after(2, check_and_build_end_portal, pos, target3)  --was 2
								minetest.after(4, check_and_build_end_portal, pos, target3)
							elseif not n then
								minetest.after(1, check_and_build_end_portal, pos, target3)
							end
						end

						minetest.after(1, check_and_build_end_portal, pos, target3) --was 1

					end, obj, pos, target3)
				end
			end
		end
	end,
})


-- Nodes

minetest.register_node("default:end_portal", {
	description = "END Portal",
	tiles = {
		"default_transparent.png",
		"default_transparent.png",
		"default_transparent.png",
		"default_transparent.png",
		{
			name = "default_portal.png^[colorize:#FFFFFF:150",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
		{
			name = "default_portal.png^[colorize:#FFFFFF:150",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.5,
			},
		},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	use_texture_alpha = true,
	walkable = false,
	diggable = false,
	pointable = false,
	buildable_to = false,
	is_ground_content = false,
	drop = "",
	light_source = 5,
	post_effect_color = {a = 128, r = 133, g =133, b = 133},
	alpha = 192,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.1,  0.5, 0.5, 0.1},
		},
	},
	groups = {not_in_creative_inventory = 1}
})

minetest.register_node(":default:purpur_block", {
	description = "Purpur Block",
	tiles = {"default:purpur_block"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},

	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local p1 = minetest.string_to_pos(meta:get_string("p1"))
		local p2 = minetest.string_to_pos(meta:get_string("p2"))
		local target3 = minetest.string_to_pos(meta:get_string("target3"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "default:purpur_block" or nn == "default:end_portal" then
				if nn == "default:end_portal" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target3", "")
			end
		end
		end
		end

		meta = minetest.get_meta(target3)
		if not meta then
			return
		end
		p1 = minetest.string_to_pos(meta:get_string("p1"))
		p2 = minetest.string_to_pos(meta:get_string("p2"))
		if not p1 or not p2 then
			return
		end

		for x = p1.x, p2.x do
		for y = p1.y, p2.y do
		for z = p1.z, p2.z do
			local nn = minetest.get_node({x = x, y = y, z = z}).name
			if nn == "default:purpur_block" or nn == "default:end_portal" then
				if nn == "default:end_portal" then
					minetest.remove_node({x = x, y = y, z = z})
				end
				local m = minetest.get_meta({x = x, y = y, z = z})
				m:set_string("p1", "")
				m:set_string("p2", "")
				m:set_string("target3", "")
			end
		end
		end
		end
	end,
})


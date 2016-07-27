
--maikerumine added particles and light
minetest.register_abm({
	nodenames = {"nyancat:nyancat_rainbow"},
	interval = 10,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			3, --amount was 16
			4, --time
			{x=pos.x-0.5, y=pos.y-0.5, z=pos.z-0.5}, --minpos
			{x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, --maxpos
			{x=-0.5, y=-0.5, z=-0.5}, --minvel
			{x=0.5, y=0.5, z=0.5}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			3, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			--"nether_particle.png" --texture
			"nyancat_rainbow.png" --texture
		)
	end,
})

minetest.register_abm({
	nodenames = {"nyancat:nyancat"},
	interval = 10,
	chance = 2,
	action = function(pos, node)
		minetest.add_particlespawner(
			1, --amount was16
			4, --time
			{x=pos.x-0.5, y=pos.y-0.5, z=pos.z-0.5}, --minpos
			{x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, --maxpos
			{x=-0.5, y=-0.5, z=-0.5}, --minvel
			{x=0.5, y=0.5, z=0.5}, --maxvel
			{x=0,y=0,z=0}, --minacc
			{x=0,y=0,z=0}, --maxacc
			0.5, --minexptime
			3, --maxexptime
			1, --minsize
			2, --maxsize
			false, --collisiondetection
			--"nether_particle.png" --texture
			"nyancat_front.png" --texture
		)
	end,
})


--Stationary Liquid code
minetest.register_node("nyancat:nyancat", {
	description = "Nyan Cat",
	drawtype = "liquid",
	tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png",
		"nyancat_side.png", "nyancat_back.png", "nyancat_front.png"},
		
	special_tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png",
		"nyancat_side.png", "nyancat_back.png", "nyancat_front.png"},
	alpha = 230,
	paramtype2 = "facedir",
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	sunlight_propagates = true,
	walkable = true,
	--climbable = true,
	is_ground_content = false,
	drop = "nyancat:nyancat",
	drowning = 0,
	liquidtype = "",
	liquid_alternative_flowing = "nyancat:nyancat",
	liquid_alternative_source = "nyancat:nyancat",
	liquid_viscosity = 15,
	post_effect_color = {a = 244, r = 190, g = 20, b = 70},
	groups = {cracky = 2},
	is_ground_content = false,
	legacy_facedir_simple = true,
	iquid_renewable = false,
	liquid_range = 0,
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("nyancat:nyancat_rainbow", {
	description = "Nyan Cat Rainbow",
	drawtype = "liquid",
	tiles = {
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png"
	},
		
	special_tiles = {
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png"
	},
	alpha = 230,
	paramtype2 = "facedir",
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	sunlight_propagates = true,
	walkable = true,
	--climbable = true,
	is_ground_content = false,
	drop = "nyancat:nyancat_rainbow",
	drowning = 0,
	liquidtype = "",
	liquid_alternative_flowing = "nyancat:nyancat_rainbow",
	liquid_alternative_source = "nyancat:nyancat_rainbow",
	liquid_viscosity = 15,
	post_effect_color = {a = 244, r = 190, g = 20, b = 70},
	groups = {cracky = 2},
	is_ground_content = false,
	legacy_facedir_simple = true,
	iquid_renewable = false,
	liquid_range = 0,
	sounds = default.node_sound_glass_defaults(),
})




--Flowing water code
--[[
minetest.register_node("nyancat:nyancat", {
	description = "Nyan Cat",
	drawtype = "liquid",
	tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png",
		"nyancat_side.png", "nyancat_back.png", "nyancat_front.png"},
		
	special_tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png",
		"nyancat_side.png", "nyancat_back.png", "nyancat_front.png"},
	alpha = 160,
	paramtype2 = "facedir",
	paramtype = "light",
	walkable = true,
	pointable = true,
	diggable = true,
	buildable_to = true,
	is_ground_content = false,
	drop = "nyancat:nyancat",
	drowning = 0,
	liquidtype = "source",
	liquid_alternative_flowing = "nyancat:nyancat_rainbow",
	liquid_alternative_source = "nyancat:nyancat",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 90, g = 60, b = 30},
	groups = {cracky = 2},
	is_ground_content = false,
	legacy_facedir_simple = true,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("nyancat:nyancat_rainbow", {
	description = "Nyan Cat Rainbow",
	--drawtype = "liquid",
	drawtype = "flowingliquid",
	tiles = {
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png"
	},
		
	special_tiles = {
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png"
	},
	alpha = 160,
	paramtype2 = "facedir",
	paramtype = "light",
	walkable = true,
	pointable = true,
	diggable = true,
	buildable_to = true,
	is_ground_content = false,
	drop = "nyancat:nyancat_rainbow",
	drowning = 0,
	liquidtype = "flowing",
	liquid_alternative_flowing = "nyancat:nyancat_rainbow",
	liquid_alternative_source = "nyancat:nyancat",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 90, g = 60, b = 30},
	groups = {cracky = 2},
	is_ground_content = false,
	legacy_facedir_simple = true,
	sounds = default.node_sound_defaults(),
})
]]


--Good code
--[[
minetest.register_node("nyancat:nyancat", {
	description = "Nyan Cat",
	tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png",
		"nyancat_side.png", "nyancat_back.png", "nyancat_front.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	legacy_facedir_simple = true,
	sounds = default.node_sound_defaults(),
})

minetest.register_node("nyancat:nyancat_rainbow", {
	description = "Nyan Cat Rainbow",
	tiles = {
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png"
	},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})
]]





minetest.register_craft({
	type = "fuel",
	recipe = "nyancat:nyancat",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "nyancat:nyancat_rainbow",
	burntime = 1,
})

nyancat = {}

function nyancat.place(pos, facedir, length)
	if facedir > 3 then
		facedir = 0
	end
	local tailvec = minetest.facedir_to_dir(facedir)
	local p = {x = pos.x, y = pos.y, z = pos.z}
	minetest.set_node(p, {name = "nyancat:nyancat", param2 = facedir})
	for i = 1, length do
		p.x = p.x + tailvec.x
		p.z = p.z + tailvec.z
		minetest.set_node(p, {name = "nyancat:nyancat_rainbow", param2 = facedir})
	end
end

function nyancat.generate(minp, maxp, seed)
	local height_min = -31000
	local height_max = -32
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x - minp.x + 1) * (y_max - y_min + 1) * (maxp.z - minp.z + 1)
	local pr = PseudoRandom(seed + 9324342)
	local max_num_nyancats = math.floor(volume / (16 * 16 * 16))
	for i = 1, max_num_nyancats do
		if pr:next(0, 1000) == 0 then
			local x0 = pr:next(minp.x, maxp.x)
			local y0 = pr:next(minp.y, maxp.y)
			local z0 = pr:next(minp.z, maxp.z)
			local p0 = {x = x0, y = y0, z = z0}
			nyancat.place(p0, pr:next(0, 3), pr:next(3, 15))
		end
	end
end

minetest.register_on_generated(function(minp, maxp, seed)
	nyancat.generate(minp, maxp, seed)
end)

-- Legacy
minetest.register_alias("default:nyancat", "nyancat:nyancat")
minetest.register_alias("default:nyancat_rainbow", "nyancat:nyancat_rainbow")
minetest.register_alias("nyancat", "nyancat:nyancat")
minetest.register_alias("nyancat_rainbow", "nyancat:nyancat_rainbow")
default.make_nyancat = nyancat.place
default.generate_nyancats = nyancat.generate

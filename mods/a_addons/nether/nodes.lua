-- Minetest 0.4 Mod: Nether

local NETHER_AMBIENT = 6


--[[	--moved to default
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
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("nether:sand", {
	description = "Soul Sand",
	tiles = {"nether_sand.png"},
	is_ground_content = true,
	light_source = NETHER_AMBIENT,
	groups = {crumbly=1,level=2,falling_node=1},
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.45},
	}),
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

minetest.register_node("nether:brick", {
	description = "Nether Brick",
	tiles = {"nether_brick.png"},
	groups = {cracky=2,level=2},
	stack_max = 64,
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

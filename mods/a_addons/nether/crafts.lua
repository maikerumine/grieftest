-- Minetest 0.4 Mod: Nether

minetest.register_craftitem("nether:glowstone_dust", {
	description = "Glowstone Dust",
	inventory_image = "nether_glowstone_dust.png",
	stack_max = 64,
})

minetest.register_craft{
	output = "nether:glowstone",
	recipe = {
		{"nether:glowstone_dust", "nether:glowstone_dust"},
		{"nether:glowstone_dust", "nether:glowstone_dust"},
	}
}

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
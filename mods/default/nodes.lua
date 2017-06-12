-- mods/default/nodes.lua


--[[ Node name convention:

Although many node names are in combined-word form, the required form for new
node names is words separated by underscores. If both forms are used in written
language (for example pinewood and pine wood) the underscore form should be used.

--]]


--[[ Index:

Stone
-----
(1. Material 2. Cobble variant 3. Brick variant 4. Modified forms)

oddly_breakable_by_hand = 2, his was removed on trees and wood

default:stone
default:cobble
default:stonebrick
default:mossycobble

default:desert_stone
default:desert_cobble
default:desert_stonebrick

default:sandstone
default:sandstonebrick

default:obsidian
default:obsidianbrick
default:bedrock

Soft / Non-Stone
----------------
(1. Material 2. Modified forms)

default:dirt
default:dirt_with_grass
default:dirt_with_grass_footsteps
default:dirt_with_dry_grass
default:dirt_with_snow

default:sand
default:desert_sand

default:gravel

default:clay

default:snow
default:snowblock

default:ice

Trees
-----
(1. Trunk 2. Fabricated trunk 3. Leaves 4. Sapling 5. Fruits)

default:tree
default:wood
default:leaves
default:sapling
default:apple

default:jungletree
default:junglewood
default:jungleleaves
default:junglesapling

default:pine_tree
default:pine_wood
default:pine_needles
default:pine_sapling

default:acacia_tree
default:acacia_wood
default:acacia_leaves
default:acacia_sapling

default:aspen_tree
default:aspen_wood
default:aspen_leaves
default:aspen_sapling

Ores
----
(1. In stone 2. Blocks)

default:stone_with_coal
default:coalblock

default:stone_with_iron
default:steelblock

default:stone_with_copper
default:copperblock
default:bronzeblock

default:stone_with_gold
default:goldblock

default:stone_with_mese
default:mese

default:stone_with_diamond
default:diamondblock

Plantlife (non-cubic)
---------------------

default:cactus
default:papyrus
default:dry_shrub
default:junglegrass

default:grass_1
default:grass_2
default:grass_3
default:grass_4
default:grass_5

default:dry_grass_1
default:dry_grass_2
default:dry_grass_3
default:dry_grass_4
default:dry_grass_5

Liquids
-------
(1. Source 2. Flowing)

default:water_source
default:water_flowing

default:river_water_source
default:river_water_flowing

default:lava_source
default:lava_flowing

Tools / "Advanced" crafting / Non-"natural"
-------------------------------------------

default:torch

default:chest
default:chest_locked

default:bookshelf

default:sign_wall_wood
default:sign_wall_steel

default:ladder_wood
default:ladder_steel

default:fence_wood
default:fence_acacia_wood
default:fence_junglewood
default:fence_pine_wood
default:fence_aspen_wood

default:glass
default:obsidian_glass

default:rail

default:brick

default:meselamp

Misc
----

default:cloud
default:nyancat
default:nyancat_rainbow

--]]


minetest.register_node( "default:granite", {
	description = "Granite",
	tiles = { "default_granite.png" },
	is_ground_content = true,
	groups = {cracky=2, stone = 1},
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "default:granite_smooth", {
	description = "Granite Polished",
	tiles = { "default_granite_smooth.png",},
	is_ground_content = true,
	groups = {cracky=2, stone = 1},
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "default:diorite", {
	description = "Diorite",
	tiles = { "default_diorite.png" },
	is_ground_content = true,
	groups = {cracky=2, stone = 1},
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "default:diorite_smooth", {
	description = "Diorite Smooth",
	tiles = { "default_diorite_smooth.png" },
	is_ground_content = true,
	groups = {cracky=2, stone = 1},
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "default:andesite", {
	description = "Andesite",
	tiles = { "default_andesite.png" },
	is_ground_content = true,
	groups = {cracky=2, stone = 1},
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node( "default:andesite_smooth", {
	description = "Andesite Smooth",
	tiles = { "default_andesite_smooth.png" },
	is_ground_content = true,
	groups = {cracky=2, stone = 1},
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stone_with_emerald", {
	description = "Emerald Ore",
	tiles = {"default_stone.png^default_mineral_emerald.png"},
	is_ground_content = true,
	groups = {cracky=1},
	stack_max = 64,
	drop = "default:emerald_crystal",
	sounds = default.node_sound_stone_defaults(),
})

--Emerald located at -54
minetest.register_node("default:emeraldblock", {
	description = "Emerald Block",
	tiles = {"default_emerald_block.png"},
	light_source = 7,
	is_ground_content = true,
	groups = {cracky=1,level=2},
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})
--[[
minetest.register_craftitem("default:emerald_crystal", {
	description = "Emerald Crystal",
	inventory_image = "default_emerald.png",
})
]]


--
-- Stone
--

minetest.register_node("default:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:savannastone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:cobble", {
	description = "Cobblestone",
	tiles = {"default_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:stonebrick", {
	description = "Stone Brick",
	tiles = {"default_stone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:stone_block", {
	description = "Stone Block",
	tiles = {"default_stone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stonebrickcarved", {
	description = "Chiseled Stone Bricks",
	tiles = {"default_stonebrick_carved.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stonebrickcracked", {
	description = "Cracked Stone Bricks",
	tiles = {"default_stonebrick_cracked.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:stonebrickmossy", {
	description = "Mossy Stone Bricks",
	tiles = {"default_stonebrick_mossy.png"},
	stack_max = 64,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:mossycobble", {
	description = "Mossy Cobblestone",
	tiles = {"default_mossycobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 1},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})


minetest.register_node("default:desert_stone", {
	description = "Desert Stone",
	--tiles = {"default_desert_stone.png"},
	tiles = {"default_redsandstone_top.png", "default_redsandstone_bottom.png", "default_redsandstone_normal.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:desert_cobble',
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:desert_cobble", {
	description = "Desert Cobblestone",
	tiles = {"default_desert_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:desert_stonebrick", {
	description = "Desert Stone Brick",
	--tiles = {"default_desert_stone_brick.png"},
	tiles = {"default_redsandstone_top.png", "default_redsandstone_bottom.png", "default_redsandstone_carved.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:desert_stone_block", {
	description = "Desert Stone Block",
	--tiles = {"default_desert_stone_block.png"},
	tiles = {"default_redsandstone_top.png", "default_redsandstone_bottom.png", "default_redsandstone_smooth.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = default.node_sound_stone_defaults(),
})


minetest.register_node("default:sandstone", {
	description = "Sandstone",
	--tiles = {"default_sandstone.png"},
	tiles = {"default_sandstone_top.png", "default_sandstone_bottom.png", "default_sandstone_normal.png"},
	groups = {crumbly = 2, cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:sandstonebrick", {
	description = "Sandstone Brick",
	--tiles = {"default_sandstone_brick.png"},
	tiles = {"default_sandstone_top.png", "default_sandstone_bottom.png", "default_sandstone_carved.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:sandstone_block", {
	description = "Sandstone Block",
	tiles = {"default_sandstone_block.png"},
	is_ground_content = false,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:obsidian", {
	description = "Obsidian",
	tiles = {"default_obsidian.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
	stack_max = 64,
})

minetest.register_node("default:obsidianbrick", {
	description = "Obsidian Brick",
	tiles = {"default_obsidian_brick.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
	stack_max = 64,
})

minetest.register_node("default:obsidian_block", {
	description = "Obsidian Block",
	tiles = {"default_obsidian_block.png"},
	is_ground_content = false,
	sounds = default.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
})

minetest.register_alias("nether:bedrock", "default:bedrock")
minetest.register_node("default:bedrock", {
	description = "Bedrock",
	tiles = {"default_bedrock.png"},
	groups = {immortal=1, not_in_creative_inventory=1,nether = 1},
	sounds = { footstep = { name = "default_gravel_footstep", gain = 1 } },
	is_ground_content = false,
	on_blast = function() end,
	on_destruct = function () end,
	can_dig = function() return false end,
	diggable = false,
	drop = "",
})



--
-- Soft / Non-Stone
--

minetest.register_node("default:dirt", {
	description = "Dirt",
	tiles = {"default_dirt.png"},
	groups = {crumbly = 2, soil = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},

	}),
	stack_max = 64,
})

minetest.register_node("default:coarse_dirt", {
	description = "Coarse Dirt",
	_doc_items_longdesc = "Coarse dirt acts as a soil for some plants and is similar to dirt, but it will never turn into a grass block.",
	tiles = {"default_coarse_dirt.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},

	}),

})

minetest.register_node("default:grass_path", {
	tiles = {"mcl_core_grass_path_top.png", "mcl_core_grass_path_side.png"},
	description = "Grass Path",
	_doc_items_longdesc = "Grass paths are a decorational variant of grass blocks. Their top has a different color and they are a bit lower than grass blocks, making them useful to build footpaths. Grass paths can be created with a shovel. A grass path turns into dirt when it is below a solid block.",
	drop = "default:dirt",
	is_ground_content = true,
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			-- 15/16 of the normal height
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5},
		}
	},
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},

	}),
})

-- TODO: Add particles
minetest.register_node("default:mycelium", {
	description = "Mycelium",
	_doc_items_longdesc = "Mycelium is a type of dirt and the ideal soil for mushrooms. Unlike other dirt-type blocks, it can not be turned into farmland with a hoe. In light, mycelium slowly spreads over nearby dirt. Under an opaque block or a liquid, it eventually turns back into dirt.",
	tiles = {"default_mycelium_top.png", "default_dirt.png", "default_mycelium_side.png"},
	is_ground_content = true,
	stack_max = 64,

	drop = 'default:dirt',
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},

	}),
})

-- NOTE: This block is to be considered equivalent to mycelium
minetest.register_node("default:mycelium_snow", {
	description = "Snowy Mycelium",
	_doc_items_create_entry = false,
	-- CHECKME: Are the sides of snowy mycelium supposed to look like this?
	tiles = {"default_snow.png", "default_coarse_dirt.png", "mcl_core_grass_side_snowed.png"},
	is_ground_content = true,
	stack_max = 64,

	drop = 'default:dirt',
	groups = {crumbly = 2},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},

	}),
})

minetest.register_node("default:podzol", {
	description = "Podzol",
	_doc_items_longdesc = "Podzol is a type of dirt found in taiga forests. Only a few plants are able to survive on it.",
	tiles = {"default_dirt_podzol_top.png", "default_dirt.png", "default_dirt_podzol_side.png"},
	is_ground_content = true,
	stack_max = 64,

	drop = 'default:dirt',
	groups = {crumbly = 2, soil = 1, spreading_dirt_type = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},

	}),
})

-- NOTE: This block is to be considered equivalent to podzol
minetest.register_node("default:podzol_snow", {
	description = "Snowy Podzol",
	_doc_items_create_entry = false,
	tiles = {"default_snow.png", "default_dirt.png", "mcl_core_grass_side_snowed.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {crumbly = 2, soil = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},

	}),
})

minetest.register_node("default:dirt_with_grass", {
	description = "Dirt with Grass",
	tiles = {"default_grass.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},

	}),
	stack_max = 64,
})

minetest.register_node("default:dirt_with_grass_footsteps", {
	description = "Dirt with Grass and Footsteps",
	tiles = {"default_grass.png^default_footprint.png", "default_dirt.png",
		{name = "default_dirt.png^default_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1, not_in_creative_inventory = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
	stack_max = 64,
})

minetest.register_node("default:dirt_with_rainforest_litter", {
	description = "Dirt with Rainforest Litter",
	tiles = {
		"default_rainforest_litter.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_rainforest_litter_side.png",
			tileable_vertical = false}
	},
	groups = {crumbly = 3, soil = 1, spreading_dirt_type = 1},
	drop = "default:dirt",
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
})

minetest.register_node("default:dirt_with_dry_grass", {
	description = "Dirt with Dry Grass",
	tiles = {"default_dry_grass.png",
		"default_dirt.png",
		{name = "default_dirt.png^default_dry_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	stack_max = 64,
})

minetest.register_node("default:dirt_with_snow", {
	description = "Dirt with Snow",
	tiles = {"default_snow.png", "default_dirt.png",
		{name = "default_dirt.png^default_snow_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 2, soil = 1},
	drop = 'default:dirt',
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
	}),
	stack_max = 64,
})

minetest.register_node("default:sand", {
	description = "Sand",
	tiles = {"default_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
	stack_max = 64,
})

minetest.register_node("default:desert_sand", {
	description = "Desert Sand",
	--tiles = {"default_desert_sand.png"},
	tiles = {"default_red_sand.png"},
	groups = {crumbly = 2, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
	stack_max = 64,
})


minetest.register_node("default:gravel", {
	description = "Gravel",
	tiles = {"default_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_gravel_footstep", gain = 0.5},
		dug = {name = "default_gravel_footstep", gain = 1.0},
	}),
	drop = {
		max_items = 1,
		items = {
			{items = {'default:flint'}, rarity = 16},
			{items = {'default:gravel'}}
		}
	}

})

minetest.register_node("default:clay", {
	description = "Clay",
	tiles = {"default_clay.png"},
	groups = {crumbly = 2},
	drop = 'default:clay_lump 4',
	sounds = default.node_sound_dirt_defaults(),
	stack_max = 64,
})

--bone
minetest.register_node("default:fossil", {
	description = "Fossil",
	tiles = {"mcl_core_bone_block_top.png", "mcl_core_bone_block_top.png", "mcl_core_bone_block_side.png"},
	groups = {cracky = 3},
	drop = 'default:fossil',
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
	paramtype2 = "facedir",
	on_place = minetest.rotate_node,
	stack_max = 64,
})


minetest.register_node("default:snow", {
	description = "Snow",
	tiles = {"default_snow.png"},
	inventory_image = "default_snowball.png",
	wield_image = "default_snowball.png",
	paramtype = "light",
	buildable_to = true,
	floodable = true,
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},
		},
	},
	groups = {crumbly = 3, falling_node = 1, puts_out_fire = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),

	on_construct = function(pos)
		pos.y = pos.y - 1
		if minetest.get_node(pos).name == "default:dirt_with_grass" then
			minetest.set_node(pos, {name = "default:dirt_with_snow"})
		end
	end,
	stack_max = 64,
})

minetest.register_node("default:snowblock", {
	description = "Snow Block",
	tiles = {"default_snow.png"},
	groups = {crumbly = 3, puts_out_fire = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_snow_footstep", gain = 0.15},
		dug = {name = "default_snow_footstep", gain = 0.2},
		dig = {name = "default_snow_footstep", gain = 0.2}
	}),
	stack_max = 64,
})

minetest.register_node("default:ice", {
	description = "Ice",
	tiles = {"default_ice.png"},
	is_ground_content = false,
	paramtype = "light",
	groups = {cracky = 2, puts_out_fire = 1},
	sounds = default.node_sound_glass_defaults(),
	stack_max = 64,
})

--
-- Trees
--

minetest.register_node("default:tree", {
	description = "Tree",
	tiles = {"default_tree_top.png", "default_tree_top.png", "default_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, flammable = 2,cracky = 1},
	stack_max = 64,
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node

})

minetest.register_node("default:wood", {
	description = "Wooden Planks",
	tiles = {"default_wood.png"},
	is_ground_content = false,
	groups = {choppy = 2,  flammable = 3, wood = 1,cracky = 1},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

minetest.register_node("default:sapling", {
	description = "Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling.png"},
	inventory_image = "default_sapling.png",
	wield_image = "default_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	stack_max = 64,
})

minetest.register_node("default:leaves", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_leaves.png"},
	special_tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get sapling with 1/20 chance
				items = {'default:sapling'},
				rarity = 20,
			},
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'default:leaves'},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
	stack_max = 64,
})

minetest.register_node("default:apple", {
	description = "Apple",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_apple.png"},
	inventory_image = "default_apple.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {fleshy = 3, dig_immediate = 3, flammable = 2,
		leafdecay = 3, leafdecay_drop = 1},
	on_use = minetest.item_eat(2),
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name = "default:apple", param2 = 1})
		end
	end,
	stack_max = 64,
})


minetest.register_node("default:jungletree", {
	description = "Jungle Tree",
	tiles = {"default_jungletree_top.png", "default_jungletree_top.png",
		"default_jungletree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2,  flammable = 2,cracky = 1},
	stack_max = 64,
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node

})

minetest.register_node("default:junglewood", {
	description = "Junglewood Planks",
	tiles = {"default_junglewood.png"},
	is_ground_content = false,
	groups = {choppy = 2,  flammable = 3, wood = 1,cracky = 1},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

minetest.register_node("default:jungleleaves", {
	description = "Jungle Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_jungleleaves.png"},
	special_tiles = {"default_jungleleaves_simple.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:junglesapling'}, rarity = 20},
			{items = {'default:jungleleaves'}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
	stack_max = 64,
})

minetest.register_node("default:junglesapling", {
	description = "Jungle Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_junglesapling.png"},
	inventory_image = "default_junglesapling.png",
	wield_image = "default_junglesapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	stack_max = 64,
})


minetest.register_node("default:pine_tree", {
	description = "Pine Tree",
	tiles = {"default_sprucetree_top.png", "default_sprucetree_top.png",
		"default_sprucetree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2,  flammable = 2,cracky = 1},
	stack_max = 64,
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node

})

minetest.register_node("default:pine_wood", {
	description = "Pine Wood Planks",
	tiles = {"default_sprucewood.png"},
	is_ground_content = false,
	groups = {choppy = 2,  flammable = 3, wood = 1,cracky = 1},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

minetest.register_node("default:pine_needles",{
	description = "Pine Needles",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"default_spruceleaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_sapling"}, rarity = 20},
			{items = {"default:pine_needles"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
	stack_max = 64,
})

minetest.register_node("default:pine_sapling", {
	description = "Pine Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sprucesapling.png"},
	inventory_image = "default_sprucesapling.png",
	wield_image = "default_sprucesapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	stack_max = 64,
})


minetest.register_node("default:acacia_tree", {
	description = "Acacia Tree",
	tiles = {"default_acaciatree_top.png", "default_acaciatree_top.png",
		"default_acaciatree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2,  flammable = 2,cracky = 1},
	stack_max = 64,
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node

})

minetest.register_node("default:acacia_wood", {
	description = "Acacia Wood Planks",
	tiles = {"default_acaciawood.png"},
	is_ground_content = false,
	groups = {choppy = 2,  flammable = 3, wood = 1,cracky = 1},
	stack_max = 64,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("default:acacia_leaves", {
	description = "Acacia Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	tiles = {"default_acacialeaves.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:acacia_sapling"}, rarity = 20},
			{items = {"default:acacia_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
	stack_max = 64,
})

minetest.register_node("default:acacia_sapling", {
	description = "Acacia Tree Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_acaciasapling.png"},
	inventory_image = "default_acaciasapling.png",
	wield_image = "default_acaciasapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	stack_max = 64,
})

minetest.register_node("default:aspen_tree", {
	description = "Aspen Tree",
--	tiles = {"default_aspen_tree_top.png", "default_aspen_tree_top.png",
--		"default_aspen_tree.png"},	
	tiles = {"default_log_birch_top.png", "default_log_birch_top.png",
		"default_log_birch.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2,  flammable = 2,cracky = 1},
	stack_max = 64,
	sounds = default.node_sound_wood_defaults(),

	on_place = minetest.rotate_node

})

minetest.register_node("default:aspen_wood", {
	description = "Aspen Wood Planks",
	--tiles = {"default_aspen_wood.png"},
	tiles = {"default_planks_birch.png"},
	is_ground_content = false,
	groups = {choppy = 2,  flammable = 3, wood = 1,cracky = 1},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

minetest.register_node("default:aspen_leaves", {
	description = "Aspen Leaves",
	drawtype = "allfaces_optional",
	visual_scale = 1.3,
	--tiles = {"default_aspen_leaves.png"},
	tiles = {"default_leaves_birch.png"},
	waving = 1,
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:aspen_sapling"}, rarity = 20},
			{items = {"default:aspen_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
	stack_max = 64,
})

minetest.register_node("default:aspen_sapling", {
	description = "Aspen Tree Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"default_sapling_birch.png"},
	inventory_image = "default_sapling_birch.png",
	wield_image = "default_sapling_birch.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),
	stack_max = 64,
})
--
-- Ores
--

minetest.register_node("default:stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_stone.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	--drop = 'default:coal_lump',
	drop = {
		max_items = 1,
		items = {
			{items = {'default:coal_lump 3'}, rarity = 10},
			{items = {'default:coal_lump'}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:coalblock", {
	description = "Coal Block",
	tiles = {"default_coal_block.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})


minetest.register_node("default:stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_stone.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	stack_max = 64,
	drop = 'default:stone_with_iron',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:steelblock", {
	description = "Steel Block",
	tiles = {"default_steel_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:stone_with_mese", {
	description = "Mese Ore",
	tiles = {"default_stone.png^default_mineral_mese.png"},
	groups = {cracky = 1},
	drop = "default:mese_crystal",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:mese", {
	description = "Mese Block",
	tiles = {"default_mese_block.png"},
	paramtype = "light",
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_stone_defaults(),
	light_source = 3,
	stack_max = 64,
})


minetest.register_node("default:stone_with_gold", {
	description = "Gold Ore",
	tiles = {"default_stone.png^default_mineral_gold.png"},
	groups = {cracky = 2},
	drop = "default:gold_lump",
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:goldblock", {
	description = "Gold Block",
	tiles = {"default_gold_block.png"},
	is_ground_content = false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})


minetest.register_node("default:stone_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_stone.png^default_mineral_diamond.png"},
	groups = {cracky = 2},
	drop = "default:diamond",
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:sand_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_sand.png^default_mineral_diamond.png"},
	groups = {crumbly = 1, falling_node = 1, sand = 1},
	drop = "default:diamond 2",
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})


minetest.register_node("default:diamondblock", {
	description = "Diamond Block",
	tiles = {"default_diamond_block.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 3},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:desert_stone_with_iron", {
	description = "Iron Ore",
	tiles = {"default_redsandstone_normal.png^default_mineral_iron.png"},
	groups = {cracky = 2},
	stack_max = 64,
	drop = 'default:stone_with_iron',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:desert_stone_with_coal", {
	description = "Coal Ore",
	tiles = {"default_redsandstone_normal.png^default_mineral_coal.png"},
	groups = {cracky = 3},
	stack_max = 64,
	--drop = 'default:coal_lump',
	drop = {
		max_items = 1,
		items = {
			{items = {'default:coal_lump 3'}, rarity = 10},
			{items = {'default:coal_lump'}}
		}
	},
	sounds = default.node_sound_stone_defaults(),
})




--
-- Plantlife (non-cubic)
--

minetest.register_node("default:cactus", {
	description = "Cactus",
	tiles = {"default_cactus_top.png", "default_cactus_bottom.png", "default_cactus_side.png","default_cactus_side.png","default_cactus_side.png","default_cactus_side.png"},
	is_ground_content = true,
	paramtype2 = "facedir",
	drawtype = "nodebox",
		node_box = {
		type = "fixed",
		fixed = {
			{-7/16, -8/16, -7/16,  7/16, 8/16,  7/16}, -- Main body
			{-8/16, -8/16, -7/16,  8/16, 8/16, -7/16}, -- Spikes
			{-8/16, -8/16,  7/16,  8/16, 8/16,  7/16}, -- Spikes
			{-7/16, -8/16, -8/16, -7/16, 8/16,  8/16}, -- Spikes
			{7/16,  -8/16,  8/16,  7/16, 8/16, -8/16}, -- Spikes
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {-7/16, -8/16, -7/16,  7/16, 7/16,  7/16}, -- Main body. slightly lower than node box
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-7/16, -8/16, -7/16, 7/16, 8/16, 7/16},
		},
	},
	groups = {snappy = 1, choppy = 3},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node,
	stack_max = 64,
})

minetest.register_node("default:papyrus", {
	description = "Papyrus",
	drawtype = "plantlike",
	tiles = {"default_papyrus.png"},
	inventory_image = "default_papyrus.png",
	wield_image = "default_papyrus.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
	groups = {snappy = 3, flammable = 2},
	sounds = default.node_sound_leaves_defaults(),

	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
	stack_max = 64,
})

minetest.register_node("default:dry_shrub", {
	description = "Dry Shrub",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.0,
	tiles = {"default_dry_shrub.png"},
	inventory_image = "default_dry_shrub.png",
	wield_image = "default_dry_shrub.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, attached_node = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {'default:stick'}, rarity = 5},
			{items = {'default:dry_shrub'}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	stack_max = 64,
})

minetest.register_node("default:junglegrass", {
	description = "Jungle Grass",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"default_junglegrass.png"},
	inventory_image = "default_junglegrass.png",
	wield_image = "default_junglegrass.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1,flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	stack_max = 64,
})


minetest.register_node("default:grass_1", {
	description = "Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_grass_1.png"},
	-- Use texture of a taller grass stage in inventory
	inventory_image = "default_grass_3.png",
	wield_image = "default_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flora = 1, attached_node = 1,flammable = 2},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random grass node
		local stack = ItemStack("default:grass_" .. math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
	stack_max = 64,
})

for i = 2, 5 do
	minetest.register_node("default:grass_" .. i, {
		description = "Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_grass_" .. i .. ".png"},
		inventory_image = "default_grass_" .. i .. ".png",
		wield_image = "default_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		drop = "default:grass_1",
		groups = {snappy = 3, flora = 1, attached_node = 1,flammable = 2,
			not_in_creative_inventory = 1},
			stack_max = 64,
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})

end


minetest.register_node("default:dry_grass_1", {
	description = "Dry Grass",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"default_dry_grass_1.png"},
	inventory_image = "default_dry_grass_3.png",
	wield_image = "default_dry_grass_3.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 3, flora = 1, attached_node = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},

	on_place = function(itemstack, placer, pointed_thing)
		-- place a random dry grass node
		local stack = ItemStack("default:dry_grass_" .. math.random(1, 5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("default:dry_grass_1 " ..
			itemstack:get_count() - (1 - ret:get_count()))
	end,
	stack_max = 64,
})

for i = 2, 5 do
	minetest.register_node("default:dry_grass_" .. i, {
		description = "Dry Grass",
		drawtype = "plantlike",
		waving = 1,
		tiles = {"default_dry_grass_" .. i .. ".png"},
		inventory_image = "default_dry_grass_" .. i .. ".png",
		wield_image = "default_dry_grass_" .. i .. ".png",
		paramtype = "light",
		sunlight_propagates = true,
		walkable = false,
		buildable_to = true,
		groups = {snappy = 3, flammable = 3, flora = 1,
			attached_node = 1, not_in_creative_inventory=1},
			stack_max = 64,
		drop = "default:dry_grass_1",
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
	})

end


minetest.register_node("default:bush_stem", {
	description = "Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_bush_stem.png"},
	inventory_image = "default_bush_stem.png",
	wield_image = "default_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.54, 7 / 16},
	},
})

minetest.register_node("default:bush_leaves", {
	description = "Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_leaves_simple.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:bush_sapling"}, rarity = 5},
			{items = {"default:bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:bush_sapling", {
	description = "Bush Sapling",
	drawtype = "plantlike",
	tiles = {"default_bush_sapling.png"},
	inventory_image = "default_bush_sapling.png",
	wield_image = "default_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, 2 / 16, 4 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})

minetest.register_node("default:acacia_bush_stem", {
	description = "Acacia Bush Stem",
	drawtype = "plantlike",
	visual_scale = 1.41,
	tiles = {"default_acacia_bush_stem.png"},
	inventory_image = "default_acacia_bush_stem.png",
	wield_image = "default_acacia_bush_stem.png",
	paramtype = "light",
	sunlight_propagates = true,
	groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.54, 7 / 16},
	},
})

minetest.register_node("default:acacia_bush_leaves", {
	description = "Acacia Bush Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	tiles = {"default_acacialeaves.png"},
	paramtype = "light",
	groups = {snappy = 3, flammable = 2, leaves = 1},
	drop = {
		max_items = 1,
		items = {
			{items = {"default:acacia_bush_sapling"}, rarity = 5},
			{items = {"default:acacia_bush_leaves"}}
		}
	},
	sounds = default.node_sound_leaves_defaults(),

	after_place_node = default.after_place_leaves,
})

minetest.register_node("default:acacia_bush_sapling", {
	description = "Acacia Bush Sapling",
	drawtype = "plantlike",
	tiles = {"default_acacia_bush_sapling.png"},
	inventory_image = "default_acacia_bush_sapling.png",
	wield_image = "default_acacia_bush_sapling.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	on_timer = default.grow_sapling,
	selection_box = {
		type = "fixed",
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, 2 / 16, 3 / 16}
	},
	groups = {snappy = 2, dig_immediate = 3, flammable = 2,
		attached_node = 1, sapling = 1},
	sounds = default.node_sound_leaves_defaults(),

	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(1200, 2400))
	end,

	on_place = function(itemstack, placer, pointed_thing)
		itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"default:acacia_bush_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			{x = -1, y = 0, z = -1},
			{x = 1, y = 1, z = 1},
			-- maximum interval of interior volume check
			2)

		return itemstack
	end,
})





--
-- Corals
--

minetest.register_node("default:coral_brown", {
	description = "Brown Coral",
	tiles = {"default_coral_brown.png"},
	groups = {cracky = 3},
	drop = "default:coral_skeleton",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_orange", {
	description = "Orange Coral",
	tiles = {"default_coral_orange.png"},
	groups = {cracky = 3},
	drop = "default:coral_skeleton",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:coral_skeleton", {
	description = "Coral Skeleton",
	tiles = {"default_coral_skeleton.png"},
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
})






--
-- Liquids
--

--20160726 liquids
minetest.register_node("default:water_source", {
	description = "Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "default_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("default:water_flowing", {
	description = "Flowing Water",
	drawtype = "flowingliquid",
	tiles = {"default_water.png"},
	special_tiles = {
		{
			name = "default_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:water_flowing",
	liquid_alternative_source = "default:water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1},
})


minetest.register_node("default:river_water_source", {
	description = "River Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		{
			name = "default_river_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:river_water_flowing",
	liquid_alternative_source = "default:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("default:river_water_flowing", {
	description = "Flowing River Water",
	drawtype = "flowingliquid",
	tiles = {"default_river_water.png"},
	special_tiles = {
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "default_river_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:river_water_flowing",
	liquid_alternative_source = "default:river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 30, g = 76, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1},
})


minetest.register_node("default:lava_source", {
	description = "Lava Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		-- New-style lava source material (mostly unused)
		{
			name = "default_lava_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1},
})

minetest.register_node("default:lava_flowing", {
	description = "Flowing Lava",
	drawtype = "flowingliquid",
	tiles = {"default_lava.png"},
	special_tiles = {
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "default_lava_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = default.LIGHT_MAX - 1,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "default:lava_flowing",
	liquid_alternative_source = "default:lava_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	damage_per_second = 4 * 2,
	post_effect_color = {a = 191, r = 255, g = 64, b = 0},
	groups = {lava = 3, liquid = 2, igniter = 1,
		not_in_creative_inventory = 1},
})


local bookshelf_formspec =
	"size[8,7;]" ..
	default.gui_bg ..
	default.gui_bg_img ..
	default.gui_slots ..
	"list[context;books;0,0.3;8,2;]" ..
	"list[current_player;main;0,2.85;8,1;]" ..
	"list[current_player;main;0,4.08;8,3;8]" ..
	"listring[context;books]" ..
	"listring[current_player;main]" ..
	default.get_hotbar_bg(0,2.85)

minetest.register_node("default:bookshelf", {
	description = "Bookshelf",
	tiles = {"default_wood.png", "default_wood.png", "default_bookshelf.png"},
	is_ground_content = false,
	groups = {choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	sounds = default.node_sound_wood_defaults(),

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", bookshelf_formspec)
		local inv = meta:get_inventory()
		inv:set_size("books", 8 * 2)
	end,
	can_dig = function(pos,player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("books")
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack)
		if minetest.get_item_group(stack:get_name(), "book") ~= 0 then
			return stack:get_count()
		end
		return 0
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff to bookshelf at " .. minetest.pos_to_string(pos))
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes stuff from bookshelf at " .. minetest.pos_to_string(pos))
	end,
})

local function register_sign(material, desc, def)
	minetest.register_node("default:sign_wall_" .. material, {
		description = desc .. " Sign",
		drawtype = "nodebox",
		tiles = {"default_sign_wall_" .. material .. ".png"},
		inventory_image = "default_sign_" .. material .. ".png",
		wield_image = "default_sign_" .. material .. ".png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.4375, 0.4375, -0.3125, 0.4375, 0.5, 0.3125},
			wall_bottom = {-0.4375, -0.5, -0.3125, 0.4375, -0.4375, 0.3125},
			wall_side   = {-0.5, -0.3125, -0.4375, -0.4375, 0.3125, 0.4375},
		},
		groups = def.groups,
		legacy_wallmounted = true,
		sounds = def.sounds,

		on_construct = function(pos)
			--local n = minetest.get_node(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("formspec", "field[text;;${text}]")
			meta:set_string("infotext", "\"\"")
		end,
		on_receive_fields = function(pos, formname, fields, sender)
			--print("Sign at "..minetest.pos_to_string(pos).." got "..dump(fields))
			local player_name = sender:get_player_name()
			if minetest.is_protected(pos, player_name) then
				minetest.record_protection_violation(pos, player_name)
				return
			end
			local meta = minetest.get_meta(pos)
			if not fields.text then return end
			minetest.log("action", (player_name or "") .. " wrote \"" ..
				fields.text .. "\" to sign at " .. minetest.pos_to_string(pos))
			meta:set_string("text", fields.text)
			meta:set_string("infotext", '"' .. fields.text .. '"')
		end,
	})
end

register_sign("wood", "Wooden", {
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy = 2, attached_node = 1, flammable = 2, oddly_breakable_by_hand = 3},
	stack_max = 64,

})

minetest.register_node("default:ladder_wood", {
	description = "Wooden Ladder",
	drawtype = "signlike",
	tiles = {"default_ladder.png"},
	inventory_image = "default_ladder.png",
	wield_image = "default_ladder.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {choppy = 2, oddly_breakable_by_hand = 3, flammable = 2},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

default.register_fence("default:fence_wood", {
	description = "Wooden Fence",
	texture = "default_wood.png",
	material = "default:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

default.register_fence("default:fence_acacia_wood", {
	description = "Acacia Fence",
	texture = "default_acaciawood.png",
	material = "default:acacia_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

default.register_fence("default:fence_junglewood", {
	description = "Junglewood Fence",
	texture = "default_junglewood.png",
	material = "default:junglewood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

default.register_fence("default:fence_pine_wood", {
	description = "Pine Fence",
	texture = "default_planks_birch.png",
	material = "default:pine_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

default.register_fence("default:fence_aspen_wood", {
	description = "Aspen Fence",
	texture = "default_planks_birch.png",
	material = "default:aspen_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	stack_max = 64,
})

--local fencedefault_texture = "default_fence_overlay.png^default_nitherbrick.png^default_fence_overlay.png^[makealpha:255,126,126"
minetest.register_node("default:fence_nither", {
	description = "Nitherbrick Fence",
	drawtype = "fencelike",
	tiles = {"default_nitherbrick.png"},
	--inventory_image = fencedefault_texture,
	inventory_image =  "default_fence_overlay.png^default_nitherbrick.png^default_fence_overlay.png^[makealpha:255,126,126",
	--wield_image = fencedefault_texture,
	wield_image =  "default_fence_overlay.png^default_nitherbrick.png^default_fence_overlay.png^[makealpha:255,126,126",
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
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})

minetest.register_node("default:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	stack_max = 64,
})

minetest.register_node("default:obsidian_glass", {
	description = "Obsidian Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	stack_max = 64,
})




minetest.register_node("default:brick", {
	description = "Brick Block",
	tiles = {"default_brick.png"},
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 64,
})


minetest.register_node("default:meselamp", {
	description = "Mese Lamp",
	drawtype = "glasslike",
	tiles = {"default_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
	stack_max = 64,
})


--For nssm spawning dragon
minetest.register_node("default:dragon_block", {
	description = "Dragon Block -Use for spawning Mese Dragon",
	drawtype = "glasslike",
	tiles = {"default_dragon_block.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
	stack_max = 64,
})
--
-- Misc
--

minetest.register_node("default:cloud", {
	description = "Cloud",
	tiles = {"default_cloud.png"},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
	groups = {not_in_creative_inventory = 1},
})

minetest.register_node("default:void", {
	description = "Void (you hacker you!)",
	inventory_image = "mcl_core_void.png",
	wield_image = "mcl_core_void.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	air_equivalent = true,
	drop = "",
	groups = {not_in_creative_inventory=1},
})

-- Minetest 0.4 Mod: default



local default_AMBIENT = 4

minetest.register_node("default:dummy", {
	description = "Air (you hacker you!)",
	inventory_image = "unknown_node.png",
	wield_image = "unknown_node.png",
	drawtype = "airlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	air_equivalent = true,
	drop = "",
	groups = {not_in_creative_inventory=1},
})

minetest.register_node("default:rack", {
	description = "Rack",
	tiles = {"default_rack.png"},
	is_ground_content = true,
	--drop = {
	--	max_items = 1,
	--	items = {{
	--		rarity = 3,
	--		items = {"default:rack"},
	--	}}
	--},
	light_source = default_AMBIENT,
	groups = {cracky=3,level=0},
	stack_max = 64,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:slowsand", {
	description = "Slow Sand",
	tiles = {"default_slowsand.png"},
	is_ground_content = true,
	light_source = default_AMBIENT,
	groups = {crumbly=1,level=2,nether =1},
	stack_max = 64,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name="default_gravel_footstep", gain=0.45},
	}),
})

minetest.register_node("default:glowstone", {
	description = "Glowstone",
	tiles = {"default_glowstone.png"},
	is_ground_content = true,
	light_source = 14,
	stack_max = 64,
	drop = {
		items = {
			{items = {'default:glowstone_dust'}},
			{items = {'default:glowstone_dust'}},
			{items = {'default:glowstone_dust'},rarity=2},
			{items = {'default:glowstone_dust'},rarity=0},
		}
	},
	--groups = {dig=default.dig.glowstone},
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("default:nitherbrick", {
	description = "Nither Brick",
	tiles = {"default_nitherbrick.png"},
	groups = {cracky=2,level=2},
	stack_max = 64,
	--light_source = default_AMBIENT-2,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:rack_with_diamond", {
	description = "Diamond Ore",
	tiles = {"default_rack.png^default_mineral_diamond.png"},
	groups = {cracky = 1},
	drop = "default:diamond",
	light_source = 10,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("default:wart", {
	description = "Wart",
	drawtype = "plantlike",
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	tiles = {"default_wart.png^[colorize:#FF0000:150"},
	groups = {cracky = 1},
	drop = "default:wart",
	light_source = 4,
	groups = {snappy = 3, attached_node = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.4},
	}),
	stack_max = 64,
})
-- wart spread and death
minetest.register_abm({
	nodenames = {"default:wart"},
	interval = 10,
	chance = 20,
	action = function(pos, node)
		if minetest.get_node_light(pos, nil) == 15 then
			minetest.remove_node(pos)
		end
		local random = {
			x = pos.x + math.random(-2,2),
			y = pos.y + math.random(-1,1),
			z = pos.z + math.random(-2,2)
		}
		local random_node = minetest.get_node_or_nil(random)
		if not random_node then
			return
		end
		if random_node.name ~= "air" then
			return
		end
		local node_under = minetest.get_node_or_nil({x = random.x,
			y = random.y - 1, z = random.z})
		if not node_under then
			return
		end
		if minetest.get_item_group(node_under.name, "nether") ~= 0 and
				minetest.get_node_light(pos, nil) <= 7 and
				minetest.get_node_light(random, nil) <= 11 then
			minetest.set_node(random, {name = node.name})
		end
	end
})


--Quartz
-- Set this to true to allow usage of the stairsplus mod in moreblocks

enable_stairsplus = true

-- This enables the old horizontal pillar block(deprecated, be sure to convert them back to normal pillars)

enable_horizontal_pillar = true




--Ore
minetest.register_node("default:quartz_ore", {
         description = "Quartz Ore",
 	 tiles = {"default_rack.png^quartz_ore.png"},
	 groups = {cracky=3, stone=1},
	 stack_max = 64,
	 drop = 'default:quartz_crystal',
	 light_source = 6,  --light_source = NETHER_AMBIENT,
         sounds = default.node_sound_stone_defaults(),
})


--Quartz Block
minetest.register_node("default:quartz_block", {
	description = "Quartz Block",
	tiles = {"quartz_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	stack_max = 64,
	sounds = default.node_sound_glass_defaults(),
})

--Chiseled Quartz
minetest.register_node("default:quartz_chiseled", {
	description = "Chiseled Quartz",
	tiles = {"quartz_chiseled.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	stack_max = 64,
	sounds = default.node_sound_glass_defaults(),
})

--Quartz Pillar
minetest.register_node("default:quartz_pillar", {
	description = "Quartz Pillar",
	paramtype2 = "facedir",
	tiles = {"quartz_pillar_top.png", "quartz_pillar_top.png", "quartz_pillar_side.png"},
	stack_max = 64,
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
	on_place = minetest.rotate_node
})


--abms
local dirs2 = { 12, 9, 18, 7, 12 }

minetest.register_abm({
	nodenames = { "default:quartz_pillar_horizontal" },
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local fdir = node.param2 or 0
			nfdir = dirs2[fdir+1]
		minetest.add_node(pos, {name = "default:quartz_pillar", param2 = nfdir})
	end,
})

--These are deprecated, don't use them

if enable_horizontal_pillar then
	--Quartz Pillar (horizontal)
	minetest.register_node("default:quartz_pillar_horizontal", {
			description = "Quartz Pillar Horizontal",
			tiles = {"quartz_pillar_side.png", "quartz_pillar_side.png", "quartz_pillar_side.png^[transformR90",
			"quartz_pillar_side.png^[transformR90", "quartz_pillar_top.png", "quartz_pillar_top.png"},
			paramtype2 = "facedir",
			drop = 'default:quartz_pillar',
			groups = {cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
			sounds = default.node_sound_glass_defaults(),
	})
end


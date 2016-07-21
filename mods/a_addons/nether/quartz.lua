dofile(minetest.get_modpath("nether").."/settings.txt")

--alias to remove old quartz from maps
minetest.register_alias("quartz:quartz_crystal", "nether:quartz_crystal")
minetest.register_alias("quartz:quartz_ore", "nether:quartz_ore")
minetest.register_alias("quartz:block", "nether:block")
minetest.register_alias("quartz:chiseled", "nether:chiseled")
minetest.register_alias("quartz:pillar", "nether:pillar")
minetest.register_alias("quartz:pillar_horizontal", "nether:pillar_horizontal")
minetest.register_alias("quartz:pillar_horizontal", "nether:pillar_horizontal")




--Node Registration

--Quartz Crystal
minetest.register_craftitem("nether:quartz_crystal", {
	description = "Quartz Crystal",
	inventory_image = "quartz_crystal_full.png",
	stack_max = 64,
})
minetest.register_craftitem("nether:quartz_crystal_piece", {
	description = "Quartz Crystal Piece",
	inventory_image = "quartz_crystal_piece.png",
	stack_max = 64,
})

--Ore
minetest.register_node("nether:quartz_ore", {
         description = "Quartz Ore",
 	 tiles = {"nether_rack.png^quartz_ore.png"},
	 groups = {cracky=3, stone=1},
	 stack_max = 64,
	 drop = 'nether:quartz_crystal',
	 light_source = 6,  --light_source = NETHER_AMBIENT,
         sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
    ore_type       = "scatter",
    ore            = "nether:quartz_ore",
    --wherein        = "nether:rack",
    wherein        = {"nether:rack","default:stone"},
    clust_scarcity = 10*10*10,
    clust_num_ores = 6,
    clust_size     = 5,
    height_min     = -31000,
    height_max     = -2000,
    --height_max     = NETHER_DEPTH,
})

--Quartz Block
minetest.register_node("nether:block", {
	description = "Quartz Block",
	tiles = {"quartz_block.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	stack_max = 64,
	sounds = default.node_sound_glass_defaults(),
})

--Chiseled Quartz
minetest.register_node("nether:chiseled", {
	description = "Chiseled Quartz",
	tiles = {"quartz_chiseled.png"},
	groups = {cracky=3, oddly_breakable_by_hand=1},
	stack_max = 64,
	sounds = default.node_sound_glass_defaults(),
})

--Quartz Pillar
minetest.register_node("nether:pillar", {
	description = "Quartz Pillar",
	paramtype2 = "facedir",
	tiles = {"quartz_pillar_top.png", "quartz_pillar_top.png", "quartz_pillar_side.png"},
	stack_max = 64,
	groups = {cracky=3, oddly_breakable_by_hand=1},
	sounds = default.node_sound_glass_defaults(),
	on_place = minetest.rotate_node
})


--Stairs & Slabs
stairs.register_stair_and_slab("netherblock", "nether:block",
		{cracky=3, oddly_breakable_by_hand=1},
		
		{"quartz_block.png"},
		"Quartz stair",
		"Quartz slab",
		default.node_sound_glass_defaults())

stairs.register_slab("netherstair", "nether:pillar",
		{cracky=3, oddly_breakable_by_hand=1},
		
		{"quartz_pillar_top.png", "quartz_pillar_top.png", "quartz_pillar_side.png"},
		"Quartz Pillar stair",
		"Quartz Pillar slab",
		default.node_sound_glass_defaults())







--Crafting

--Quartz Crystal Piece
minetest.register_craft({
	output = '"nether:quartz_crystal_piece" 3',
	recipe = {
		{'nether:quartz_crystal'}
	}
})

--Quartz Block
minetest.register_craft({
	output = '"nether:block" 4',
	recipe = {
		{'nether:quartz_crystal', 'nether:quartz_crystal', ''},
		{'nether:quartz_crystal', 'nether:quartz_crystal', ''},
		{'', '', ''}
	}
})

--Chiseled Quartz
minetest.register_craft({
	output = 'nether:chiseled 2',
	recipe = {
		{'stairs:slab_quartzblock', '', ''},
		{'stairs:slab_quartzblock', '', ''},
		{'', '', ''},
	}
})

--Chiseled Quartz(for stairsplus)
minetest.register_craft({
	output = 'nether:chiseled 2',
	recipe = {
		{'nether:slab_block', '', ''},
		{'nether:slab_block', '', ''},
		{'', '', ''},
	}
})

--Quartz Pillar
minetest.register_craft({
	output = 'nether:pillar 2',
	recipe = {
		{'nether:block', '', ''},
		{'nether:block', '', ''},
		{'', '', ''},
	}
})

--abms
local dirs2 = { 12, 9, 18, 7, 12 }

minetest.register_abm({
	nodenames = { "nether:pillar_horizontal" },
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local fdir = node.param2 or 0
			nfdir = dirs2[fdir+1]
		minetest.add_node(pos, {name = "nether:pillar", param2 = nfdir})
	end,
})

--These are deprecated, don't use them

if enable_horizontal_pillar then
	--Quartz Pillar (horizontal)
	minetest.register_node("nether:pillar_horizontal", {
			description = "Quartz Pillar Horizontal",
			tiles = {"quartz_pillar_side.png", "quartz_pillar_side.png", "quartz_pillar_side.png^[transformR90",
			"quartz_pillar_side.png^[transformR90", "quartz_pillar_top.png", "quartz_pillar_top.png"},
			paramtype2 = "facedir",
			drop = 'nether:pillar',
			groups = {cracky=3, oddly_breakable_by_hand=1, not_in_creative_inventory=1},
			sounds = default.node_sound_glass_defaults(),
	})
end


--Compatibility with stairsplus

if minetest.get_modpath("moreblocks") and enable_stairsplus then
	register_stair_slab_panel_micro("quartz", "block", "nether:block",
	{cracky=3},
	
	{"quartz_block.png"},
	"Quartz Block",
	"block",
	0)

	register_stair_slab_panel_micro("quartz", "chiseled", "nether:chiseled",
	{cracky=3},
	
	{"quartz_chiseled.png"},
	"Chiseled Quartz",
	"chiseled",
	0)

	register_stair_slab_panel_micro("quartz", "pillar", "nether:pillar",
	{cracky=3},
	
	{"quartz_pillar_top.png", "quartz_pillar_top.png", "quartz_pillar_side.png"},
	"Quartz Pillar",
	"pillar",
	0)

	table.insert(circular_saw.known_stairs, "nether:block")
	table.insert(circular_saw.known_stairs, "nether:chiseled")
	table.insert(circular_saw.known_stairs, "nether:pillar")
end

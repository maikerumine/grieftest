-- mods/default/crafting.lua
minetest.register_craft({
	output = "default:flint_and_steel",
	recipe = {
		{"default:flint", "default:steel_ingot"}
	}
})

minetest.register_craft({
	output = 'default:wood 4',
	recipe = {
		{'default:tree'},
	}
})

minetest.register_craft({
	output = 'default:junglewood 4',
	recipe = {
		{'default:jungletree'},
	}
})

minetest.register_craft({
	output = 'default:pine_wood 4',
	recipe = {
		{'default:pine_tree'},
	}
})

minetest.register_craft({
	output = 'default:acacia_wood 4',
	recipe = {
		{'default:acacia_tree'},
	}
})

minetest.register_craft({
	output = 'default:aspen_wood 4',
	recipe = {
		{'default:aspen_tree'},
	}
})

minetest.register_craft({
	output = 'default:stick 4',
	recipe = {
		{'group:wood'},
		{'group:wood'},
	}
})

minetest.register_craft({
	output = 'default:stick 1',
	recipe = {
		{'group:leaves'},
		{'group:leaves'},
		{'group:leaves'},
	}
})

minetest.register_craft({
	output = 'default:sign_wall_wood 2',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:torch 4',
	recipe = {
		{'default:coal_lump'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:pick_wood',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_stone',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_steel',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_gold',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:pick_diamond',
	recipe = {
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:shovel_wood',
	recipe = {
		{'group:wood'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:shovel_stone',
	recipe = {
		{'group:stone'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:shovel_steel',
	recipe = {
		{'default:steel_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:shovel_gold',
	recipe = {
		{'default:gold_ingot'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:shovel_diamond',
	recipe = {
		{'default:diamond'},
		{'group:stick'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:wood', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stone', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_steel',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_gold',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_diamond',
	recipe = {
		{'default:diamond', 'default:diamond'},
		{'default:diamond', 'group:stick'},
		{'', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:axe_wood',
	recipe = {
		{'group:wood', 'group:wood'},
		{'group:stick', 'group:wood'},
		{'group:stick',''},
	}
})

minetest.register_craft({
	output = 'default:axe_stone',
	recipe = {
		{'group:stone', 'group:stone'},
		{'group:stick', 'group:stone'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:axe_steel',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot'},
		{'group:stick', 'default:steel_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:axe_gold',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot'},
		{'group:stick', 'default:gold_ingot'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:axe_diamond',
	recipe = {
		{'default:diamond', 'default:diamond'},
		{'group:stick', 'default:diamond'},
		{'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:sword_wood',
	recipe = {
		{'group:wood'},
		{'group:wood'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:sword_stone',
	recipe = {
		{'group:stone'},
		{'group:stone'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:sword_steel',
	recipe = {
		{'default:steel_ingot'},
		{'default:steel_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:sword_gold',
	recipe = {
		{'default:gold_ingot'},
		{'default:gold_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:sword_diamond',
	recipe = {
		{'default:diamond'},
		{'default:diamond'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:furnace',
	recipe = {
		{'group:stone', 'group:stone', 'group:stone'},
		{'group:stone', '', 'group:stone'},
		{'group:stone', 'group:stone', 'group:stone'},
	}
})

minetest.register_craft({
	output = 'default:coalblock',
	recipe = {
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
		{'default:coal_lump', 'default:coal_lump', 'default:coal_lump'},
	}
})

minetest.register_craft({
	output = 'default:coal_lump 9',
	recipe = {
		{'default:coalblock'},
	}
})

minetest.register_craft({
	output = 'default:steelblock',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'default:steel_ingot 9',
	recipe = {
		{'default:steelblock'},
	}
})

minetest.register_craft({
	output = "default:gold_nugget 9",
	recipe = {{"default:gold_ingot"}},
})

minetest.register_craft({
	output = "default:iron_nugget 9",
	recipe = {{"default:iron_ingot"}},
})

minetest.register_craft({
	output = "default:gold_ingot",
	recipe = {
		{"default:gold_nugget", "default:gold_nugget", "default:gold_nugget"},
		{"default:gold_nugget", "default:gold_nugget", "default:gold_nugget"},
		{"default:gold_nugget", "default:gold_nugget", "default:gold_nugget"},
	}
})

minetest.register_craft({
	output = "default:iron_ingot",
	recipe = {
		{"default:iron_nugget", "default:iron_nugget", "default:iron_nugget"},
		{"default:iron_nugget", "default:iron_nugget", "default:iron_nugget"},
		{"default:iron_nugget", "default:iron_nugget", "default:iron_nugget"},
	}
})



minetest.register_craft({
	output = 'default:goldblock',
	recipe = {
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
		{'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
	}
})

minetest.register_craft({
	output = 'default:gold_ingot 9',
	recipe = {
		{'default:goldblock'},
	}
})

minetest.register_craft({
	output = 'default:diamondblock',
	recipe = {
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
		{'default:diamond', 'default:diamond', 'default:diamond'},
	}
})

minetest.register_craft({
	output = 'default:diamond 9',
	recipe = {
		{'default:diamondblock'},
	}
})

--emerald
minetest.register_craft({
	output = 'default:emeraldblock',
	recipe = {
		{'default:emerald_crystal', 'default:emerald_crystal', 'default:emerald_crystal'},
		{'default:emerald_crystal', 'default:emerald_crystal', 'default:emerald_crystal'},
		{'default:emerald_crystal', 'default:emerald_crystal', 'default:emerald_crystal'},
	}
})
minetest.register_craft({
	output = 'default:emeraldblock 2',
	recipe = {
		{'stairs:stair_Emerald', 'stairs:stair_Emerald', 'stairs:stair_Emerald'},
	}
})
minetest.register_craft({
	output = 'default:emerald_crystal 9',
	recipe = {
		{'default:emeraldblock'},
	}
})



minetest.register_craft({
	output = 'default:sandstone',
	recipe = {
		{'group:sand', 'group:sand'},
		{'group:sand', 'group:sand'},
	}
})

minetest.register_craft({
	output = 'default:sand 4',
	recipe = {
		{'default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:sandstonebrick 4',
	recipe = {
		{'default:sandstone', 'default:sandstone'},
		{'default:sandstone', 'default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:sandstone_block 9',
	recipe = {
		{'default:sandstone', 'default:sandstone', 'default:sandstone'},
		{'default:sandstone', 'default:sandstone', 'default:sandstone'},
		{'default:sandstone', 'default:sandstone', 'default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:clay',
	recipe = {
		{'default:clay_lump', 'default:clay_lump'},
		{'default:clay_lump', 'default:clay_lump'},
	}
})

minetest.register_craft({
	output = 'default:clay_lump 4',
	recipe = {
		{'default:clay'},
	}
})

minetest.register_craft({
	output = 'default:brick',
	recipe = {
		{'default:clay_brick', 'default:clay_brick'},
		{'default:clay_brick', 'default:clay_brick'},
	}
})

minetest.register_craft({
	output = 'default:clay_brick 4',
	recipe = {
		{'default:brick'},
	}
})


minetest.register_craft({
	output = "default:bowl 4",
	recipe = {
		{"group:wood", "", "group:wood"},
		{"", "group:wood", ""},
	}
})

minetest.register_craft({
	output = 'default:paper',
	recipe = {
		{'default:papyrus', 'default:papyrus', 'default:papyrus'},
	}
})

minetest.register_craft({
	output = 'default:book',
	recipe = {
		{'default:paper'},
		{'default:paper'},
		{'default:paper'},
	}
})

minetest.register_craft({
	output = 'default:bookshelf',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'default:book', 'default:book', 'default:book'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'default:ladder_wood 3',
	recipe = {
		{'group:stick', '', 'group:stick'},
		{'group:stick', 'group:stick', 'group:stick'},
		{'group:stick', '', 'group:stick'},
	}
})

minetest.register_craft({
	output = 'default:mese',
	recipe = {
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
		{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'default:mese_crystal',
	recipe = {
		{'default:mese_crystal_fragment', 'default:mese_crystal_fragment', 'default:mese_crystal_fragment'},
		{'default:mese_crystal_fragment', 'default:mese_crystal_fragment', 'default:mese_crystal_fragment'},
		{'default:mese_crystal_fragment', 'default:mese_crystal_fragment', 'default:mese_crystal_fragment'},
	}
})

minetest.register_craft({
	output = 'default:mese_crystal 9',
	recipe = {
		{'default:mese'},
	}
})

minetest.register_craft({
	output = 'default:mese_crystal_fragment 9',
	recipe = {
		{'default:mese_crystal'},
	}
})

minetest.register_craft({
	output = 'default:meselamp 1',
	recipe = {
		{'', 'default:mese_crystal_fragment',''},
		{'default:mese_crystal_fragment', 'default:glass', 'default:mese_crystal_fragment'},
	}
})

minetest.register_craft({
	output = 'default:obsidian_shard 9',
	recipe = {
		{'default:obsidian'}
	}
})

minetest.register_craft({
	output = 'default:obsidian',
	recipe = {
		{'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard'},
		{'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard'},
		{'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard'},
	}
})

minetest.register_craft({
	output = 'default:obsidianbrick 4',
	recipe = {
		{'default:obsidian', 'default:obsidian'},
		{'default:obsidian', 'default:obsidian'}
	}
})

minetest.register_craft({
	output = 'default:obsidian_block 9',
	recipe = {
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
	}
})

minetest.register_craft({
	output = 'default:stonebrick 4',
	recipe = {
		{'default:stone', 'default:stone'},
		{'default:stone', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'default:stone_block 9',
	recipe = {
		{'default:stone', 'default:stone', 'default:stone'},
		{'default:stone', 'default:stone', 'default:stone'},
		{'default:stone', 'default:stone', 'default:stone'},
	}
})

minetest.register_craft({
	output = 'default:desert_stonebrick 4',
	recipe = {
		{'default:desert_stone', 'default:desert_stone'},
		{'default:desert_stone', 'default:desert_stone'},
	}
})

minetest.register_craft({
	output = 'default:desert_stone_block 9',
	recipe = {
		{'default:desert_stone', 'default:desert_stone', 'default:desert_stone'},
		{'default:desert_stone', 'default:desert_stone', 'default:desert_stone'},
		{'default:desert_stone', 'default:desert_stone', 'default:desert_stone'},
	}
})

minetest.register_craft({
	output = 'default:snowblock',
	recipe = {
		{'default:snow', 'default:snow', 'default:snow'},
		{'default:snow', 'default:snow', 'default:snow'},
		{'default:snow', 'default:snow', 'default:snow'},
	}
})

minetest.register_craft({
	output = 'default:snow 9',
	recipe = {
		{'default:snowblock'},
	}
})

--
-- Crafting (tool repair)
--
minetest.register_craft({
	type = "toolrepair",
	additional_wear = -0.02,
})

minetest.register_craft({
	output = 'default:stick 1',
	recipe = {
		{'default:shovel_wood'},
	}
})
minetest.register_craft({
	output = 'default:stick 1',
	recipe = {
		{'default:shovel_stone'},
	}
})
minetest.register_craft({
	output = 'default:stick 1',
	recipe = {
		{'default:shovel_steel'},
	}
})
minetest.register_craft({
	output = 'default:stick 1',
	recipe = {
		{'default:shovel_diamond'},
	}
})
--
-- Cooking recipes
--

--Charcoal
minetest.register_craft({
	type = "cooking",
	output = "default:charcoal",
	recipe = "group:tree",
})


minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "group:sand",
})

minetest.register_craft({
	type = "cooking",
	output = "default:obsidian_glass",
	recipe = "default:obsidian_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:stone",
	recipe = "default:mossycobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:desert_stone",
	recipe = "default:desert_cobble",
})

minetest.register_craft({
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "default:stone_with_iron",
})

minetest.register_craft({
	type = "cooking",
	output = "default:gold_ingot",
	recipe = "default:gold_lump",
})

minetest.register_craft({
	type = "cooking",
	output = "default:clay_nitherbrick",
	recipe = "default:clay_lump",
})

--
-- Fuels
--

minetest.register_craft({
	type = "fuel",
	recipe = "group:tree",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:junglegrass",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:leaves",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:cactus",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:papyrus",
	burntime = 1,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:bookshelf",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_wood",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_acacia_wood",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_junglewood",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_pine_wood",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:fence_aspen_wood",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:ladder_wood",
	burntime = 5,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:wood",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:lava_source",
	burntime = 60,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:torch",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:sign_wall_wood",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:chest",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:chest_locked",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "group:sapling",
	burntime = 10,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:apple",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coal_lump",
	burntime = 40,
})

--Charcoal :)
minetest.register_craft({
	type = "fuel",
	recipe = "default:charcoal",
	burntime = 50,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:coalblock",
	burntime = 370,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:grass_1",
	burntime = 2,
})

minetest.register_craft({
	type = "fuel",
	recipe = "default:dry_grass_1",
	burntime = 2,
})

minetest.register_craft({
	output = 'default:dragon_block',
	recipe = {
		{'mobs_mc:skeleton2_head', 'mobs_mc:skeleton2_head', 'mobs_mc:skeleton2_head'},
		{'', 'default:slowsand', ''},
		{'', 'default:slowsand', ''},
	}
})





-- Minetest 0.4 Mod: default

minetest.register_craftitem("default:glowstone_dust", {
	description = "Glowstone Dust",
	inventory_image = "default_glowstone_dust.png",
	stack_max = 64,
})

minetest.register_craft{
	output = "default:glowstone",
	recipe = {
		{"default:glowstone_dust", "default:glowstone_dust"},
		{"default:glowstone_dust", "default:glowstone_dust"},
	}
}


minetest.register_craft({
	output = 'default:fence_nither 6',
	recipe = {
		{'default:nitherbrick', 'default:nitherbrick', 'default:nitherbrick'},
		{'default:nitherbrick', 'default:nitherbrick', 'default:nitherbrick'},
	}
})




-- Crafting / Cooking
minetest.register_craft({
	type = "cooking",
	output = "default:nitherbrick",
	recipe = "default:rack",
})



--Quartz


--Crafting

--Quartz Crystal Piece
minetest.register_craft({
	output = '"default:quartz_crystal_piece" 3',
	recipe = {
		{'default:quartz_crystal'}
	}
})

--Quartz Block
minetest.register_craft({
	output = '"default:block" 4',
	recipe = {
		{'default:quartz_crystal', 'default:quartz_crystal', ''},
		{'default:quartz_crystal', 'default:quartz_crystal', ''},
		{'', '', ''}
	}
})

--Chiseled Quartz
minetest.register_craft({
	output = 'default:chiseled 2',
	recipe = {
		{'stairs:slab_quartzblock', '', ''},
		{'stairs:slab_quartzblock', '', ''},
		{'', '', ''},
	}
})

--Chiseled Quartz(for stairsplus)
minetest.register_craft({
	output = 'default:chiseled 2',
	recipe = {
		{'default:slab_block', '', ''},
		{'default:slab_block', '', ''},
		{'', '', ''},
	}
})

--Quartz Pillar
minetest.register_craft({
	output = 'default:pillar 2',
	recipe = {
		{'default:block', '', ''},
		{'default:block', '', ''},
		{'', '', ''},
	}
})


--MC2 Crafts

-- Crafting / Cooking
minetest.register_craft({
	type = "cooking",
	output = "default:stonebrickcracked",
	recipe = "default:stonebrick",
})

minetest.register_craft({
	type = 'shapeless',
	output = 'bonemeal:bone 9',
	recipe = { 'default:fossil' },
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:fossil',
	recipe = { 'bonemeal:bone 9' },
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:mossycobble',
	recipe = { 'default:cobble', 'vines:vines' },
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:stonebrickcarved',
	recipe = { 'stairs:slab_stonebrick', 'stairs:slab_stonebrick' },
})

minetest.register_craft({
	type = 'shapeless',
	output = 'default:stonebrickmossy',
	recipe = { 'default:stonebrick', 'vines:vines' },
})

minetest.register_craft({
	output = 'default:coarse_dirt 4',
	recipe = {
		{'default:dirt', 'default:gravel'},
		{'default:gravel', 'default:dirt'},
	}
})
minetest.register_craft({
	output = 'default:coarse_dirt 4',
	recipe = {
		{'default:gravel', 'default:dirt'},
		{'default:dirt', 'default:gravel'},
	}
})

minetest.register_craft({
	output = 'default:sandstonesmooth 4',
	recipe = {
		{'default:sandstone','default:sandstone'},
		{'default:sandstone','default:sandstone'},
	}
})

minetest.register_craft({
	output = 'default:redsandstonesmooth 4',
	recipe = {
		{'default:redsandstone','default:redsandstone'},
		{'default:redsandstone','default:redsandstone'},
	}
})

minetest.register_craft({
	output = 'default:granite_smooth 4',
	recipe = {
		{'default:granite', 'default:granite'},
		{'default:granite', 'default:granite'}
	},
})

minetest.register_craft({
	output = 'default:andesite_smooth 4',
	recipe = {
		{'default:andesite', 'default:andesite'},
		{'default:andesite', 'default:andesite'}
	},
})

minetest.register_craft({
	output = 'default:diorite_smooth 4',
	recipe = {
		{'default:diorite', 'default:diorite'},
		{'default:diorite', 'default:diorite'}
	},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:granite',
	recipe = {'default:diorite', 'default:quartz_crystal'},
})

minetest.register_craft({
	type = "shapeless",
	output = 'default:andesite 2',
	recipe = {'default:diorite', 'default:cobble'},
})

minetest.register_craft({
	output = 'default:diorite 2',
	recipe = {
		{'default:cobble', 'default:quartz_crystal'},
		{'default:quartz_crystal', 'default:cobble'},
	}
})
minetest.register_craft({
	output = 'default:diorite 2',
	recipe = {
		{'default:quartz_crystal', 'default:cobble'},
		{'default:cobble', 'default:quartz_crystal'},
	}
})
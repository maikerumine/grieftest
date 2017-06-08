-- mods/default/aliases.lua

-- Aliases to support loading worlds using nodes following the old naming convention
-- These can also be helpful when using chat commands, for example /giveme

minetest.register_alias("stone", "default:stone")
minetest.register_alias("stone_with_coal", "default:stone_with_coal")
minetest.register_alias("stone_with_iron", "default:stone_with_iron")
minetest.register_alias("dirt_with_grass", "default:dirt_with_grass")
minetest.register_alias("dirt_with_grass_footsteps", "default:dirt_with_grass_footsteps")
minetest.register_alias("dirt", "default:dirt")
minetest.register_alias("sand", "default:sand")
minetest.register_alias("gravel", "default:gravel")
minetest.register_alias("sandstone", "default:sandstone")
minetest.register_alias("clay", "default:clay")
minetest.register_alias("brick", "default:brick")
minetest.register_alias("tree", "default:tree")
minetest.register_alias("jungletree", "default:jungletree")
minetest.register_alias("junglegrass", "default:junglegrass")
minetest.register_alias("leaves", "default:leaves")
minetest.register_alias("cactus", "default:cactus")
minetest.register_alias("papyrus", "default:papyrus")
minetest.register_alias("bookshelf", "default:bookshelf")
minetest.register_alias("glass", "default:glass")
minetest.register_alias("wooden_fence", "default:fence_wood")
minetest.register_alias("rail", "default:rail")
minetest.register_alias("ladder", "default:ladder_wood")
minetest.register_alias("wood", "default:wood")
minetest.register_alias("mese", "default:mese")
minetest.register_alias("cloud", "default:cloud")
minetest.register_alias("water_flowing", "default:water_flowing")
minetest.register_alias("water_source", "default:water_source")
minetest.register_alias("lava_flowing", "default:lava_flowing")
minetest.register_alias("lava_source", "default:lava_source")
minetest.register_alias("torch", "default:torch")
minetest.register_alias("sign_wall", "default:sign_wall_wood")
minetest.register_alias("furnace", "default:furnace")
minetest.register_alias("chest", "default:chest")
minetest.register_alias("locked_chest", "default:chest_locked")
minetest.register_alias("cobble", "default:cobble")
minetest.register_alias("mossycobble", "default:mossycobble")
minetest.register_alias("steelblock", "default:steelblock")
minetest.register_alias("nyancat", "default:nyancat")
minetest.register_alias("nyancat_rainbow", "default:nyancat_rainbow")
minetest.register_alias("sapling", "default:sapling")
minetest.register_alias("apple", "default:apple")

minetest.register_alias("WPick", "default:pick_wood")
minetest.register_alias("STPick", "default:pick_stone")
minetest.register_alias("SteelPick", "default:pick_steel")
minetest.register_alias("MesePick", "default:pick_mese")
minetest.register_alias("WShovel", "default:shovel_wood")
minetest.register_alias("STShovel", "default:shovel_stone")
minetest.register_alias("SteelShovel", "default:shovel_steel")
minetest.register_alias("WAxe", "default:axe_wood")
minetest.register_alias("STAxe", "default:axe_stone")
minetest.register_alias("SteelAxe", "default:axe_steel")
minetest.register_alias("WSword", "default:sword_wood")
minetest.register_alias("STSword", "default:sword_stone")
minetest.register_alias("SteelSword", "default:sword_steel")

minetest.register_alias("Stick", "default:stick")
minetest.register_alias("paper", "default:paper")
minetest.register_alias("book", "default:book")
minetest.register_alias("lump_of_coal", "default:coal_lump")
minetest.register_alias("lump_of_iron", "default:iron_lump")
minetest.register_alias("lump_of_clay", "default:clay_lump")
minetest.register_alias("steel_ingot", "default:steel_ingot")
minetest.register_alias("clay_brick", "default:clay_brick")
minetest.register_alias("snow", "default:snow")

-- 'mese_block' was used for a while for the block form of mese
minetest.register_alias("default:mese_block", "default:mese")

-- Aliases for corrected pine node names
minetest.register_alias("default:pinetree", "default:pine_tree")
minetest.register_alias("default:pinewood", "default:pine_wood")

minetest.register_alias("default:ladder", "default:ladder_wood")
minetest.register_alias("default:sign_wall", "default:sign_wall_wood")

--alias for es stuff and misc
minetest.register_alias("esmobs:bones", "default:chest")
minetest.register_alias("es:emerald_crystal", "default:emerald_crystal")
minetest.register_alias("tsm_mines:dummy", "default:dummy")
minetest.register_alias("vines:shears", "mobs:shears")

--alias to remove old quartz from maps
minetest.register_alias("quartz:quartz_crystal", "default:quartz_crystal")
minetest.register_alias("quartz:quartz_ore", "default:quartz_ore")
minetest.register_alias("quartz:block", "default:quartz_block")
minetest.register_alias("quartz:chiseled", "default:quartz_chiseled")
minetest.register_alias("quartz:pillar", "default:quartz_pillar")
minetest.register_alias("quartz:pillar_horizontal", "default:quartz_pillar_horizontal")

--alias to merge nether to default
minetest.register_alias("nether:rack", "default:rack")
minetest.register_alias("nether:quartz_ore", "default:quartz_ore")
minetest.register_alias("nether:quartz_crystal", "default:quartz_crystal")
minetest.register_alias("nether:brick", "default:nitherbrick")
minetest.register_alias("nether:glowstone", "default:glowstone")
minetest.register_alias("nether:glowstone_dust", "default:glowstone_dust")
minetest.register_alias("nether:rack_with_diamond", "default:rack_with_diamond")
minetest.register_alias("nether:sand", "default:slowsand")
minetest.register_alias("nether:fence", "default:fence_nither")
minetest.register_alias("nether:particle", "default:particle")
minetest.register_alias("nether:portal", "default:portal")

--Fire
--minetest.register_alias("nether:permanent_flame", "fire:permanent_flame")
minetest.register_alias("nether:permanent_flame", "default:underground_fire")
minetest.register_alias("fire:permanent_flame", "default:underground_fire")
minetest.register_alias("fire:basic_flame", "default:basic_flame")
minetest.register_alias("fire:flint_and_steel", "default:flint_and_steel")

--MC2 Andisite, granite, diorite
minetest.register_alias("default:marble", "default:andesite")
minetest.register_alias("stairs:slab_marble", "stairs:slab_andesite")
minetest.register_alias("default:marble_bricks", "default:andesite_smooth")
minetest.register_alias("stairs:slab_marble_bricks", "stairs:slab_andesite_smooth")
minetest.register_alias("stairs:stair_marble_bricks", "stairs:stair_andesite_smooth")
minetest.register_alias("default:granite_bricks", "default:granite_smooth")
minetest.register_alias("stairs:slab_granite_bricks", "stairs:slab_granite_smooth")
minetest.register_alias("stairs:stair_granite_bricks", "stairs:stair_granite_smooth")

--MC2 jukebox
minetest.register_alias("jdukebox:box", "mcl_jukebox:jukebox")
minetest.register_alias("jdukebox:disc_1", "mcl_jukebox:record_1")
minetest.register_alias("jdukebox:disc_2", "mcl_jukebox:record_2")
minetest.register_alias("jdukebox:disc_3", "mcl_jukebox:record_3")
minetest.register_alias("jdukebox:disc_4", "mcl_jukebox:record_4")
minetest.register_alias("jdukebox:disc_5", "mcl_jukebox:record_5")
minetest.register_alias("jdukebox:disc_6", "mcl_jukebox:record_6")
minetest.register_alias("jdukebox:disc_7", "mcl_jukebox:record_7")
minetest.register_alias("jdukebox:disc_8", "mcl_jukebox:record_8")

--GoldenApple
minetest.register_alias("golden_apple:golden_apple", "default:golden_apple")

--Enderchest
minetest.register_alias("enderchest:enderchest", "mcl_chests:ender_chest")
minetest.register_alias("default:enderchest", "mcl_chests:ender_chest")

--MC2 boats
minetest.register_alias("boats:boat", "mcl_boats:boat_spruce")

--MC2 chests
minetest.register_alias("default:chest", "mcl_chests:chest")

--nssm
minetest.register_alias("nssm:ant_dirt", "default:coarse_dirt")

--armor
minetest.register_alias("3d_armor:helmet_wood", "3d_armor:helmet_leather")
minetest.register_alias("3d_armor:chestplate_wood", "3d_armor:chestplate_leather")
minetest.register_alias("3d_armor:leggings_wood", "3d_armor:leggings_leather")
minetest.register_alias("3d_armor:boots_wood", "3d_armor:boots_leather")

--screwdriver
minetest.register_alias("screwdriver:screwdriver", "default:bowl")

--MC2 beds
minetest.register_alias("beds:fancy_bed", "beds:bed")


--farming oh boy...
--tomato
minetest.register_alias("farming:tomato", "farming:carrot")
minetest.register_alias("farming:tomato_1", "mcl_flowers:tallgrass")
minetest.register_alias("farming:tomato_2", "mcl_flowers:tallgrass")
minetest.register_alias("farming:tomato_3", "mcl_flowers:tallgrass")
minetest.register_alias("farming:tomato_4", "mcl_flowers:tallgrass")
minetest.register_alias("farming:tomato_5", "mcl_flowers:tallgrass")
minetest.register_alias("farming:tomato_6", "mcl_flowers:tallgrass")
minetest.register_alias("farming:tomato_7", "default:apple")
minetest.register_alias("farming:tomato_8", "default:apple")

--cucumber
minetest.register_alias("farming:cucumber", "farming:carrot")
minetest.register_alias("farming:cucumber_1", "mcl_flowers:tallgrass")
minetest.register_alias("farming:cucumber_2", "mcl_flowers:tallgrass")
minetest.register_alias("farming:cucumber_3", "mcl_flowers:tallgrass")
minetest.register_alias("farming:cucumber_4", "mcl_flowers:tallgrass")

--raspberry
minetest.register_alias("farming:raspberries", "farming:carrot")
minetest.register_alias("farming:smoothie_raspberry", "mcl_flowers:tallgrass")
minetest.register_alias("farming:raspberry_1", "mcl_flowers:tallgrass")
minetest.register_alias("farming:raspberry_2", "mcl_flowers:tallgrass")
minetest.register_alias("farming:raspberry_3", "mcl_flowers:tallgrass")
minetest.register_alias("farming:raspberry_4", "mcl_flowers:tallgrass")

--blueberry
minetest.register_alias("farming:blueberries", "farming:carrot")
minetest.register_alias("farming:muffin_blueberry", "farming:bread")
minetest.register_alias("farming:blueberry_1", "mcl_flowers:tallgrass")
minetest.register_alias("farming:blueberry_2", "mcl_flowers:tallgrass")
minetest.register_alias("farming:blueberry_3", "mcl_flowers:tallgrass")
minetest.register_alias("farming:blueberry_4", "mcl_flowers:tallgrass")

--rhubarb
minetest.register_alias("farming:rhubarb", "mcl_flowers:tallgrass")
minetest.register_alias("farming:rhubarb_pie", "mcl_flowers:tallgrass")
minetest.register_alias("farming:rhubarb_1", "mcl_flowers:tallgrass")
minetest.register_alias("farming:rhubarb_2", "mcl_flowers:tallgrass")
minetest.register_alias("farming:rhubarb_3", "mcl_flowers:tallgrass")

--beans
minetest.register_alias("farming:beanpole", "mcl_flowers:tallgrass")
minetest.register_alias("farming:beans", "farming:carrot")
minetest.register_alias("farming:beanbush", "mcl_flowers:tallgrass")
minetest.register_alias("farming:beanpole_1", "mcl_flowers:tallgrass")
minetest.register_alias("farming:beanpole_2", "mcl_flowers:tallgrass")
minetest.register_alias("farming:beanpole_3", "mcl_flowers:tallgrass")
minetest.register_alias("farming:beanpole_4", "mcl_flowers:tallgrass")
minetest.register_alias("farming:beanpole_5", "mcl_flowers:tallgrass")

--grapes
minetest.register_alias("farming:grapes", "farming:carrot")
minetest.register_alias("farming:trellis", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapebush", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapes_1", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapes_2", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapes_3", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapes_4", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapes_5", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapes_6", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapes_7", "mcl_flowers:tallgrass")
minetest.register_alias("farming:grapes_8", "mcl_flowers:tallgrass")

--barley
minetest.register_alias("farming:barley", "mcl_flowers:tallgrass")
minetest.register_alias("farming:barley_1", "farming:seed_wheat")
minetest.register_alias("farming:barley_2", "farming:seed_wheat")
minetest.register_alias("farming:barley_3", "mcl_flowers:tallgrass")
minetest.register_alias("farming:barley_4", "mcl_flowers:tallgrass")
minetest.register_alias("farming:barley_5", "mcl_flowers:tallgrass")
minetest.register_alias("farming:barley_6", "mcl_flowers:tallgrass")
minetest.register_alias("farming:barley_7", "mcl_flowers:tallgrass")
minetest.register_alias("farming:seed_barley", "farming:seed_wheat")

--coffee
minetest.register_alias("farming:coffee", "farming:carrot")
minetest.register_alias("farming:coffee_cup_hot", "farming:carrot")
minetest.register_alias("farming:coffee_cup", "farming:carrot")
minetest.register_alias("farming:drinking_cup", "farming:carrot")
minetest.register_alias("farming:coffee_beans", "farming:carrot")
minetest.register_alias("farming:coffee_1", "mcl_flowers:tallgrass")
minetest.register_alias("farming:coffee_2", "mcl_flowers:tallgrass")
minetest.register_alias("farming:coffee_3", "mcl_flowers:tallgrass")
minetest.register_alias("farming:coffee_4", "mcl_flowers:tallgrass")
minetest.register_alias("farming:coffee_5", "mcl_flowers:tallgrass")


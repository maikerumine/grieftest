--
-- Aliases for map generator outputs
--

minetest.register_alias("mapgen_stone", "default:stone")
minetest.register_alias("mapgen_dirt", "default:dirt")
minetest.register_alias("mapgen_dirt_with_grass", "default:dirt_with_grass")
minetest.register_alias("mapgen_sand", "default:sand")
minetest.register_alias("mapgen_water_source", "default:water_source")
minetest.register_alias("mapgen_river_water_source", "default:river_water_source")
minetest.register_alias("mapgen_lava_source", "default:lava_source")
minetest.register_alias("mapgen_gravel", "default:gravel")
minetest.register_alias("mapgen_desert_stone", "default:desert_stone")
minetest.register_alias("mapgen_desert_sand", "default:desert_sand")
minetest.register_alias("mapgen_dirt_with_snow", "default:dirt_with_snow")
minetest.register_alias("mapgen_snowblock", "default:snowblock")
minetest.register_alias("mapgen_snow", "default:snow")
minetest.register_alias("mapgen_ice", "default:ice")
minetest.register_alias("mapgen_sandstone", "default:sandstone")

-- Flora

minetest.register_alias("mapgen_tree", "default:tree")
minetest.register_alias("mapgen_leaves", "default:leaves")
minetest.register_alias("mapgen_apple", "default:apple")
minetest.register_alias("mapgen_jungletree", "default:jungletree")
minetest.register_alias("mapgen_jungleleaves", "default:jungleleaves")
minetest.register_alias("mapgen_junglegrass", "default:junglegrass")
minetest.register_alias("mapgen_pine_tree", "default:pine_tree")
minetest.register_alias("mapgen_pine_needles", "default:pine_needles")

-- Dungeons

minetest.register_alias("mapgen_cobble", "default:cobble")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_cobble")
minetest.register_alias("mapgen_mossycobble", "default:mossycobble")
minetest.register_alias("mapgen_sandstonebrick", "default:sandstonebrick")
minetest.register_alias("mapgen_stair_sandstonebrick", "stairs:stair_sandstonebrick")

--maikerumine
minetest.register_alias("default:stone_with_copper", "default:stone_with_iron")
minetest.register_alias("default:bedrock", "default:bedrock")


--local NETHER_DEPTH = -3100
--local NETHER_AMBIENT = 7
--local nether_created = false




--
-- Register ores
--

-- All mapgens except singlenode
-- Blob ore first to avoid other ores inside blobs

function default.register_ores()
--liquids
minetest.register_ore({
		ore_type       = "blob",
		ore            = "default:lava_source",
		wherein        = "default:desert_stone",
		clust_scarcity = 15*15*10,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min          = 2,
		y_max          = 1140,
	})

minetest.register_ore({
		ore_type       = "blob",
		ore            = "default:lava_source",
		wherein        = "default:stone",
		clust_scarcity = 25*25*20,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min          = -80,
		y_max          = 1140,
	})

minetest.register_ore({
		ore_type       = "blob",
		ore            = "default:water_source",
		wherein        = "default:stone",
		clust_scarcity = 15*15*10,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min          = 2,
		y_max          = 1140,
	})

--Maikerumine added for nicer looking deserts

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_coal",
		wherein        = "default:desert_stone",
		clust_scarcity = 6 * 6 * 6,
		clust_num_ores = 9,
		clust_size     = 6,
		y_min          = -80,
		y_max          = 200,
	})

	-- Iron
minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:desert_stone_with_iron",
		wherein        = "default:desert_stone",
		clust_scarcity = 6 * 6 * 7,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -80,
		y_max          = 200,
	})


minetest.register_ore({
	ore_type       = "blob",
	ore            = "default:mossycobble",
	wherein        = "default:podzol",
		clust_scarcity = 15*15*15,
		clust_num_ores = 13,
		clust_size     = 8,
	y_min     = 5,
	y_max     = 250,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=150, y=150, z=150}, seed=23, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "default:andesite",
	wherein        = "default:stone",
		clust_scarcity = 15*15*15,
		clust_num_ores = 33,
		clust_size     = 5,
	y_min     = -80,
	y_max     = 50,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=150, y=150, z=150}, seed=23, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "default:diorite",
	wherein        = "default:stone",
		clust_scarcity = 15*15*15,
		clust_num_ores = 33,
		clust_size     = 5,
	y_min     = -80,
	y_max     = 50,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=150, y=150, z=150}, seed=23, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "default:granite",
	wherein        = "default:stone",
		clust_scarcity = 15*15*15,
		clust_num_ores = 33,
		clust_size     = 5,
	y_min     = -80,
	y_max     = 50,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "blob",
	ore            = "default:fossil",
	wherein        = "default:sandstone",
		clust_scarcity = 15*15*15,
		clust_num_ores = 16,
		clust_size     = 12,
	y_min     = -80,
	y_max     = -20,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=230, y=230, z=230}, seed=24, octaves=3, persist=0.70}
})


--DEFAULT STRATA
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:stone",
	wherein        = {"default:desert_stone","default:desert_sand","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 3,
	clust_size     = 4,
	y_min     = 50,
	y_max     = 90,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:clay",
	wherein        = {"default:desert_stone","default:desert_sand","default:stone","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 8,
	y_min     = 24,
	y_max     = 50,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:sandstone",
	wherein        ={"default:desert_stone","default:desert_sand","default:stone","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 10,
	y_min     = 10,
	y_max     = 30,
	noise_threshold = 0.2,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:dirt",
	wherein        = {"default:desert_stone","default:desert_sand","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 4,
	y_min     = -12,
	y_max     = 7,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:gravel",
	wherein        = {"default:desert_stone"},
	clust_scarcity = 1,
	clust_num_ores = 8,
	clust_size     = 4,
	y_min     = 34,
	y_max     = 70,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:coalblock",
	wherein        = {"default:desert_stone","default:stone","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 4,
	y_min     = 60,
	y_max     = 96,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.80}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:desert_sand",
	wherein        = {"default:desert_stone"},
	clust_scarcity = 1,
	clust_num_ores = 8,
	clust_size     = 4,
	y_min     = 44,
	y_max     = 70,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})
	minetest.register_ore({
		ore_type       = "blob",
		ore            = "default:lava_source",
		wherein        = "default:stone",
		clust_scarcity = 15*15*10,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min          = -62,
		y_max          = 2140,
	})

--HARDENED CLAY FOR MESA :)
--maikerumine

--MESA STRATA
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_gray",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 27,
	clust_size     = 1,
	y_min     = 5,
	y_max     = 14,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_black",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores =27,
	clust_size     = 1,
	y_min     = 15,
	y_max     = 17,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70}, 
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_orange",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 27,
	clust_size     = 6,
	y_min     = 20,
	y_max     = 29,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_red",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 8,
	clust_size     = 2,
	y_min     = 34,
	y_max     = 37,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_yellow",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 42,
	y_max     = 43,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_blue",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 43,
	y_max     = 44,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_yellow",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 44,
	y_max     = 45,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_yellow",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 45,
	y_max     = 47,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_light_gray",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	y_min     = 49,
	y_max     = 52,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_yellow",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 4,
	y_min     = 53,
	y_max     = 59,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_white",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	y_min     = 61,
	y_max     = 70,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_purple",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	y_min     = 66,
	y_max     = 75,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:obsidian",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	y_min     = 161,
	y_max     = 170,
	noise_threshold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

--Mooshroom snow
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:coarse_dirt",
	wherein        = {"default:mycelium_snow","default:mycelium","default:stone","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 8,
	y_min     = -24,
	y_max     = 150,
	noise_threshold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

--
-- Coal
--
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 500,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min     = -59,
	y_max     = -12,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 1000,
	clust_num_ores = 6,
	clust_size     = 3,
	y_min     = -11,
	y_max     = 64,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 5000,
	clust_num_ores = 4,
	clust_size     = 2,
	y_min     = 65,
	y_max     = 67,
})

--
-- Iron
--
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 830,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -59,
	y_max     = -10,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 1660,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -9,
	y_max     = 0,
})

--
-- Gold
--
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_gold",
	wherein        = "default:stone",
	clust_scarcity = 5000,
	clust_num_ores = 5,
	clust_size     = 3,
	y_min     = -59,
	y_max     = -35,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_gold",
	wherein        = "default:stone",
	clust_scarcity = 10000,
	clust_num_ores = 3,
	clust_size     = 2,
	y_min     = -35,
	y_max     = -33,
})

--
-- Diamond
--
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 5000,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min     = -59,
		y_max     = -52,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 10000,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min     = -55,
		y_max     = -48,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:sand_with_diamond",
		wherein        = "default:sand",
		clust_scarcity = 10000,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min     = 85,
		y_max     = 448,
	})

--
-- Mese
--
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 600,
		clust_num_ores = 6,
		clust_size     = 3,
		y_min     = -59,
		y_max     = -52,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 1200,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min     = -55,
		y_max     = -53,
	})

--ES Node Registration and location
	minetest.register_ore({
		    ore_type       = "scatter",
		    ore            = "default:stone_with_emerald",
		    wherein        = "default:stone",
		    clust_scarcity = 34*34*34,
		    clust_num_ores = 1,
		    clust_size     = 2,
		    y_min     = -60,
		    y_max     = -24,
	})

	minetest.register_ore({
		    ore_type       = "scatter",
		    ore            = "default:stone_with_emerald",
		    wherein        = "default:stone",
		    clust_scarcity = 14*14*14,
		    clust_num_ores = 2,
		    clust_size     = 4,
		    y_min     = -70,
		    y_max     = -44,
	})
	
	minetest.register_ore({
		    ore_type       = "scatter",
		    ore            = "default:stone_with_emerald",
		    wherein        = "default:savannastone",
		    clust_scarcity = 14*14*14,
		    clust_num_ores = 2,
		    clust_size     = 4,
		    y_min     = 12,
		    y_max     = 70,
	})	
	


	-- Clay

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:clay",
		wherein         = {"default:sand"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -15,
		y_max           = 0,
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

	-- Sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:sand",
		wherein         = {"default:stone", "default:sandstone",
			"default:desert_stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -70,
		y_max           = 4,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Dirt

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:dirt",
		wherein         = {"default:stone", "default:sandstone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -70,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:gravel",
		wherein         = {"default:stone"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -62,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Coal

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_min          = -70,
		y_max          = 64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_min          = -70,
		y_max          = 0,
	})
--orig def
	-- Iron

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -15,
		y_max          = 2,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -63,
		y_max          = -16,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -70,
		y_max          = -64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
		y_min          = -70,
		y_max          = -64,
	})

	--Mese

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 18 * 18 * 18,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -70,
		y_max          = -64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_mese",
		wherein        = "default:stone",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -70,
		y_max          = -56,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:mese",
		wherein        = "default:stone",
		clust_scarcity = 36 * 36 * 36,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -70,
		y_max          = -60,
	})

	-- Gold

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min          = -70,
		y_max          = -64,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_gold",
		wherein        = "default:stone",
		clust_scarcity = 13 * 13 * 13,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -70,
		y_max          = -56,
	})

	-- Diamond

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 17 * 17 * 17,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -70,
		y_max          = -28,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -70,
		y_max          = -56,
	})

	-- Copper

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 12 * 12 * 12,
		clust_num_ores = 4,
		clust_size     = 3,
		y_min          = -63,
		y_max          = -16,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 9 * 9 * 9,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min          = -70,
		y_max          = -64,
	})

	
--NETHER GENERATION	
--nether defs
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:rack_with_diamond",
		wherein        = {"default:lava_source","default:rack","default:stone"},
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 12,
		clust_size     = 5,
		y_min           = -3390,
		y_max           = -3130,
	})
	
	minetest.register_ore({
	    ore_type       = "scatter",
	    ore            = "default:quartz_ore",
	    --wherein        = "default:rack",
	    wherein        = {"default:rack","default:stone"},
	    clust_scarcity = 10*10*10,
	    clust_num_ores = 6,
	    clust_size     = 5,
	    y_min     = -3390,
	    y_max     = -3000,
	    --y_max     = NETHER_DEPTH,
	})

	-- Slow Sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:slowsand",
		wherein         = {"default:rack", "default:lava_source",
			"default:desert_stone"},
		clust_scarcity  = 13 * 13 * 13,
		clust_size      = 5,
		y_min           = -3390,
		y_max           = -3000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Glowstone

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:glowstone",
		wherein         = {"default:rack", "air"},
		clust_scarcity  = 26 * 26 * 26,
		clust_size      = 5,
		y_min           = -3390,
		y_max           = -3000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.1,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:gravel",
		wherein         = {"default:rack"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -3390,
		y_max           = -3000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})

	--Lava
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:lava_source",
		wherein        = "default:rack",
		clust_scarcity =12 *12 * 12,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min           = -3390,
		y_max           = -3000,
	})	
	
	
	--Fire
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:underground_fire",
		wherein        = "default:rack",
		clust_scarcity =12 *22 * 12,
		clust_num_ores = 5,
		clust_size     = 5,
		y_min           = -3390,
		y_max           = -3000,
	})


minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:nitherbrick",
	wherein        ={"default:rack"},
	clust_scarcity = 1,
	clust_num_ores = 1,
	clust_size     = 3,
	y_min     = -3050,
	y_max     = -4000,
	noise_threshold = 0.2,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

--Realm1 generation
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_diamond",
		wherein        = "default:stone",
		clust_scarcity = 1000,
		clust_num_ores = 30,
		clust_size     = 9,
		y_min     = -31000,
		y_max     = -5000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:diamondblock",
		wherein        = "default:stone",
		clust_scarcity = 10000,
		clust_num_ores = 30,
		clust_size     = 9,
		y_min     = -31000,
		y_max     = -5000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_emerald",
		wherein        = "default:stone",
		clust_scarcity = 5000,
		clust_num_ores = 36,
		clust_size     = 9,
		y_min     = -31000,
		y_max     = -5000,
	})	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_iron",
		wherein        = "default:stone",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 27,
		clust_size     = 6,
	y_min     = -31000,
	y_max     = -5000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:tree",
		wherein        = "default:water_source",
		clust_scarcity = 24 * 24 * 24,
		clust_num_ores = 2,
		clust_size     = 6,
	y_min     = -5500,
	y_max     = -5000,
	})	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_coal",
		wherein        = "default:stone",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
	y_min     = -5500,
	y_max     = -5000,
	})
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:glowstone",
		wherein        = "default:water_source",
		clust_scarcity = 38 * 38 * 38,
		clust_num_ores = 2,
		clust_size     = 1,
	y_min     = -5500,
	y_max     = -5000,
	})	

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:stone_with_emerald",
		wherein        = "default:water_source",
		clust_scarcity = 68 * 68 * 68,
		clust_num_ores = 2,
		clust_size     = 1,
	y_min     = -5530,
	y_max     = -5420,
	})
	

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:nitherbrick",
	wherein        = {"default:water_source","default:lava_source","default:rack", "air"},
	clust_scarcity = 1,  --higher the less
	clust_num_ores = 372,  --amount
	clust_size     = 13,  --depth
	y_min     = -5090,
	y_max     = -5060,
	noise_threshold = 0.02,
	noise_params = {offset=4, scale=1, spread={x=50, y=122, z=50}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:rack",
	wherein        = {"default:water_source","default:lava_source","default:rack", "air"},
	clust_scarcity = 1,  --higher the less
	clust_num_ores = 372,  --amount
	clust_size     = 3,  --depth
	y_min     = -5090,
	y_max     = -5060,
	noise_threshold = 0.8,
	noise_params = {offset=0, scale=1, spread={x=50, y=122, z=50}, seed=2464, octaves=3, persist=0.70}
})

	
end
--
-- Register biomes
--

-- All mapgens except mgv6 and singlenode

--
-- Register biomes
--

-- All mapgens except mgv6

function default.register_biomes(upper_limit)

	-- Icesheet

	minetest.register_biome({
		name = "icesheet",
		node_dust = "default:snowblock",
		node_top = "default:snowblock",
		depth_top = 1,
		node_filler = "default:snowblock",
		depth_filler = 3,
		node_stone = "default:ice",
		node_water_top = "default:ice",
		depth_water_top = 10,
		--node_water = "",
		node_river_water = "default:ice",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_min = -8,
		y_max = upper_limit,
		heat_point = 0,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "icesheet_ocean",
		node_dust = "default:snowblock",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		node_water_top = "default:ice",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		y_min = -112,
		y_max = -9,
		heat_point = 0,
		humidity_point = 73,
	})

	-- Tundra

	minetest.register_biome({
		name = "tundra",
		node_dust = "default:snowblock",
		--node_top = ,
		--depth_top = ,
		--node_filler = ,
		--depth_filler = ,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_min = 2,
		y_max = upper_limit,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra_beach",
		--node_dust = "",
		node_top = "default:gravel",
		depth_top = 1,
		node_filler = "default:gravel",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_min = -3,
		y_max = 1,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -4,
		heat_point = 0,
		humidity_point = 40,
	})

	-- Taiga

	minetest.register_biome({
		name = "taiga",
		--node_dust = "default:snow",
		node_top = "default:podzol",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 15,
		y_max = upper_limit,
		heat_point = 25,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "taiga_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 1,
		heat_point = 25,
		humidity_point = 70,
	})

	-- Snowy grassland

	minetest.register_biome({
		name = "snowy_grassland",
		node_dust = "default:snow",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "snowy_grassland_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 20,
		humidity_point = 35,
	})

	-- Grassland

	minetest.register_biome({
		name = "grassland",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 6,
		y_max = upper_limit,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_dunes",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 5,
		y_max = 5,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Coniferous forest

	minetest.register_biome({
		name = "coniferous_forest",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 6,
		y_max = upper_limit,
		heat_point = 45,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "coniferous_forest_dunes",
		--node_dust = "",
		node_top = "default:podzol",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 2,
		y_max = 56,
		heat_point = 45,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "coniferous_forest_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 45,
		humidity_point = 70,
	})

	-- Deciduous forest

	minetest.register_biome({
		name = "deciduous_forest",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_shore",
		--node_dust = "",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 60,
		humidity_point = 68,
	})

	-- Desert

	minetest.register_biome({
		name = "desert",
		--node_dust = "",
		node_top = "default:desert_sand",
		depth_top = 1,
		node_filler = "default:desert_sand",
		depth_filler = 1,
		node_stone = "default:desert_stone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 92,
		humidity_point = 16,
	})

	minetest.register_biome({
		name = "desert_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_stone = "default:desert_stone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 92,
		humidity_point = 16,
	})

	-- Sandstone desert

	minetest.register_biome({
		name = "sandstone_desert",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		node_stone = "default:sandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 60,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "sandstone_desert_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		node_stone = "default:sandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 60,
		humidity_point = 0,
	})

	-- Cold desert

	minetest.register_biome({
		name = "cold_desert",
		--node_dust = "",
		node_top = "default:stone",
		depth_top = 1,
		node_filler = "default:stone",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:stone",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 40,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "cold_desert_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 40,
		humidity_point = 0,
	})

		-- Hot
--maikerumine added :)
		minetest.register_biome({
		name = "mesa",
		--node_dust = "",
		node_top = "hardenedclay:hardened_clay_brown",
		depth_top = 1,
		node_filler = "hardenedclay:hardened_clay_brown",
		depth_filler = 1,
		node_stone = "hardenedclay:hardened_clay_brown",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -35,
		y_max = 31000,
		heat_point = 45,
		humidity_point = 50,
	})
	-- Savanna

	minetest.register_biome({
		name = "savanna",
		--node_dust = "",
		node_top = "default:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "default:coarse_dirt",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_shore",
		--node_dust = "",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 89,
		humidity_point = 42,
	})

	-- Rainforest

	minetest.register_biome({
		name = "rainforest",
		--node_dust = "",
		node_top = "default:dirt_with_rainforest_litter",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "rainforest_swamp",
		--node_dust = "",
		node_top = "default:dirt",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 86,
		humidity_point = 65,
	})

	
--mooshroom
		minetest.register_biome({
		name = "mooshroom",
		--node_dust = "",
		node_top = "default:mycelium",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 50,
		heat_point = 96,
		humidity_point = 55,
	})

		minetest.register_biome({
		name = "mooshroom_cold",
		--node_dust = "",
		node_top = "default:mycelium_snow",
		depth_top = 1,
		node_filler = "default:coarse_dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:stone",
		depth_riverbed = 2,
		y_min = 56,
		y_max = 900,
		heat_point = 96,
		humidity_point = 55,
	})

	
	
	minetest.register_biome({
		name = "rainforest_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "default:sand",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 86,
		humidity_point = 65,
	})
	
	
--[[
	-- Underground

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "",
		--depth_filler = ,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = -113,
		heat_point = 50,
		humidity_point = 50,
	})
	]]
	
	-- Underground
	--MAPGEN REALMS
	minetest.register_biome({
		name = "dropzone",
		--node_dust = "",
		--node_top = "",
		--depth_top = 1,
		--node_filler = "default:dummy",
		--depth_filler = 3,
		node_stone =  "default:dummy",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2974,
		y_max = -82,
		heat_point = 50,
		humidity_point = 50,
	})
	
		minetest.register_biome({
		name = "airworld",
		--node_dust = "",
		--node_top = "",
		--depth_top = 1,
		--node_filler = "air",
		--depth_filler = 3,
		node_stone =  "air",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2979,
		y_max = -2975,
		heat_point = 50,
		humidity_point = 50,
	})
	
	minetest.register_biome({
		name = "void",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "default:bedrock",
		--depth_filler = ,
		node_stone =  "default:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3000,
		y_max = -2980,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "default:rack",
		--depth_filler = ,
		node_stone =  "default:rack",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3330,
		y_max = -3001,
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
		y_min = -3399,
		y_max = -3331,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "lavabottom",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "default:bedrock",
		--depth_filler = ,
		node_stone =  "default:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -4000,
		y_max = -3400,
		heat_point = 50,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "airworldlow",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "default:dummy",
		--depth_filler = ,
		node_stone =  "air",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5000,
		y_max = -4001,
		heat_point = 50,
		humidity_point = 50,
	})	
	
	
	--realm 2
		minetest.register_biome({
		name = "realm1",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "default:dummy",
		--depth_filler = ,
		node_stone =  "default:water_source",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5500,
		y_max = -5001,
		heat_point = 50,
		humidity_point = 50,
	})	
	
		minetest.register_biome({
		name = "realm1b",
		--node_dust = "",
		node_top = "default:dirt",
		depth_top = 12,
		node_filler = "default:sand",
		depth_filler = 1,
		node_stone =  "default:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5600,
		y_max = -5551,
		heat_point = 50,
		humidity_point = 50,
	})		
	
	
	
	
	

end


-- Biomes for floatlands

function default.register_floatland_biomes(floatland_level, shadow_limit)

	-- Coniferous forest

	minetest.register_biome({
		name = "floatland_coniferous_forest",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = floatland_level + 2,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 70,
	})

	-- Grassland

	minetest.register_biome({
		name = "floatland_grassland",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = floatland_level + 2,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Sandstone desert

	minetest.register_biome({
		name = "floatland_sandstone_desert",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 1,
		node_stone = "default:sandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = floatland_level + 2,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 0,
	})

	-- Floatland ocean / underground

	minetest.register_biome({
		name = "floatland_ocean",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = shadow_limit,
		y_max = floatland_level + 1,
		heat_point = 50,
		humidity_point = 50,
	})
end



--
-- Register decorations
--

-- Mgv6

function default.register_mgv6_decorations()
	minetest.clear_registered_decorations()

	-- Papyrus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		y_min = 1,
		y_max = 1,
		decoration = "default:papyrus",
		height = 2,
		y_max = 4,
		spawn_by = "default:water_source",
		num_spawn_by = 1,
	})

	-- Cacti

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand","hardenedclay:hardened_clay_brown"},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:cactus",
		height = 3,
	        y_max = 4,
	})

	-- Long grasses

	for length = 1, 5 do
		minetest.register_decoration({
			deco_type = "simple",
			place_on = {"default:dirt_with_grass", "default:podzol", "default:dirt_with_rainforest_litter"},
			sidelen = 16,
			noise_params = {
				offset = 0,
				scale = 0.007,
				spread = {x = 100, y = 100, z = 100},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			y_min = 1,
			y_max = 30,
			decoration = "default:grass_"..length,
		})
	end

	-- Dry shrubs

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand", "default:dirt_with_snow","hardenedclay:hardened_clay_brown", "default:coarse_dirt"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.035,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:dry_shrub",
	})
end

-- All mapgens except mgv6 and singlenode

local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "default:sand", "default:podzol"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"stone_grassland", "sandstone_grassland",
			"deciduous_forest", "coniferous_forest",
			"stone_grassland_dunes", "sandstone_grassland_dunes",
			"coniferous_forest_dunes"},
		y_min = 1,
		y_max = 31000,
		decoration = "default:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		decoration = "default:dry_grass_"..length,
	})
end

function default.register_decorations()
	minetest.clear_registered_decorations()

	-- Apple tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0036,
			scale = 0.0022,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/apple_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.00018,
			scale = 0.00011,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:tree", param2 = 12, prob = 191},
				{name = "default:tree", param2 = 12},
				{name = "default:tree", param2 = 12, prob = 127},
				{name = "air", prob = 0},
				{name = "mcl_mushrooms:mushroom_brown", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Jungle tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass", "default:dirt", "default:dirt_with_rainforest_litter"},
		sidelen = 80,
		fill_ratio = 0.09,
		biomes = {"rainforest", "rainforest_swamp"},
		y_min = 0,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass", "default:dirt", "default:dirt_with_rainforest_litter"},
		sidelen = 80,
		fill_ratio = 0.01,
		biomes = {"rainforest", "rainforest_swamp"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:jungletree", param2 = 12, prob = 191},
				{name = "default:jungletree", param2 = 12},
				{name = "default:jungletree", param2 = 12, prob = 127},
				{name = "air", prob = 0},
				{name = "mcl_mushrooms:mushroom_brown", prob = 127},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Taiga and temperate coniferous forest pine tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:dirt_with_grass", "default:podzol"},
		sidelen = 16,
		noise_params = {
			offset = 0.0096,
			scale = 0.0022,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest","coniferous_forest_dunes"},
		y_min = 2,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:dirt_with_grass", "default:podzol"},
		sidelen = 80,
		noise_params = {
			offset = 0.00018,
			scale = 0.00011,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest","coniferous_forest_dunes"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:pine_tree", param2 = 12, prob = 191},
				{name = "default:pine_tree", param2 = 12},
				{name = "default:pine_tree", param2 = 12, prob = 127},
				{name = "air", prob = 0},
				{name = "mcl_mushrooms:mushroom_red", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Acacia tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/acacia_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 2, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:acacia_tree", param2 = 12, prob = 191},
				{name = "default:acacia_tree", param2 = 12},
				{name = "default:acacia_tree", param2 = 12, prob = 127},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Aspen tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.0015,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/aspen_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0,
			scale = -0.00008,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest"},
		y_min = 1,
		y_max = 31000,
		schematic = {
			size = {x = 3, y = 3, z = 1},
			data = {
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "air", prob = 0},
				{name = "default:aspen_tree", param2 = 12},
				{name = "default:aspen_tree", param2 = 12},
				{name = "default:aspen_tree", param2 = 12, prob = 127},
				{name = "mcl_mushrooms:mushroom_red", prob = 63},
				{name = "mcl_mushrooms:mushroom_brown", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})
	-- Large cactus

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:desert_sand", "default:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 5,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/large_cactus.mts",
		flags = "place_center_x",
		rotation = "random",
	})

	-- Cactus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand", "default:sand"},
		sidelen = 16,
		noise_params = {
			offset = -0.0003,
			scale = 0.0009,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 5,
		y_max = 31000,
		decoration = "default:cactus",
		height = 2,
		y_max = 5,
	})

	-- Papyrus

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 200, y = 200, z = 200},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"savanna_swamp"},
		y_min = 0,
		y_max = 0,
		schematic = minetest.get_modpath("default").."/schematics/papyrus.mts",
	})

--mooshroom deco
	--Red Mushroom
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:mycelium"},
		sidelen = 80,
		fill_ratio = 0.004,
		biomes = {"mooshroom"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_mushrooms:mushroom_red",
	})
	--Brown Mushroom
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:mycelium"},
		sidelen = 80,
		fill_ratio = 0.003,
		biomes = {"mooshroom"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_mushrooms:mushroom_brown",
	})

	--Large Mushroom
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:mycelium", "default:mycelium_snow"},
		sidelen = 80,
		fill_ratio = 0.0004,
		biomes = {"mooshroom", "mooshroom_cold"},
		y_min = -6000,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_mushrooms").."/schematics/mushroom_large.mts",
		flags = "place_center_x",
		rotation = "random",
	})
	
	--Small Mushroom
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:mycelium", "default:mycelium_snow"},
		sidelen = 80,
		fill_ratio = 0.0002,
		biomes = {"mooshroom", "mooshroom_cold"},
		y_min = -6000,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_mushrooms").."/schematics/mushroom_small.mts",
		flags = "place_center_x",
		rotation = "random",
	})	
	
	--Brown Mushroom
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:mycelium", "default:mycelium_snow"},
		sidelen = 80,
		fill_ratio = 0.002,
		biomes = {"mooshroom", "mooshroom_cold"},
		y_min = -6000,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_mushrooms").."/schematics/mushroom_brown.mts",
		flags = "place_center_x",
		rotation = "random",
	})

		--Brown Mushroom
	minetest.register_decoration({
		deco_type = "schematic",
		place_on = { "default:dirt_with_grass"},
		sidelen = 80,
		fill_ratio = 0.0002,
		biomes = { "deciduous_forest"},
		y_min = -6000,
		y_max = 31000,
		schematic = minetest.get_modpath("mcl_mushrooms").."/schematics/mushroom_brown.mts",
		flags = "place_center_x",
		rotation = "random",
	})
	
	
	-- Bush

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass", "default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"snowy_grassland", "grassland", "deciduous_forest",
			"floatland_grassland"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("default") .. "/schematics/bush.mts",
		flags = "place_center_x, place_center_z",
	})

	-- Acacia bush

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 90155,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("default") .. "/schematics/acacia_bush.mts",
		flags = "place_center_x, place_center_z",
	})	
	
	-- Grasses

	register_grass_decoration(-0.03,  0.09,  5)
	register_grass_decoration(-0.015, 0.075, 4)
	register_grass_decoration(0,      0.06,  3)
	register_grass_decoration(0.015,  0.045, 2)
	register_grass_decoration(0.03,   0.03,  1)

	-- Dry grasses

	register_dry_grass_decoration(0.01, 0.05,  5)
	register_dry_grass_decoration(0.03, 0.03,  4)
	register_dry_grass_decoration(0.05, 0.01,  3)
	register_dry_grass_decoration(0.07, -0.01, 2)
	register_dry_grass_decoration(0.09, -0.03, 1)

	-- Junglegrass

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "default:dirt_with_rainforest_litter"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"rainforest"},
		y_min = 1,
		y_max = 31000,
		decoration = "default:junglegrass",
	})

	-- Dry shrub

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:desert_sand", "default:dirt_with_snow","hardenedclay:hardened_clay_brown"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.02,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert", "tundra","mesa"},
		y_min = 2,
		y_max = 31000,
		decoration = "default:dry_shrub",
	})

	-- Coral reef

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:sand"},
		noise_params = {
			offset = -0.15,
			scale = 0.1,
			spread = {x = 100, y = 100, z = 100},
			seed = 7013,
			octaves = 3,
			persist = 1,
		},
		biomes = {
			"desert_ocean",
			"savanna_ocean",
			"rainforest_ocean",
		},
		y_min = -8,
		y_max = -2,
		schematic = minetest.get_modpath("default") .. "/schematics/corals.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})


	
	
--stones
	
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:podzol"},
		sidelen = 80,
		fill_ratio = 0.004,
		biomes = {"tiaga"},
		y_min = -6000,
		y_max = 31000,
		decoration = "default:mossycobble",
	})	

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 80,
		fill_ratio = 0.002,
		--biomes = {"tiaga"},
		y_min = -6000,
		y_max = 31000,
		decoration = "default:cobble",
	})	
	
	--Nether Decorations
	--Red Mushroom
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:rack"},
		sidelen = 80,
		fill_ratio = 0.4,
		biomes = {"underground"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_mushrooms:mushroom_red",
	})
	--Brown Mushroom
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:rack"},
		sidelen = 80,
		fill_ratio = 0.3,
		biomes = {"underground"},
		y_min = -6000,
		y_max = 31000,
		decoration = "mcl_mushrooms:mushroom_brown",
	})
	--Fire
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:rack"},
		sidelen = 8,
		fill_ratio = 0.9,
		biomes = {"underground"},
		y_min = -6000,
		y_max = 31000,
		decoration = "fire:permanent_flame",
	})
	--Wart
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:slowsand"},
		sidelen = 80,
		fill_ratio = 0.1,
		biomes = {"underground"},
		y_min = -6000,
		y_max = 31000,
		decoration = "default:wart",
	})
	

--mc2 flowers

	-- Doubletall grass
	minetest.register_decoration({
		deco_type = "schematic",
		schematic = {
			size = { x=1, y=3, z=1 },
			data = {
				{ name = "air", prob = 0 },
				{ name = "mcl_flowers:double_grass", param1=255, },
				{ name = "mcl_flowers:double_grass_top", param1=255, },
			},
		},
		replacements = {
			["mcl_flowers:tallgrass"] = "mcl_flowers:double_grass"
		},
		place_on = {"default:dirt_with_grass", "default:podzol"},
		sidelen = 8,
		noise_params = {
			offset = -0.01,
			scale = 0.03,
			spread = {x = 500, y = 500, z = 500},
			seed = 420,
			octaves = 2,
			persist = 0.6,
		},
		y_min = 1,
		y_max = 40,
		flags = "",
	})

	-- Large ferns
	minetest.register_decoration({
		deco_type = "schematic",
		schematic = {
			size = { x=1, y=3, z=1 },
			data = {
				{ name = "air", prob = 0 },
				{ name = "mcl_flowers:double_fern", param1=255, },
				{ name = "mcl_flowers:double_fern_top", param1=255, },
			},
		},
		replacements = {
			["mcl_flowers:fern"] = "mcl_flowers:double_fern"
		},
		-- This makes sure large ferns only appear in jungles
		--spawn_by = { "default:jungletree", "default:pine_tree", "mcl_flowers:fern" },
		--num_spawn_by = 1,
		place_on = { "default:podzol", "default:dirt_with_rainforest_litter"},

		sidelen = 16,
		noise_params = {
			offset = -0.01,
			scale = 0.03,
			spread = {x = 60, y = 60, z = 60},
			seed = 333,
			octaves = 2,
			persist = 0.66,
		},
		y_min = 1,
		y_max = 75,
		flags = "",
	})

	-- Large flowers
	local register_large_flower = function(name, seed, offset)
		minetest.register_decoration({
			deco_type = "schematic",
			schematic = {
				size = { x=1, y=3, z=1 },
				data = {
					{ name = "air", prob = 0 },
					{ name = "mcl_flowers:"..name, param1=255, },
					{ name = "mcl_flowers:"..name.."_top", param1=255, },
				},
			},
			place_on = {"default:dirt_with_grass"},

			sidelen = 16,
			noise_params = {
				offset = offset,
				scale = 0.01,
				spread = {x = 300, y = 300, z = 300},
				seed = seed,
				octaves = 5,
				persist = 0.62,
			},
			y_min = 1,
			y_max = 30,
			flags = "",
		})
	end

	register_large_flower("rose_bush", 9350, -0.008)
	register_large_flower("peony", 10450, -0.008)
	register_large_flower("lilac", 10600, -0.007)
	register_large_flower("sunflower", 2940, -0.005)

	-- Tall grass
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 8,
		noise_params = {
			offset = 0.01,
			scale = 0.3,
			spread = {x = 500, y = 500, z = 500},
			seed = 420,
			octaves = 2,
			persist = 0.6
		},
		y_min = 1,
		y_max = 50,
		decoration = "mcl_flowers:tallgrass",
	})

	-- Add a small amount of tall grass everywhere to avoid areas completely empty devoid of tall grass
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "default:podzol"},
		sidelen = 8,
		fill_ratio = 0.001,
		y_min = 1,
		y_max = 50,
		decoration = "mcl_flowers:tallgrass",
	})





	local function register_mgv6_flower(name, seed, offset)
		if offset == nil then
			offset = 0
		end
		minetest.register_decoration({
			deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
			sidelen = 16,
			noise_params = {
				offset = offset,
				scale = 0.006,
				spread = {x = 100, y = 100, z = 100},
				seed = seed,
				octaves = 3,
				persist = 0.6
			},
			y_min = 1,
			y_max = 30,
			decoration = "mcl_flowers:"..name,
		})
	end

	register_mgv6_flower("tulip_red",  436)
	register_mgv6_flower("tulip_orange", 536)
	register_mgv6_flower("tulip_pink", 636)
	register_mgv6_flower("tulip_white", 736)
	register_mgv6_flower("azure_bluet", 800)
	register_mgv6_flower("dandelion", 8)
	--[[ Allium and blue orchid are made slightly rarer in v6
	to compensate for missing biomes. In Minecraft, those flowers only appear in special biomes. ]]
	register_mgv6_flower("allium", 0, -0.001)
	register_mgv6_flower("blue_orchid", 64500, -0.001)
	register_mgv6_flower("oxeye_daisy", 3490)
	register_mgv6_flower("poppy", 9439)



	
end

--
-- Detect mapgen to select functions
--

-- Mods using singlenode mapgen can call these functions to enable
-- the use of minetest.generate_ores or minetest.generate_decorations

local mg_params = minetest.get_mapgen_params()
if mg_params.mgname == "v6" then
	default.register_ores()
	default.register_mgv6_decorations()
elseif mg_params.mgname ~= "singlenode" then
	default.register_biomes()
	default.register_ores()
	default.register_decorations()
end
--[[

--
-- Detect mapgen to select functions  newest
--

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name == "v6" then
	default.register_ores()
	default.register_mgv6_decorations()
else
	default.register_biomes()
	default.register_ores()
	default.register_decorations()
end
]]


--bedrock code

local function replace(old, new, min, max)
	for i=1,8 do
		minetest.register_ore({
			ore_type       = "scatter",
			ore            = new,
			wherein        = old,
			clust_scarcity = 1,
			clust_num_ores = 1,
			clust_size     = 1,
			y_min     = min,
			y_max     = max,
		})
	end
end




--the -64 bedrock
replace("air", "default:bedrock", -80, -64)
replace("air", "default:lava_source", -64, -54)
replace("default:stone", "default:bedrock", -80, -64)
replace("default:gravel", "default:bedrock", -80, -64)
replace("default:dirt", "default:bedrock", -80, -64)
replace("default:sand", "default:bedrock", -80, -64)
replace("default:cobble", "default:bedrock", -80, -64)
replace("default:desert_cobble", "default:bedrock", -80, -64)
replace("default:mossycobble", "default:bedrock", -80, -64)
replace("stairs:stair_cobble", "default:bedrock", -80, -64)
replace("default:lava_source", "default:bedrock", -80, -64)
replace("default:lava_flowing", "default:bedrock", -80, -64)
replace("default:water_source", "default:bedrock", -80, -64)
replace("default:water_flowing", "default:bedrock", -80, -64)
replace("default:sandstone", "default:bedrock", -80, -64)
replace("default:desert_stone", "default:bedrock", -80, -64)
replace("default:desert_sand", "default:bedrock", -80, -64)
replace("default:mese", "default:bedrock", -80, -64)
replace("default:stone_with_gold", "default:bedrock", -80, -64)
--replace("default:stone_with_diamond", "default:bedrock", -80, -64)
replace("default:stone_with_iron", "default:bedrock",  -80, -64)
replace("default:stone_with_mese", "default:bedrock",  -80, -64)
replace("default:stone_with_coal", "default:bedrock", -80, -64)
replace("default:desert_stone_with_iron", "default:bedrock",  -80, -64)
replace("default:granite", "default:bedrock", -80, -64)
replace("default:marble", "default:bedrock", -80, -64)
replace("hardenedclay:hardened_clay_brown", "default:bedrock", -80, -64)

--[[
--dungeon swap
replace("default:cobblestone", "default:nitherbrick", -3900, -2400)
replace("default:mossycobble", "default:nitherbrick", -3900, -2400)
replace("stairs:stair_cobble", "stairs:stair_nitherbrick", -3900, -2400)
replace("stairs:stair_mossycobble", "stairs:stair_nitherbrick", -3900, -2400)
]]

local function bedrock(old)
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:bedrock",
		wherein        = old,
		clust_scarcity = 5,
		clust_num_ores = 3,
		clust_size     = 2,
		y_min     = -64,
		y_max     = -60,
	})
end
bedrock("air")
bedrock("default:stone")
bedrock("default:desert_stone")
bedrock("default:gravel")
bedrock("default:dirt")
bedrock("default:sand")
bedrock("default:desert_sand")
bedrock("default:desert_cobble")
bedrock("default:cobble")
bedrock("default:mossycobble")
bedrock("stairs:stair_cobble")
bedrock("default:lava_source")
bedrock("default:lava_flowing")
bedrock("default:water_source")
bedrock("default:water_flowing")


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


local NETHER_DEPTH = -3100
local NETHER_AMBIENT = 7
local nether_created = false




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
	ore_type       = "sheet",
	ore            = "default:marble",
	wherein        = "default:stone",
	clust_scarcity = 1,
	clust_num_ores = 1,
	clust_size     = 3,
	height_min     = -80,
	height_max     = 50,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=150, y=150, z=150}, seed=23, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:granite",
	wherein        = "default:stone",
	clust_scarcity = 1,
	clust_num_ores = 1,
	clust_size     = 4,
	height_min     = -80,
	height_max     = 50,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})


--DEFAULT STRATA
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:stone",
	wherein        = {"default:desert_stone","default:desert_sand","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 3,
	clust_size     = 4,
	height_min     = 50,
	height_max     = 90,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:clay",
	wherein        = {"default:desert_stone","default:desert_sand","default:stone","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 8,
	height_min     = 24,
	height_max     = 50,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:sandstone",
	wherein        ={"default:desert_stone","default:desert_sand","default:stone","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 10,
	height_min     = 10,
	height_max     = 30,
	noise_threshhold = 0.2,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:dirt",
	wherein        = {"default:desert_stone","default:desert_sand","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 4,
	height_min     = -12,
	height_max     = 7,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:gravel",
	wherein        = {"default:desert_stone"},
	clust_scarcity = 1,
	clust_num_ores = 8,
	clust_size     = 4,
	height_min     = 34,
	height_max     = 70,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:coalblock",
	wherein        = {"default:desert_stone","default:stone","hardenedclay:hardened_clay_brown"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 4,
	height_min     = 60,
	height_max     = 96,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.80}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:desert_sand",
	wherein        = {"default:desert_stone"},
	clust_scarcity = 1,
	clust_num_ores = 8,
	clust_size     = 4,
	height_min     = 44,
	height_max     = 70,
	noise_threshhold = 0.4,
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
	height_min     = 5,
	height_max     = 14,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_black",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores =27,
	clust_size     = 1,
	height_min     = 15,
	height_max     = 17,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70}, 
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_orange",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 27,
	clust_size     = 6,
	height_min     = 20,
	height_max     = 29,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_red",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 8,
	clust_size     = 2,
	height_min     = 34,
	height_max     = 37,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_yellow",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	height_min     = 42,
	height_max     = 43,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_blue",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	height_min     = 43,
	height_max     = 44,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_yellow",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	height_min     = 44,
	height_max     = 45,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_yellow",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	height_min     = 45,
	height_max     = 47,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_light_gray",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 1,
	height_min     = 49,
	height_max     = 52,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_yellow",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 4,
	height_min     = 53,
	height_max     = 59,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_white",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	height_min     = 61,
	height_max     = 70,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "hardenedclay:hardened_clay_purple",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	height_min     = 66,
	height_max     = 75,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})
minetest.register_ore({
	ore_type       = "sheet",
	ore            = "default:obsidian",
	wherein        = {"hardenedclay:hardened_clay_brown"},
	--clust_scarcity = 1,
	--clust_num_ores = 100,
	clust_size     = 8,
	height_min     = 161,
	height_max     = 170,
	noise_threshhold = 0.0,
	noise_params =     {offset=0, scale=1, spread={x=3100, y=3100, z=3100}, seed=23, octaves=3, persist=0.70} ,
})



--plzadamcode from minitest
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
	height_min     = -59,
	height_max     = -12,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 1000,
	clust_num_ores = 6,
	clust_size     = 3,
	height_min     = -11,
	height_max     = 64,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_coal",
	wherein        = "default:stone",
	clust_scarcity = 5000,
	clust_num_ores = 4,
	clust_size     = 2,
	height_min     = 65,
	height_max     = 67,
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
	height_min     = -59,
	height_max     = -10,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_iron",
	wherein        = "default:stone",
	clust_scarcity = 1660,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -9,
	height_max     = 0,
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
	height_min     = -59,
	height_max     = -35,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_gold",
	wherein        = "default:stone",
	clust_scarcity = 10000,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -35,
	height_max     = -33,
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
	height_min     = -59,
	height_max     = -52,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_diamond",
	wherein        = "default:stone",
	clust_scarcity = 10000,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = -55,
	height_max     = -48,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:sand_with_diamond",
	wherein        = "default:sand",
	clust_scarcity = 10000,
	clust_num_ores = 3,
	clust_size     = 2,
	height_min     = 85,
	height_max     = 448,
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
	height_min     = -59,
	height_max     = -52,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "default:stone_with_mese",
	wherein        = "default:stone",
	clust_scarcity = 1200,
	clust_num_ores = 4,
	clust_size     = 3,
	height_min     = -55,
	height_max     = -53,
})

--ES Node Registration and location
minetest.register_ore({
		    ore_type       = "scatter",
		    ore            = "default:stone_with_emerald",
		    wherein        = "default:stone",
		    clust_scarcity = 34*34*34,
		    clust_num_ores = 1,
		    clust_size     = 2,
		    height_min     = -60,
		    height_max     = -24,
	})

	minetest.register_ore({
		    ore_type       = "scatter",
		    ore            = "default:stone_with_emerald",
		    wherein        = "default:stone",
		    clust_scarcity = 14*14*14,
		    clust_num_ores = 2,
		    clust_size     = 4,
		    height_min     = -70,
		    height_max     = -44,
	})
	
	minetest.register_ore({
		    ore_type       = "scatter",
		    ore            = "default:stone_with_emerald",
		    wherein        = "default:savannastone",
		    clust_scarcity = 14*14*14,
		    clust_num_ores = 2,
		    clust_size     = 4,
		    height_min     = 12,
		    height_max     = 70,
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
	    height_min     = -3390,
	    height_max     = -3000,
	    --height_max     = NETHER_DEPTH,
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
		ore            = "fire:permanent_flame",
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
	clust_num_ores = 12,
	clust_size     = 10,
	height_min     = -3050,
	height_max     = -4000,
	noise_threshhold = 0.2,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

	
end
--
-- Register biomes
--

-- All mapgens except mgv6 and singlenode

function default.register_biomes()
	minetest.clear_registered_biomes()

	-- Permanent ice

	minetest.register_biome({
		name = "glacier",
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
		y_min = -8,
		y_max = 31000,
		heat_point = 0,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "glacier_ocean",
		node_dust = "default:snowblock",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -82,
		y_max = -9,
		heat_point = 0,
		humidity_point = 50,
	})

	-- Cold

	minetest.register_biome({
		name = "tundra",
		--node_dust = "",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 2,
		y_max = 31000,
		heat_point = 15,
		humidity_point = 35,
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
		y_min = -3,
		y_max = 1,
		heat_point = 15,
		humidity_point = 35,
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
		y_min = -82,
		y_max = -4,
		heat_point = 15,
		humidity_point = 35,
	})


	minetest.register_biome({
		name = "taiga",
		node_dust = "default:snow",
		node_top = "default:dirt_with_snow",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 2,
		y_max = 31000,
		heat_point = 15,
		humidity_point = 65,
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
		y_min = -82,
		y_max = 1,
		heat_point = 15,
		humidity_point = 65,
	})

	-- Temperate

	minetest.register_biome({
		name = "stone_grassland",
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
		y_min = 6,
		y_max = 31000,
		heat_point = 40,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "stone_grassland_dunes",
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
		y_min = 5,
		y_max = 5,
		heat_point = 40,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "stone_grassland_ocean",
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
		y_min = -82,
		y_max = 4,
		heat_point = 40,
		humidity_point = 35,
	})


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
		y_min = 6,
		y_max = 31000,
		heat_point = 40,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "coniferous_forest_dunes",
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
		y_min = 5,
		y_max = 5,
		heat_point = 40,
		humidity_point = 65,
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
		y_min = -82,
		y_max = 4,
		heat_point = 40,
		humidity_point = 65,
	})


	minetest.register_biome({
		name = "sandstone_grassland",
		--node_dust = "",
		node_top = "default:dirt_with_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_stone = "default:sandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 6,
		y_max = 31000,
		heat_point = 60,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "sandstone_grassland_dunes",
		--node_dust = "",
		node_top = "default:sand",
		depth_top = 1,
		node_filler = "default:sand",
		depth_filler = 2,
		node_stone = "default:sandstone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 5,
		y_max = 5,
		heat_point = 60,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "sandstone_grassland_ocean",
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
		y_min = -82,
		y_max = 4,
		heat_point = 60,
		humidity_point = 35,
	})


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
		y_min = 1,
		y_max = 31000,
		heat_point = 60,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "deciduous_forest_swamp",
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
		y_min = -3,
		y_max = 0,
		heat_point = 60,
		humidity_point = 65,
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
		y_min = -82,
		y_max = -4,
		heat_point = 60,
		humidity_point = 65,
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
		y_min = 5,
		y_max = 31000,
		heat_point = 85,
		humidity_point = 20,
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
		y_min = -82,
		y_max = 4,
		heat_point = 85,
		humidity_point = 20,
	})


	minetest.register_biome({
		name = "savanna",
		--node_dust = "",
		node_top = "default:dirt_with_dry_grass",
		depth_top = 1,
		node_filler = "default:dirt",
		depth_filler = 1,
		node_stone = "default:savannastone",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = 12,
		y_max = 31000,
		heat_point = 85,
		humidity_point = 50,
	})

	minetest.register_biome({
		name = "savanna_swamp",
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
		y_min = -3,
		y_max = 0,
		heat_point = 85,
		humidity_point = 50,
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
		y_min = -82,
		y_max = -4,
		heat_point = 85,
		humidity_point = 50,
	})


	minetest.register_biome({
		name = "rainforest",
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
		y_min = 1,
		y_max = 31000,
		heat_point = 85,
		humidity_point = 80,
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
		y_min = -3,
		y_max = 0,
		heat_point = 85,
		humidity_point = 80,
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
		y_min = -82,
		y_max = -4,
		heat_point = 85,
		humidity_point = 80,
	})

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
		y_min = -3420,
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
		node_stone =  "default:dummy",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -5000,
		y_max = -3421,
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
		height_max = 4,
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
	        height_max = 4,
	})

	-- Long grasses

	for length = 1, 5 do
		minetest.register_decoration({
			deco_type = "simple",
			place_on = {"default:dirt_with_grass"},
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
		place_on = {"default:desert_sand", "default:dirt_with_snow","hardenedclay:hardened_clay_brown"},
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
		place_on = {"default:dirt_with_grass", "default:sand"},
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
				{name = "flowers:mushroom_brown", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Jungle tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass", "default:dirt"},
		sidelen = 80,
		fill_ratio = 0.009,
		biomes = {"rainforest", "rainforest_swamp"},
		y_min = 0,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_grass", "default:dirt"},
		sidelen = 80,
		fill_ratio = 0.001,
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
				{name = "flowers:mushroom_brown", prob = 127},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})

	-- Taiga and temperate coniferous forest pine tree and log

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = 0.0036,
			scale = 0.0022,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest"},
		y_min = 2,
		y_max = 31000,
		schematic = minetest.get_modpath("default").."/schematics/pine_tree.mts",
		flags = "place_center_x, place_center_z",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow", "default:dirt_with_grass"},
		sidelen = 80,
		noise_params = {
			offset = 0.00018,
			scale = 0.00011,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"taiga", "coniferous_forest"},
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
				{name = "flowers:mushroom_red", prob = 63},
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
				{name = "flowers:mushroom_red", prob = 63},
				{name = "flowers:mushroom_brown", prob = 63},
				{name = "air", prob = 0},
			},
		},
		flags = "place_center_x",
		rotation = "random",
	})
	-- Large cactus

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:desert_sand"},
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
		place_on = {"default:desert_sand"},
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
		height_max = 5,
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
		place_on = {"default:dirt_with_grass"},
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
		decoration = "flowers:mushroom_red",
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
		decoration = "flowers:mushroom_brown",
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



local function replace(old, new, min, max)
	for i=1,8 do
		minetest.register_ore({
			ore_type       = "scatter",
			ore            = new,
			wherein        = old,
			clust_scarcity = 1,
			clust_num_ores = 1,
			clust_size     = 1,
			height_min     = min,
			height_max     = max,
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


--dungeon swap
replace("default:cobblestone", "default:nitherbrick", -3900, -2400)
replace("default:mossycobble", "default:nitherbrick", -3900, -2400)
replace("stairs:stair_cobble", "stairs:stair_nitherbrick", -3900, -2400)
replace("stairs:stair_mossycobble", "stairs:stair_nitherbrick", -3900, -2400)


local function bedrock(old)
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:bedrock",
		wherein        = old,
		clust_scarcity = 5,
		clust_num_ores = 3,
		clust_size     = 2,
		height_min     = -64,
		height_max     = -60,
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


--[[
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


-- Mapgen

-- Initialize noise object and localise noise buffer

local nobj_cave = nil
local nbuf_cave


-- Content ids

local c_air = minetest.get_content_id("air")

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

local c_cobble = minetest.get_content_id("default:cobble")
local c_mossycobble = minetest.get_content_id("default:mossycobble")
local c_marble = minetest.get_content_id("default:marble")
local c_granite = minetest.get_content_id("default:granite")
local c_stair_cobble = minetest.get_content_id("stairs:stair_cobble")

local c_lava_source = minetest.get_content_id("default:lava_source")
local c_lava_flowing = minetest.get_content_id("default:lava_flowing")
local c_water_source = minetest.get_content_id("default:water_source")
local c_water_flowing = minetest.get_content_id("default:water_flowing")

local c_glowstone = minetest.get_content_id("default:glowstone")
local c_nethersand = minetest.get_content_id("default:slowsand")
local c_netherbrick = minetest.get_content_id("default:nitherbrick")
local c_netherrack = minetest.get_content_id("default:rack")
local c_netherfire = minetest.get_content_id("default:permanent_flame")
local c_netherdiamond = minetest.get_content_id("default:rack_with_diamond")
local c_quartz = minetest.get_content_id("default:quartz_ore")
local c_netherquartz = minetest.get_content_id("default:quartz_ore")






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
						
					elseif id == c_mese then -- Mese block to lava
						data[vi] = c_lava_source
					elseif id == c_stone_with_iron then -- Iron block to fire
						data[vi] = c_netherfire
					elseif id == c_dirt then --Dirt block to Glowstone
						data[vi] = c_glowstone
					elseif id == c_granite then --Dirt block to Glowstone
						data[vi] = c_netherbrick
					elseif id == c_stone_with_diamond then --Netherdiamonds
						data[vi] = c_netherdiamond
					elseif id ==  c_lava_source then --LAVA!!
						data[vi] =  c_lava_source
					elseif id ==  c_quartz then --Quartz
						data[vi] =  c_quartz
					elseif id ==  c_netherquartz then --Quartz
						data[vi] =  c_netherquartz
					elseif id == c_stone_with_gold or -- Precious ores to glowstone
						id == c_stone_with_mese then
						data[vi] = c_glowstone
					elseif id == c_gravel or -- Blob ore to nethersand
							id == c_marble or
							id == c_sand then
						data[vi] = c_nethersand
					else -- All else to netherstone
						data[vi] = c_netherrack
						
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
]]

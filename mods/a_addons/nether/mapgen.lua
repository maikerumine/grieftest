-- Minetest 0.4 Mod: Nether

local NETHER_DEPTH = -2000
local NETHER_AMBIENT = 6
local nether_created = false



--Mapgen stuffs
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:rack_with_diamond",
		wherein        = {"default:lava_source","nether:rack","default:stone"},
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 12,
		clust_size     = 5,
		y_min           = -31000,
		y_max           = -3100,
	})

-- maikerumines hackish nether
--The following will generate nether and bedrock limits without mapgen function.
--it is a bit slow
--[[
	minetest.register_ore({
		ore_type        = "blob",
		ore             = "nether:glowstone",
		wherein         = {"nether:rack"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = -2000,
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

		minetest.register_ore({
		ore_type        = "blob",
		ore             = "nether:brick",
		wherein         = {"nether:rack"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = -2000,
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

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "default:lava_source",
		wherein        = "nether:rack",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min           = -31000,
		y_max           = -2100,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:rack_with_diamond",
		wherein        = "nether:rack",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 12,
		clust_size     = 5,
		y_min           = -31000,
		y_max           = -3000,
	})
	
	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:rack_with_diamond",
		wherein        = "default:lava_source",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 12,
		clust_size     = 5,
		y_min           = -31000,
		y_max           = -3100,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:glowstone",
		wherein        = "nether:rack",
		clust_scarcity = 14 * 14 * 14,
		clust_num_ores = 5,
		clust_size     = 3,
		y_min           = -31000,
		y_max           = -2000,
	})

minetest.register_ore({
	--ore_type       = "blob",
	ore_type       = "scatter",
	ore            = "default:gravel",
	wherein        = {"nether:rack"},
	clust_scarcity = 24 * 24 * 24,
	clust_num_ores = 12,
	clust_size     = 8,
	height_min     = -31000,
	height_max     = -2000,
	noise_threshhold = 0.4,
	noise_params = {offset=0, scale=15, spread={x=130, y=130, z=130}, seed=24, octaves=3, persist=0.70}
})

minetest.register_ore({
	ore_type       = "sheet",
	ore            = "nether:sand",
	wherein        = {"nether:rack"},
	clust_scarcity = 1,
	clust_num_ores = 12,
	clust_size     = 8,
	height_min     = -31000,
	height_max     = -2000,
	noise_threshhold = 0.9,
	noise_params = {offset=0, scale=1, spread={x=30, y=30, z=30}, seed=24, octaves=3, persist=0.70}
})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:permanent_flame",
		--ore            = "fire:basic_flame",
		wherein        = "nether:rack",
		clust_scarcity = 18 *18 * 18,
		clust_num_ores = 8,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -2000,
	})

		minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nether:glowstone",
		wherein        = "nether:rack",
		clust_scarcity = 8 * 8 * 8,
		clust_num_ores = 8,
		clust_size     = 3,
		y_min          = -31000,
		y_max          = -2000,
	})


	-- Underground

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "nether:rack",
		--depth_filler = ,
		--node_stone =  "nether:rack",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2280,
		y_max = -113,
		heat_point = 50,
		humidity_point = 50,
	})

		minetest.register_biome({
		name = "bedrock_upper",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "nether:bedrock",
		--depth_filler = ,
		node_stone =  "default:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -2900,
		y_max = -2281,
		heat_point = 50,
		humidity_point = 50,
	})

		minetest.register_biome({
		name = "Nunderground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "nether:rack",
		--depth_filler = ,
		node_stone =  "nether:rack",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -3100,
		y_max = -2901,
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
		y_min = -5000,
		y_max = -3101,
		heat_point = 50,
		humidity_point = 50,
	})

		minetest.register_biome({
		name = "bedrock_lower",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "nether:bedrock2",
		--depth_filler = ,
		node_stone =  "default:bedrock",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = -5001,
		heat_point = 50,
		humidity_point = 50,
	})

]]


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

local c_glowstone = minetest.get_content_id("nether:glowstone")
local c_nethersand = minetest.get_content_id("nether:sand")
local c_netherbrick = minetest.get_content_id("nether:brick")
local c_netherrack = minetest.get_content_id("nether:rack")
local c_netherfire = minetest.get_content_id("nether:permanent_flame")
local c_netherdiamond = minetest.get_content_id("nether:rack_with_diamond")
local c_quartz = minetest.get_content_id("quartz:quartz_ore")
local c_netherquartz = minetest.get_content_id("nether:quartz_ore")






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

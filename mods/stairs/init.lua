stairs = {}
stairs.mod = "redo"

function default.node_sound_wool_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "wool_coat_movement", gain = 1.0}
	table.dug = table.dug or
			{name = "wool_coat_movement", gain = 0.25}
	table.place = table.place or
			{name = "default_place_node", gain = 1.0}
	return table
end

stairs.wood = default.node_sound_wood_defaults()
stairs.dirt = default.node_sound_dirt_defaults()
stairs.stone = default.node_sound_stone_defaults()
stairs.glass = default.node_sound_glass_defaults()
stairs.leaves = default.node_sound_leaves_defaults()
stairs.metal = default.node_sound_metal_defaults()
stairs.wool = default.node_sound_wool_defaults() -- Xanadu only
--stairs.wool = stairs.leaves

-- Node will be called stairs:stair_<subname>
function stairs.register_stair(subname, recipeitem, groups, images, description, snds, alpha)
	groups.stair = 1
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
--		drawtype = "nodebox",
		drawtype = "mesh",
		mesh = "stairs_stair.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = alpha,
		groups = groups,
		sounds = snds,
--		node_box = {
--			type = "fixed",
--			fixed = {
--				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
--				{-0.5, 0, 0, 0.5, 0.5, 0.5},
--			},
--		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointed_thing)
		end,
	})
--[[
	-- stair recipes
	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 4', -- was 6
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	minetest.register_craft({
		output = 'stairs:stair_' .. subname .. ' 4', -- was 6
		recipe = {
			{"", "", recipeitem},
			{"", recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- stair to original material recipe
	minetest.register_craft({
		type = "shapeless",
		output = recipeitem .. " 3",
		recipe = {"stairs:stair_" .. subname, "stairs:stair_" .. subname}
	})
]]
		-- for replace ABM
	if replace then
		minetest.register_node(":stairs:stair_" .. subname .. "upside_down", {
			replace_name = "stairs:stair_" .. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		minetest.register_craft({
			output = 'stairs:stair_' .. subname .. ' 8',
			recipe = {
				{recipeitem, "", ""},
				{recipeitem, recipeitem, ""},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Flipped recipe for the silly minecrafters
		minetest.register_craft({
			output = 'stairs:stair_' .. subname .. ' 8',
			recipe = {
				{"", "", recipeitem},
				{"", recipeitem, recipeitem},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'stairs:stair_' .. subname,
				burntime = math.floor(baseburntime * 0.75),
			})
		end
	end
	
end

-- Slab facedir to placement 6d matching table
local slab_trans_dir = {[0] = 8, 0, 2, 1, 3, 4}

-- Node will be called stairs:slab_<subname>
function stairs.register_slab(subname, recipeitem, groups, images, description, snds, alpha)
	groups.slab = 1
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = alpha,
		groups = groups,
		sounds = snds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			local wield_item = itemstack:get_name()
			local creative_enabled = (creative and creative.is_enabled_for
					and creative.is_enabled_for(placer:get_player_name()))

			if under and under.name:find("stairs:slab_") then
				-- place slab using under node orientation
				local dir = minetest.dir_to_facedir(vector.subtract(
					pointed_thing.above, pointed_thing.under), true)

				local p2 = under.param2

				-- combine two slabs if possible
				if slab_trans_dir[math.floor(p2 / 4)] == dir
						and wield_item == under.name then

					if not recipeitem then
						return itemstack
					end
					local player_name = placer:get_player_name()
					if minetest.is_protected(pointed_thing.under, player_name) and not
							minetest.check_player_privs(placer, "protection_bypass") then
						minetest.record_protection_violation(pointed_thing.under,
							player_name)
						return
					end
					minetest.set_node(pointed_thing.under, {name = recipeitem, param2 = p2})
					if not creative_enabled then
						itemstack:take_item()
					end
					return itemstack
				end

				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and dir == 8 then
					p2 = p2 - 20
				-- same for the opposite case: slab below normal slab
				elseif p2 <= 3 and dir == 4 then
					p2 = p2 + 20
				end

				-- else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), placer, pointed_thing, p2)
				if not creative_enabled then
					itemstack:take_item()
				end
				return itemstack
			else
				return rotate_and_place(itemstack, placer, pointed_thing)
			end
		end,
	})
	
	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:slab_" .. subname .. "upside_down", {
			replace_name = "stairs:slab_".. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		minetest.register_craft({
			output = 'stairs:slab_' .. subname .. ' 6',
			recipe = {
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'stairs:slab_' .. subname,
				burntime = math.floor(baseburntime * 0.5),
			})
		end
	end
end
	
	
	
--[[	
	-- slab recipe
	minetest.register_craft({
		output = 'stairs:slab_' .. subname .. ' 6',
		recipe = {
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- slab to original material recipe
	minetest.register_craft({
		type = "shapeless",
		output = recipeitem,
		recipe = {"stairs:slab_" .. subname, "stairs:slab_" .. subname}
	})
	]]






-- Node will be called stairs:corner_<subname>
function stairs.register_corner(subname, recipeitem, groups, images, description, snds, alpha)
	minetest.register_node(":stairs:corner_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = alpha,
		groups = groups,
		sounds = snds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0, 0.5, 0.5},
			},
		},
		on_place = minetest.rotate_node
	})

	-- corner stair recipe
	minetest.register_craft({
		output = 'stairs:corner_' .. subname .. ' 4',
		recipe = {
			{"", "", ""},
			{"", recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- corner stair to original material recipe
	minetest.register_craft({
		type = "shapeless",
		output = recipeitem,
		recipe = {"stairs:corner_" .. subname, "stairs:corner_" .. subname}
	})
end

-- Node will be called stairs:invcorner_<subname>
function stairs.register_invcorner(subname, recipeitem, groups, images, description, snds, alpha)
	minetest.register_node(":stairs:invcorner_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = alpha,
		groups = groups,
		sounds = snds,
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
				{-0.5, 0, -0.5, 0, 0.5, 0},
			},
		},
		on_place = minetest.rotate_node
	})

	-- inside corner stair recipe
	minetest.register_craft({
		output = 'stairs:invcorner_' .. subname .. ' 6', -- was 8
		recipe = {
			{recipeitem, recipeitem, ""},
			{recipeitem, recipeitem, recipeitem},
			{recipeitem, recipeitem, recipeitem},
		},
	})

	-- inside corner stair to original material recipe
	minetest.register_craft({
		type = "shapeless",
		output = recipeitem .. " 4",
		recipe = {"stairs:invcorner_" .. subname,
		"stairs:invcorner_" .. subname, "stairs:invcorner_" .. subname}
	})
end
--[[
-- Node will be called stairs:slope_<subname>
function stairs.register_slope(subname, recipeitem, groups, images, description, snds, alpha)
	groups.slab = 1
	minetest.register_node(":stairs:slope_" .. subname, {
		description = description,
		--drawtype = "nodebox",
		drawtype = "mesh",
		mesh = "stairs_slope.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		use_texture_alpha = alpha,
		groups = groups,
		sounds = snds,
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = minetest.rotate_node
	})

	-- slope recipe
	minetest.register_craft({
		output = 'stairs:slope_' .. subname .. ' 6',
		recipe = {
			{recipeitem, "", ""},
			{recipeitem, recipeitem, ""},
		},
	})

	-- slope to original material recipe
	minetest.register_craft({
		type = "shapeless",
		output = recipeitem,
		recipe = {"stairs:slope_" .. subname, "stairs:slope_" .. subname}
	})
end
]]
-- Nodes will be called stairs:{stair,slab}_<subname>
function stairs.register_stair_and_slab(subname, recipeitem, groups, images,
		desc_stair, desc_slab, sounds, alpha)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds, alpha)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds, alpha)
end

-- Nodes will be called stairs:{stair,slab,corner,invcorner}_<subname>
function stairs.register_all(subname, recipeitem, groups, images, desc, snds, alpha)
	local str = " Stair"
	stairs.register_stair(subname, recipeitem, groups, images, str .. desc, snds, alpha)
	str = " Slab"
	stairs.register_slab(subname, recipeitem, groups, images, str .. desc, snds, alpha)
	str = " Corner"
	stairs.register_corner(subname, recipeitem, groups, images, str .. desc, snds, alpha)
	str = " Inverted Corner"
	stairs.register_invcorner(subname, recipeitem, groups, images, str .. desc, snds, alpha)
	--str = " Slope"
	--stairs.register_slope(subname, recipeitem, groups, images, str .. desc, snds, alpha)
end

-- Helper

local grp = {}

--= Default Minetest

stairs.register_all("wood", "default:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_wood.png"},
	"Wooden",
	stairs.wood)

stairs.register_all("junglewood", "default:junglewood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_junglewood.png"},
	"Jungle Wood",
	stairs.wood)

stairs.register_all("pine_wood", "default:pinewood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"default_sprucewood.png"},
	"Pine Wood",
	stairs.wood)

stairs.register_all("acacia_wood", "default:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 1, flammable = 3},
	{"default_acaciawood.png"},
	"Acacia Wood",
	stairs.wood)

stairs.register_all("aspen_wood", "default:aspen_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"default_planks_birch.png"},
	"Aspen Wood",
	stairs.wood)

stairs.register_all("cobble", "default:cobble",
	{cracky = 3},
	{"default_cobble.png"},
	"Cobble",
	stairs.stone)

stairs.register_all("desert_cobble", "default:desert_cobble",
	{cracky = 3},
	{"default_desert_cobble.png"},
	"Desert Cobble", 
	stairs.stone)

stairs.register_stair("cloud", "default:cloud",
	{unbreakable = 1},
	{"default_cloud.png"},
	"Cloud Stair",
	stairs.wool)

minetest.override_item("stairs:stair_cloud", {
	on_blast = function() end,
})

stairs.register_slab("cloud", "default:cloud",
	{unbreakable = 1},
	{"default_cloud.png"},
	"Cloud Slab",
	stairs.wool)

minetest.override_item("stairs:slab_cloud", {
	on_blast = function() end,
})

stairs.register_all("coal", "default:coalblock",
	{cracky = 3},
	{"default_coal_block.png"},
	"Coal",
	stairs.stone)

stairs.register_all("steelblock", "default:steelblock",
	{cracky = 1, level = 2},
	{"default_steel_block.png"},
	"Steel",
	stairs.metal)
--[[
stairs.register_all("copperblock", "default:copperblock",
	{cracky = 1, level = 2},
	{"default_copper_block.png"},
	"Copper",
	stairs.metal)

stairs.register_all("bronzeblock", "default:bronzeblock",
	{cracky = 1, level = 2},
	{"default_bronze_block.png"},
	"Bronze",
	stairs.metal)
]]
stairs.register_all("mese", "default:mese",
	{cracky = 1, level = 2},
	{"default_mese_block.png"},
	"Mese",
	stairs.stone)

stairs.register_all("goldblock", "default:goldblock",
	{cracky = 1},
	{"default_gold_block.png"},
	"Gold",
	stairs.metal)

stairs.register_all("diamondblock", "default:diamondblock",
	{cracky = 1, level = 3},
	{"default_diamond_block.png"},
	"Diamond",
	stairs.stone)

stairs.register_all("stone", "default:stone",
	{cracky=3,stone=1, },
	{"default_stone.png"},
	"Stone",
	stairs.stone)

stairs.register_all("desert_stone", "default:desert_stone",
	{cracky = 3},
	--{"default_desert_stone.png"},
	{"default_redsandstone_top.png", "default_redsandstone_bottom.png", "default_redsandstone_normal.png"},
	"Desert Stone",
	stairs.stone)

stairs.register_all("mossycobble", "default:mossycobble",
	{cracky = 3},
	{"default_mossycobble.png"},
	"Mossy Cobble",
	stairs.stone)

stairs.register_all("brick", "default:brick",
	{cracky = 3},
	{"default_brick.png"},
	"Brick",
	stairs.stone)

stairs.register_all("sandstone", "default:sandstone",
	{crumbly = 1, cracky = 3},
	{"default_sandstone_top.png", "default_sandstone_bottom.png", "default_sandstone_normal.png"},
	"Sandstone",
	stairs.stone)

stairs.register_all("glass", "default:glass",
	{cracky = 3, oddly_breakable_by_hand = 3},
	{"default_glass.png"},
	"Glass",
	stairs.glass)

stairs.register_all("obsidian_glass", "default:obsidian_glass",
	{cracky = 2},
	{"default_obsidian_glass.png"},
	"Obsidian Glass",
	stairs.glass)

stairs.register_all("sandstonebrick", "default:sandstonebrick",
	{cracky = 2},
	{"default_sandstone_top.png", "default_sandstone_bottom.png", "default_sandstone_carved.png"},
	"Sandstone Brick",
	stairs.stone)

stairs.register_all("obsidian", "default:obsidian",
	{cracky = 1, level = 2},
	{"default_obsidian.png"},
	"Obsidian",
	stairs.stone)

stairs.register_all("stonebrick", "default:stonebrick",
	{cracky = 2},
	{"default_stone_brick.png"},
	"Stone Brick",
	stairs.stone)

stairs.register_all("desert_stonebrick", "default:desert_stonebrick",
	{cracky = 3},
	--{"default_desert_stone_brick.png"},
	{"default_redsandstone_top.png", "default_redsandstone_bottom.png", "default_redsandstone_carved.png"},
	"Desert Stone Brick",
	stairs.stone)

stairs.register_all("obsidianbrick", "default:obsidianbrick",
	{cracky = 1, level = 3},
	{"default_obsidian_brick.png"},
	"Obsidian Brick",
	stairs.stone)


	
--= Farming Mod
if minetest.get_modpath("farming") then

stairs.register_all("straw", "farming:straw",
	{snappy = 3, flammable = 4},
	{"farming_straw.png"},
	"Straw",
	stairs.leaves)

end	
	
	
local colours = {
	{"black",      "Black",      "#000000b0"},
	{"blue",       "Blue",       "#015dbb70"},
	{"brown",      "Brown",      "#a78c4570"},
	{"cyan",       "Cyan",       "#01ffd870"},
	{"dark_green", "Dark Green", "#005b0770"},
	{"dark_grey",  "Dark Grey",  "#303030b0"},
	{"green",      "Green",      "#61ff0170"},
	{"grey",       "Grey",       "#5b5b5bb0"},
	{"magenta",    "Magenta",    "#ff05bb70"},
	{"orange",     "Orange",     "#ff840170"},
	{"pink",       "Pink",       "#ff65b570"},
	{"red",        "Red",        "#ff000070"},
	{"violet",     "Violet",     "#2000c970"},
	{"white",      "White",      "#abababc0"},
	{"yellow",     "Yellow",     "#e3ff0070"},
}

--= Wool Mod

if minetest.get_modpath("wool") then

for i = 1, #colours, 1 do

stairs.register_all("wool_" .. colours[i][1], "wool:" .. colours[i][1],
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
	{"wool_" .. colours[i][1] .. ".png"},
	colours[i][2] .. " Wool",
	stairs.stone)

end -- END for
end


print ("[MOD] Stairs Redo-REDONE! loaded")

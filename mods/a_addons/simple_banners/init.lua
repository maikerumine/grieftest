--simple_banners
--maikerumine made simple banner parts for your decorations
--20160725
--LGPLv2.1  
local simple_banners = {}

--Alias out old naming
minetest.register_alias("banners_2b2t:nomad_top", "simple_banners:nomad_top")
minetest.register_alias("banners_2b2t:nomad_bottom", "simple_banners:nomad_bottom")
minetest.register_alias("banners_2b2t:rusher_top", "simple_banners:rusher_top")
minetest.register_alias("banners_2b2t:rusher_bottom", "simple_banners:rusher_bottom")
minetest.register_alias("banners_2b2t:veteran_top", "simple_banners:veteran_top")
minetest.register_alias("banners_2b2t:veteran_bottom", "simple_banners:veteran_bottom")


local clrs = {
	{"black",      "Black",      "#000000b0"},
	{"blue",       "Blue",       "#015dbbcc"},
	{"brown",      "Brown",      "#a78c45cc"},
	{"cyan",       "Cyan",       "#01ffd8cc"},
	{"dark_green", "Dark Green", "#005b07cc"},
	{"dark_grey",  "Dark Grey",  "#303030b0"},
	{"green",      "Green",      "#61ff01cc"},
	{"grey",       "Grey",       "#5b5b5bb0"},
	{"magenta",    "Magenta",    "#ff05bbcc"},
	{"orange",     "Orange",     "#ff8401cc"},
	{"pink",       "Pink",       "#ff65b5cc"},
	{"red",        "Red",        "#ff0000cc"},
	{"violet",     "Violet",     "#2000c9cc"},
	{"white",      "White",      "#abababc0"},
	{"yellow",     "Yellow",     "#e3ff00cc"},
}

for i = 1, #clrs, 1 do


--FOR EXAMPLE ONLY
--All example registered items are fake and only used for crafting guide.
minetest.register_node("simple_banners:cross_top_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_cross.png",
})
minetest.register_tool("simple_banners:cross_bottom_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_cross.png^[transformFY",
})
minetest.register_tool("simple_banners:cross_x_top_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_x.png",
})
minetest.register_tool("simple_banners:cross_x_bottom_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_x.png^[transformFY",
})
minetest.register_tool("simple_banners:diag1_top_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_diag1.png",
})
minetest.register_tool("simple_banners:diag1_bottom_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_diag1_b.png",
})
minetest.register_tool("simple_banners:diag2_top_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_diag1.png^[transformFX",
})
minetest.register_tool("simple_banners:diag2_bottom_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_diag1_b.png^[transformFX",
})
minetest.register_tool("simple_banners:sun1_top_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_sun1.png",
})
minetest.register_tool("simple_banners:sun1_bottom_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_sun1.png^[transformFY",
})
minetest.register_tool("simple_banners:moon_top_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_moon.png",
})
minetest.register_tool("simple_banners:moon_bottom_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_moon.png^[transformFY",
})
minetest.register_tool("simple_banners:stripe1_top_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_stripe1.png",
})
minetest.register_tool("simple_banners:box1_top_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_box1.png",
})
minetest.register_tool("simple_banners:box1_bottom_example", {
	description = "-=USE THIS EXAMPLE FOR ALL BANNERS SHAPED LIKE THIS=-",
	inventory_image = "banners_box1.png^[transformFY",
})


minetest.register_craftitem("simple_banners:dye", {
	description = "ANY DYE",
	inventory_image = "dye_grey.png",
	groups = {not_in_creative_inventory = 1,not_in_craft_guide = 1},
	stack_max = 1,
})

--BEGIN EXAMPLES
--These are used to simplify the craft guide by giving a generic craft for all the colours.
minetest.register_craft({
	output = "simple_banners:cross_top_example",
	recipe = {
			{"simple_banners:plain", "simple_banners:dye", ""},
			{"",  "simple_banners:dye", ""},
			{ "simple_banners:dye", "simple_banners:dye", "simple_banners:dye"},
	}
})
minetest.register_craft({
	output = "simple_banners:cross_bottom_example",
	recipe = {
			{ "simple_banners:dye", "simple_banners:dye", "simple_banners:dye"},
			{"", "simple_banners:dye", ""},
			{"simple_banners:plain",  "simple_banners:dye", ""},
	}
})
minetest.register_craft({
	output = "simple_banners:x_top_example",
	recipe = {
			{"simple_banners:dye","simple_banners:plain", "simple_banners:dye"},
			{"","simple_banners:dye",""},
			{"simple_banners:dye", "","simple_banners:dye"},
	}
})

minetest.register_craft({
	output = "simple_banners:x_bottom_example",
	recipe = {
			{"simple_banners:dye", "","simple_banners:dye"},
			{"", "simple_banners:dye", ""},
			{"simple_banners:dye","simple_banners:plain","simple_banners:dye"},
	}
})
minetest.register_craft({
	output = "simple_banners:diag1_top_example",
	recipe = {
			{"","simple_banners:plain","simple_banners:dye"},
			{"", "simple_banners:dye","simple_banners:dye"},
			{"simple_banners:dye","simple_banners:dye", "simple_banners:dye"},
	}
})
minetest.register_craft({
	output = "simple_banners:diag1_bottom_example",
	recipe = {
			{"","simple_banners:dye","simple_banners:dye"},
			{"", "simple_banners:dye","simple_banners:dye"},
			{"simple_banners:dye","simple_banners:plain","simple_banners:dye"},
	}
})
minetest.register_craft({
	output = "simple_banners:diag2_top_example",
	recipe = {
			{"simple_banners:dye","simple_banners:plain",""},
			{"simple_banners:dye","simple_banners:dye",""},
			{"simple_banners:dye","simple_banners:dye","simple_banners:dye"},
	}
})
minetest.register_craft({
	output = "simple_banners:diag2_bottom_example",
	recipe = {
			{"simple_banners:dye","simple_banners:dye",""},
			{"simple_banners:dye", "simple_banners:dye",""},
			{"simple_banners:dye", "simple_banners:plain", "simple_banners:dye"},
	}
})
minetest.register_craft({
	output = "simple_banners:sun1_top_example",
	recipe = {
			{"","simple_banners:plain",""},
			{"","",""},
			{"","simple_banners:dye",""},
	}
})
minetest.register_craft({
	output = "simple_banners:sun1_bottom_example",
	recipe = {
			{"","simple_banners:dye",""},
			{"","",""},
			{"","simple_banners:plain",""},
			
	}
})
minetest.register_craft({
	output = "simple_banners:moon_top_example",
	recipe = {
			{"","simple_banners:plain",""},
			{"","simple_banners:dye",""},
			{"simple_banners:dye","","simple_banners:dye"},
	}
})
minetest.register_craft({
	output = "simple_banners:moon_bottom_example",
	recipe = {
			{"simple_banners:dye","","simple_banners:dye"},
			{"","simple_banners:dye",""},
			{"","simple_banners:plain",""},
	}
})

--END EXAMPLES




--BANNER PLAIN
--root craft
minetest.register_node("simple_banners:plain", {
	description = "Plain Banner -=USE FOR ALL BANNERS=-",
		drawtype = "nodebox",
	tiles = {"wool_white.png"},
	inventory_image =  {"wool_white.png"},
	wield_image = {"wool_white.png"},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 },
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:plain 12",
	recipe = {
			{"wool:white", "wool:white", "wool:white"},
			{"wool:white",  "wool:white", "wool:white"},
			{ "", "group:stick", ""},
	}
})

--PLAIN COLOR
--color craft
minetest.register_node("simple_banners:plain_".. clrs[i][1], {
	description = clrs[i][2] .. " Plain Banner -Also can be used as wallpaper",
		drawtype = "nodebox",
	tiles = {"wool_white.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"wool_white.png^[colorize:" .. clrs[i][3]},
	wield_image = {"wool_white.png^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:plain_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain",  "dye:" .. clrs[i][1] ,
	}
})


--BANNER BASIC
-- Cross
minetest.register_node("simple_banners:cross_top_" .. clrs[i][1], {
	description = clrs[i][2] .. " Cross Top Pattern",
		drawtype = "nodebox",
	--tiles = {"wool_white.png^(default_apple.png)^[colorize:" .. clrs[i][3]},
	--tiles = {"wool_white.png^banners_cross.png^[makealpha:255,255,255^[colorize:" .. clrs[i][3]},
	tiles = {"banners_cross.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_cross.png^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_cross.png^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "facedir",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:cross_top_".. clrs[i][1] .. " 1",
	recipe = {
			{"simple_banners:plain", "dye:" .. clrs[i][1], ""},
			{"",  "dye:" .. clrs[i][1], ""},
			{ "dye:" .. clrs[i][1], "dye:" .. clrs[i][1], "dye:" .. clrs[i][1]},
	}
})
minetest.register_craft({
	output = "simple_banners:cross_top_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:cross_top_".. clrs[i][1] ,
	}
})

minetest.register_node("simple_banners:cross_bottom_" .. clrs[i][1], {
	description = clrs[i][2] .. " Cross Bottom Pattern",
		drawtype = "nodebox",
	tiles = {"banners_cross.png^[transformFY^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_cross.png^[transformFY^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_cross.png^[transformFY^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:cross_bottom_".. clrs[i][1] .. " 1",
	recipe = {
			{ "dye:" .. clrs[i][1], "dye:" .. clrs[i][1], "dye:" .. clrs[i][1]},
			{"", "dye:" .. clrs[i][1], ""},
			{"simple_banners:plain",  "dye:" .. clrs[i][1], ""},
	}
})
minetest.register_craft({
	output = "simple_banners:cross_bottom_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:cross_bottom_".. clrs[i][1] ,
	}
})

-- X
minetest.register_node("simple_banners:x_top_" .. clrs[i][1], {
	description = clrs[i][2] .. " X Top Pattern",
		drawtype = "nodebox",
	tiles = {"banners_x.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_x.png^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_x.png^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:x_top_".. clrs[i][1] .. " 1",
	recipe = {
			{"dye:" .. clrs[i][1],"simple_banners:plain", "dye:" .. clrs[i][1]},
			{"","dye:" .. clrs[i][1],""},
			{"dye:" .. clrs[i][1], "","dye:" .. clrs[i][1]},
	}
})
minetest.register_craft({
	output = "simple_banners:x_top_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:x_top_".. clrs[i][1] ,
	}
})

minetest.register_node("simple_banners:x_bottom_" .. clrs[i][1], {
	description = clrs[i][2] .. " X Bottom Pattern",
		drawtype = "nodebox",
	tiles = {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:x_bottom_".. clrs[i][1] .. " 1",
	recipe = {
			{"dye:" .. clrs[i][1], "","dye:" .. clrs[i][1]},
			{"", "dye:" .. clrs[i][1], ""},
			{"dye:" .. clrs[i][1],"simple_banners:plain","dye:" .. clrs[i][1]},
	}
})
minetest.register_craft({
	output = "simple_banners:x_bottom_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:x_bottom_".. clrs[i][1] ,
	}
})

--DIAG 1
minetest.register_node("simple_banners:diag1_top_" .. clrs[i][1], {
	description = clrs[i][2] .. " Diagonal 1 Top Pattern",
		drawtype = "nodebox",
	tiles = {"banners_diag1.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_diag1.png^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_diag1.png^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:diag1_top_".. clrs[i][1] .. " 1",
	recipe = {
			{"","simple_banners:plain","dye:" .. clrs[i][1]},
			{"", "dye:" .. clrs[i][1],"dye:" .. clrs[i][1]},
			{"dye:" .. clrs[i][1],"dye:" .. clrs[i][1], "dye:" .. clrs[i][1]},
	}
})
minetest.register_craft({
	output = "simple_banners:diag1_top_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:diag1_top_".. clrs[i][1] ,
	}
})

minetest.register_node("simple_banners:diag1_bottom_" .. clrs[i][1], {
	description = clrs[i][2] .. " Diagonal 1 Bottom Pattern",
		drawtype = "nodebox",
	tiles = {"banners_diag1_b.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_diag1_b.png^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_diag1_b.png^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:diag1_bottom_".. clrs[i][1] .. " 1",
	recipe = {
			{"","dye:" .. clrs[i][1],"dye:" .. clrs[i][1]},
			{"", "dye:" .. clrs[i][1],"dye:" .. clrs[i][1]},
			{"dye:" .. clrs[i][1],"simple_banners:plain","dye:" .. clrs[i][1]},
	}
})
minetest.register_craft({
	output = "simple_banners:diag1_bottom_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:diag1_bottom_".. clrs[i][1] ,
	}
})

--DIAG 2
minetest.register_node("simple_banners:diag2_top_" .. clrs[i][1], {
	description = clrs[i][2] .. " Diagonal 2 Top Pattern",
		drawtype = "nodebox",
	tiles = {"banners_diag1.png^[transformFX^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_diag1.png^[transformFX^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_diag1.png^^[transformFX[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:diag2_top_".. clrs[i][1] .. " 1",
	recipe = {
			{"dye:" .. clrs[i][1],"simple_banners:plain",""},
			{"dye:" .. clrs[i][1],"dye:" .. clrs[i][1],""},
			{"dye:" .. clrs[i][1],"dye:" .. clrs[i][1],"dye:" .. clrs[i][1]},
	}
})
minetest.register_craft({
	output = "simple_banners:diag2_top_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:diag2_top_".. clrs[i][1] ,
	}
})

minetest.register_node("simple_banners:diag2_bottom_" .. clrs[i][1], {
	description = clrs[i][2] .. " Diagonal 2 Bottom Pattern",
		drawtype = "nodebox",
	tiles = {"banners_diag1_b.png^[transformFX^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_diag1_b.png^[transformFX^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_diag1_b.png^[transformFX^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:diag2_bottom_".. clrs[i][1] .. " 1",
	recipe = {
			{"dye:" .. clrs[i][1],"dye:" .. clrs[i][1],""},
			{"dye:" .. clrs[i][1], "dye:" .. clrs[i][1],""},
			{"dye:" .. clrs[i][1], "simple_banners:plain", "dye:" .. clrs[i][1]},
	}
})
minetest.register_craft({
	output = "simple_banners:diag2_bottom_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:diag2_bottom_".. clrs[i][1] ,
	}
})

--SUN 1
minetest.register_node("simple_banners:sun1_top_" .. clrs[i][1], {
	description = clrs[i][2] .. "Sun 1 Pattern Top",
		drawtype = "nodebox",
	tiles = {"banners_sun1.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_sun1.png^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_sun1.png^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:sun1_top_".. clrs[i][1] .. " 1",
	recipe = {
			{"","simple_banners:plain",""},
			{"","",""},
			{"","dye:" .. clrs[i][1],""},
	}
})
minetest.register_craft({
	output = "simple_banners_sun1_top_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:sun1_top_".. clrs[i][1] ,
	}
})

minetest.register_node("simple_banners:sun1_bottom_" .. clrs[i][1], {
	description = clrs[i][2] .. "Sun 1 Pattern Bottom",
		drawtype = "nodebox",
	tiles = {"banners_sun1.png^[transformFY^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_sun1.png^[transformFY^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_sun1.png^[transformFY^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "simple_banners:sun1_bottom_".. clrs[i][1] .. " 1",
	recipe = {
			{"","dye:" .. clrs[i][1],""},
			{"","",""},
			{"","simple_banners:plain",""},
			
	}
})
minetest.register_craft({
	output = "simple_banners_sun1_bottom_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:sun1_bottom_".. clrs[i][1] ,
	}
})

--MOON
minetest.register_node("simple_banners:moon_top_" .. clrs[i][1], {
	description = clrs[i][2] .. "Moon Pattern Top",
		drawtype = "nodebox",
	tiles = {"banners_moon.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_moon.png^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_moon.png^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, puncher)
		node.name = "simple_banners:moon_bottom_".. clrs[i][1] ,
		minetest.swap_node(pos, node)
	end,
})
minetest.register_craft({
	output = "simple_banners:moon_top_".. clrs[i][1] .. " 1",
	recipe = {
			{"","simple_banners:plain",""},
			{"","dye:" .. clrs[i][1],""},
			{"dye:" .. clrs[i][1],"","dye:" .. clrs[i][1]},
	}
})
minetest.register_craft({
	output = "simple_banners:moon_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:moon_top_".. clrs[i][1] ,
	}
})

minetest.register_node("simple_banners:moon_bottom_" .. clrs[i][1], {
	description = clrs[i][2] .. "Moon Pattern Bottom",
		drawtype = "nodebox",
	tiles = {"banners_moon.png^[transformFY^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_moon.png^[transformFY^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_moon.png^[transformFY^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
	on_rightclick = function(pos, node, puncher)
		node.name = "simple_banners:moon_top_".. clrs[i][1],
		minetest.swap_node(pos, node)
	end,
})
minetest.register_craft({
	output = "simple_banners:moon_bottom_".. clrs[i][1] .. " 1",
	recipe = {
			{"dye:" .. clrs[i][1],"","dye:" .. clrs[i][1]},
			{"","dye:" .. clrs[i][1],""},
			{"","simple_banners:plain",""},
	}
})
minetest.register_craft({
	output = "simple_banners:moon_bottom_".. clrs[i][1] .. " 1",
	type = "shapeless",
	recipe = {
			  "simple_banners:plain", "simple_banners:moon_bottom_".. clrs[i][1] ,
	}
})



--TESTING AREA
-- test
minetest.register_node("simple_banners:test_top_" .. clrs[i][1], {
	description = clrs[i][2] .. " Test 1",
	drawtype = "nodebox",
	tiles = {"wool_white.png^(default_apple.png)^[colorize:" .. clrs[i][3]},
	--tiles = {"wool_white.png^banners_cross.png^[makealpha:255,255,255^[colorize:" .. clrs[i][3]},
	--tiles = {"wool_white.png^banners_cross.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_cross.png^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_cross.png^[colorize:" .. clrs[i][3]},
	drawtype = "nodebox",

		paramtype = "light",
		--paramtype2 = "wallmounted",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		walkable = false,
		node_box = { type = "fixed", fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5} },
		--node_box = {
			--type = "wallmounted",
			--wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			--wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			--wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		--},
		
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, node, puncher)

		node.name = "simple_banners:test2_top_black"
		--node.name = "simple_banners:test2_top_" .. clrs[i][1],
		minetest.swap_node(pos, node)
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)

		node.name = "simple_banners:test2_top_white"
		minetest.swap_node(pos, node)
	end,
})
minetest.register_node("simple_banners:test2_top_" .. clrs[i][1], {
	description = clrs[i][2] .. " Test 2",
	drawtype = "nodebox",
	tiles = {"wool_white.png^(default_tool_diamondsword.png)^[colorize:" .. clrs[i][3]},
	--tiles = {"wool_white.png^banners_cross.png^[makealpha:255,255,255^[colorize:" .. clrs[i][3]},
	--tiles = {"wool_white.png^banners_cross.png^[colorize:" .. clrs[i][3]},
	inventory_image =  {"banners_cross.png^[colorize:" .. clrs[i][3]},
	wield_image = {"banners_cross.png^[colorize:" .. clrs[i][3]},
	--node_box = { type = "wallmounted", wallmounted = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5} },
	node_box = { type = "fixed", fixed = {-0.5, -0.5, 7/16, 0.5, 0.5, 0.5} },
		paramtype = "light",
		--paramtype2 = "wallmounted",
		paramtype2 = "facedir",
		sunlight_propagates = true,
		walkable = false,
		--[[
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		]]
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
	on_punch = function(pos, node, puncher)
		node.name = "simple_banners:test_top_black"  --this code works
		--node.name = "simple_banners:test_top_" .. clrs[i][1],  --this code don't work
		minetest.swap_node(pos, node)
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)

		node.name = "simple_banners:test_top_white"
		minetest.swap_node(pos, node)
	end,
})



--[[
--COMBINE BANNERS WIP
--combine register
minetest.register_node("simple_banners:x_cross_top_" .. clrs[i][1], {
	description = clrs[i][2] .. " X Cross Bottom Pattern",
		drawtype = "nodebox",
	tiles = {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]^"banners_cross.png^[transformFY^[colorize:" .. clrs[i][3]},
	--inventory_image =  {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]^"banners_cross.png^[transformFY^[colorize:" .. clrs[i][3]},
	--wield_image = {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]^"banners_cross.png^[transformFY^[colorize:" .. clrs[i][3]},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("simple_banners:x_cross_bottom_" .. clrs[i][1], {
	description = clrs[i][2] .. " X Cross Bottom Pattern",
		drawtype = "nodebox",
	tiles = {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]^banners_cross.png},
	inventory_image =  {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]^banners_cross.png},
	wield_image = {"banners_x.png^[transformFY^[colorize:" .. clrs[i][3]^banners_cross.png},
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 ,not_in_craft_guide = 1},
		sounds = default.node_sound_wood_defaults(),
})


--combine crafts
minetest.register_craft({
	output = "simple_banners:x_cross_top_".. clrs[i][1] .. " 2",
	recipe = {
			{ "", "simple_banners:plain", ""},
			{"","simple_banners:x_top_" .. clrs[i][1], ""},
			{ "", "simple_banners:cross_top_" .. clrs[i][1], ""},
	}
})
minetest.register_craft({
	output = "simple_banners:x_cross_bottom_".. clrs[i][1] .. " 2",
	recipe = {
			{ "", "simple_banners:plain", ""},
			{"","simple_banners:x_bottom_" .. clrs[i][1], ""},
			{ "", "simple_banners:cross_bottom_" .. clrs[i][1], ""},
	}
})
 ]]

------------------------
--2B2T BANNERS--
------------------------

--NOMAD BANNER -maikerumine-
	minetest.register_node("simple_banners:nomad_top", {
		description = " Banner",
		drawtype = "nodebox",
		tiles = {"banners_2b2t_nom_t.png"},
		inventory_image = "banners_2b2t_nom_t.png",
		wield_image = "banners_2b2t_nom_t.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 },
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "simple_banners:nomad_top",
		recipe = {
			{"wool:white", "default:diamond", "wool:white"},
			{"wool:white", "wool:red", "wool:white"},
			{"wool:white", "group:stick", "wool:white"},
		}
	})
	minetest.register_craft({
		output = "simple_banners:nomad_top",
		type = "shapeless",
		recipe = {
				  "simple_banners:plain", "simple_banners:nomad_top" ,
		}
	})

	minetest.register_node("simple_banners:nomad_bottom", {
		description =  "Banner",
		drawtype = "nodebox",
		tiles = {"banners_2b2t_nom_b.png"},
		inventory_image = "banners_2b2t_nom_b.png",
		wield_image = "banners_2b2t_nom_b.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 },
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "simple_banners:nomad_bottom",
		recipe = {
			{"wool:white", "group:stick", "wool:white"},
			{"wool:white", "wool:red", "wool:white"},
			{"wool:white", "default:diamond", "wool:white"},
		}
	})
	minetest.register_craft({
		output = "simple_banners:nomad_bottom",
		type = "shapeless",
		recipe = {
				  "simple_banners:plain", "simple_banners:nomad_bottom" ,
		}
	})

--RUSHER BANNER
	minetest.register_node("simple_banners:rusher_top", {
		description = " Banner",
		drawtype = "nodebox",
		tiles = {"banners_2b2t_rush_t.png"},
		inventory_image = "banners_2b2t_rush_t.png",
		wield_image = "banners_2b2t_rush_t.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 },
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "simple_banners:rusher_top",
		recipe = {
			{"wool:white", "default:diamond", "wool:white"},
			{"wool:white", "wool:white", "wool:white"},
			{"wool:white", "group:stick", "wool:white"},
		}
	})
	minetest.register_craft({
		output = "simple_banners:rusher_top",
		type = "shapeless",
		recipe = {
				  "simple_banners:plain", "simple_banners:rusher_top" ,
		}
	})	
	
	minetest.register_node("simple_banners:rusher_bottom", {
		description = " Banner",
		drawtype = "nodebox",
		tiles = {"banners_2b2t_rush_t.png^[transformFY"},
		inventory_image = "banners_2b2t_rush_t.png^[transformFY",
		wield_image = "banners_2b2t_rush_t.png^[transformFY",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "simple_banners:rusher_bottom",
		recipe = {
			{"wool:white", "group:stick", "wool:white"},
			{"wool:white", "wool:white", "wool:white"},
			{"wool:white", "default:diamond", "wool:white"},
		}
	})
	minetest.register_craft({
		output = "simple_banners:rusher_bottom",
		type = "shapeless",
		recipe = {
				  "simple_banners:plain", "simple_banners:rusher_bottom" ,
		}
	})
	
--VETERAN BANNER
	minetest.register_node("simple_banners:veteran_top", {
		description = " Banner",
		drawtype = "nodebox",
		tiles = {"banners_2b2t_vet_t.png"},
		inventory_image = "banners_2b2t_vet_t.png",
		wield_image = "banners_2b2t_vet_t.png",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 },
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "simple_banners:veteran_top",
		recipe = {
			{"wool:white", "default:diamond", "wool:white"},
			{"wool:white", "wool:black", "wool:white"},
			{"wool:white", "group:stick", "wool:white"},
		}
	})
	minetest.register_craft({
		output = "simple_banners:veteran_top",
		type = "shapeless",
		recipe = {
				  "simple_banners:plain", "simple_banners:veteran_top" ,
		}
	})	

	minetest.register_node("simple_banners:veteran_bottom", {
		description = " Banner",
		drawtype = "nodebox",
		tiles = {"banners_2b2t_vet_t.png^[transformFY"},
		inventory_image = "banners_2b2t_vet_t.png^[transformFY",
		wield_image = "banners_2b2t_vet_t.png^[transformFY",
		paramtype = "light",
		paramtype2 = "wallmounted",
		sunlight_propagates = true,
		walkable = false,
		node_box = {
			type = "wallmounted",
			wall_top    = {-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			wall_bottom = {-0.5, -0.5, -0.5, 0.5, -0.4375, 0.5},
			wall_side   = {-0.5, -0.5, -0.5, -0.4375, 0.5, 0.5},
		},
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3 },
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "simple_banners:veteran_bottom",
		recipe = {
			{"wool:white", "group:stick", "wool:white"},
			{"wool:white", "wool:black", "wool:white"},
			{"wool:white", "default:diamond", "wool:white"},
		}
	})
	minetest.register_craft({
		output = "simple_banners:veteran_bottom",
		type = "shapeless",
		recipe = {
				  "simple_banners:plain", "simple_banners:veteran_bottom" ,
		}
	})
	
end

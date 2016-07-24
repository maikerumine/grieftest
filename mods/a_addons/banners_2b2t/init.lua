-- Licensed under CC0.
-- Painting textures from Stunt Rally <https://code.google.com/p/vdrift-ogre/>, licensed under CC0.

local banners_2b2t = {}
--[[
banners_2b2t.dyes = {
	{"white",      "White"},
	{"grey",       "Grey"},
	{"black",      "Black"},
	{"red",        "Red"},
	{"yellow",     "Yellow"},
	{"green",      "Green"},
	{"cyan",       "Cyan"},
	{"blue",       "Blue"},
	{"magenta",    "Magenta"},
	{"orange",     "Orange",},
	{"violet",     "Violet"},
	{"brown",      "Brown"},
	{"pink",       "Pink"},
	{"dark_grey",  "Dark Grey"},
	{"dark_green", "Dark Green"},
}

for _, row in ipairs(banners_2b2t.dyes) do
	local name = row[1]
	local desc = row[2]
	minetest.register_node("banners_2b2t:" .. name, {
		description = " Banner",
		drawtype = "nodebox",
		tiles = {"banners_2b2t_" .. name .. ".png"},
		inventory_image = "banners_2b2t_" .. name .. ".png",
		wield_image = "banners_2b2t_" .. name .. ".png",
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
		output = "banners_2b2t:" .. name,
		recipe = {
			{"wool:white", "wool:white", "wool:white"},
			{"wool:white", "wool:" .. name, "wool:white"},
			{"wool:white", "group:stick", "wool:white"},
		}
	})
end
]]

--nomad
	minetest.register_node("banners_2b2t:nomad_top", {
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
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "banners_2b2t:nomad_top",
		recipe = {
			{"wool:white", "default:diamond", "wool:white"},
			{"wool:white", "wool:red", "wool:white"},
			{"wool:white", "group:stick", "wool:white"},
		}
	})
	
	
	minetest.register_node("banners_2b2t:nomad_bottom", {
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
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "banners_2b2t:nomad_bottom",
		recipe = {
			{"wool:white", "group:stick", "wool:white"},
			{"wool:white", "wool:red", "wool:white"},
			{"wool:white", "default:diamond", "wool:white"},
		}
	})

--rusher
	minetest.register_node("banners_2b2t:rusher_top", {
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
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "banners_2b2t:rusher_top",
		recipe = {
			{"wool:white", "default:diamond", "wool:white"},
			{"wool:white", "wool:white", "wool:white"},
			{"wool:white", "group:stick", "wool:white"},
		}
	})
	
	
	minetest.register_node("banners_2b2t:rusher_bottom", {
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
		output = "banners_2b2t:rusher_bottom",
		recipe = {
			{"wool:white", "group:stick", "wool:white"},
			{"wool:white", "wool:white", "wool:white"},
			{"wool:white", "default:diamond", "wool:white"},
		}
	})
	
--veteran
	minetest.register_node("banners_2b2t:veteran_top", {
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
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "banners_2b2t:veteran_top",
		recipe = {
			{"wool:white", "default:diamond", "wool:white"},
			{"wool:white", "wool:black", "wool:white"},
			{"wool:white", "group:stick", "wool:white"},
		}
	})
	
	
	minetest.register_node("banners_2b2t:veteran_bottom", {
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
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 3, flammable = 3},
		sounds = default.node_sound_wood_defaults(),
	})
	minetest.register_craft({
		output = "banners_2b2t:veteran_bottom",
		recipe = {
			{"wool:white", "group:stick", "wool:white"},
			{"wool:white", "wool:black", "wool:white"},
			{"wool:white", "default:diamond", "wool:white"},
		}
	})
	
	
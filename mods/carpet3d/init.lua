-- carpet3d by srifqi
-- License: CC0 1.0 Universal
print("[carpet3d] Carpet")
-- Carpet API
carpet3d = {}
carpet3d.count = 0

-- Registering carpet ( carpet3d.register() )
--[[
	def is a table that contains:
	name		: itemstring "carpet:name"
	description	: node description (optional)
	images		: node tiles
	recipeitem	: node crafting recipeitem {recipeitem,recipeitem}
	groups		: node groups
	sounds		: node sounds (optional)
--]]
-- Carpet will be named carpet3d:name
function carpet3d.register(def)
	local name = def.name
	local desc = def.description or ""
	local recipeitem = def.recipeitem
	local sounds = def.sounds or default.node_sound_defaults()
	-- Node Definition
	minetest.register_node("carpet3d:"..name, {
		description = desc,
		tiles = def.images,
		paramtype = "light",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -7/16, 0.5},
		},
		drawtype = "nodebox",
		groups = def.groups,
		sounds = sounds,
	})
	-- Crafting Definition
	minetest.register_craft({
		output = 'carpet3d:'..name..' 4',
		recipe = {
			{recipeitem, recipeitem},
		}
	})
	carpet3d.count = carpet3d.count +1
end

-- For internal purpose
minetest.register_node("carpet3d:nil", {
	description = "nil Carpet (ERR)",
	tiles = "default_dirt.png",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -7/16, 0.5},
	},
	drawtype = "nodebox",
	groups = {carpet=1,not_in_creative_inventory=1},
	sounds = default.node_sound_defaults(),
})

-- Add carpet from wool mod + default mod + moretrees mod (if available)
local wool_list = {
	{"white",		"White"},
	{"grey",		"Grey"},
	{"black",		"Black"},
	{"red",			"Red"},
	{"yellow",		"Yellow"},
	{"green",		"Green"},
	{"cyan",		"Cyan"},
	{"blue",		"Blue"},
	{"magenta",		"Magenta"},
	{"orange",		"Orange"},
	{"violet",		"Violet"},
	{"brown",		"Brown"},
	{"pink",		"Pink"},
	{"dark_grey",	"Dark Grey"},
	{"dark_green",	"Dark Green"},
}

local decor_list = {
	--{"default:leaves","default_leaves","Leaves"},
	--{"default:jungleleaves","default_jungleleaves","Jungle Leaves"},
	--{"default:papyrus","default_papyrus","Papyrus"},
	--{"default:sapling","default_sapling","Sapling"},
	--{"default:junglesapling","default_junglesapling","Jungle Sapling"},
}

local front_list = {
	--{"default:apple","default_apple","Apple"},
	--{"flowers:dandelion_white","flowers_dandelion_white","White Dandelion"},
	--{"flowers:dandelion_yellow","flowers_dandelion_yellow","Yellow Dandelion"},
	--{"flowers:geranium","flowers_geranium","Geranium"},
	--{"flowers:rose","flowers_rose","Rose"},
	--{"flowers:tulip","flowers_tulip","Tulip"},
	--{"flowers:viola","flowers_viola","Viola"},
}

local moretrees = {}

if minetest.get_modpath("moretrees") then
	print("[carpet3d]:Mod detected: moretrees.")
	moretrees = {
		{"oak",			"Oak Tree"},
		{"sequoia",		"Giant Sequoia"},
		{"birch",		"Birch Tree"},
		{"palm",		"Palm Tree"},
		{"spruce",		"Spruce Tree"},
		{"pine",		"Pine Tree"},
		{"willow",		"Willow Tree"},
		{"acacia",		"Acacia Tree"},
		{"rubber_tree",	"Rubber Tree"},
		{"fir",			"Douglas Fir"},
	}
end

for _, row in ipairs(wool_list) do
	local name = row[1]
	local desc = row[2]
	carpet3d.register({
		name = name,
		description = desc..' Carpet',
		images = {'wool_'..name..'.png'},
		recipeitem = 'wool:'..name,
		groups = {snappy=2,choppy=2,oddly_breakable_by_hand=3,flammable=3,falling_node=1,carpet=1},
		sounds = default.node_sound_defaults()
	})
	for i=1, #decor_list do
		carpet3d.register({
			name = name.."_with_"..decor_list[i][2],
			description = desc..' Carpet with '..decor_list[i][3],
			images = {
				'wool_'..name..'.png^'..decor_list[i][2]..'.png',
				'wool_'..name..'.png^'..decor_list[i][2]..'.png',
				'wool_'..name..'.png'
			},
			recipeitem = 'carpet3d:nil',
			groups = {
				snappy=2,choppy=2,
				oddly_breakable_by_hand=3,flammable=3,
				falling_node=1,carpet=1,
				not_in_creative_inventory=1 -- don't make creative inventory full
			},
			sounds = default.node_sound_defaults()
		})
		minetest.register_craft({
			type = "shapeless",
			output = "carpet3d:"..name.."_with_"..decor_list[i][2],
			recipe = {"carpet3d:"..name, decor_list[i][1]},
		})
	end
	for fi=1, #front_list do
		carpet3d.register({
			name = name.."_with_"..front_list[fi][2],
			description = desc..' Carpet with '..front_list[fi][3],
			images = {
				'wool_'..name..'.png^'..front_list[fi][2]..'.png',
				'wool_'..name..'.png^'..front_list[fi][2]..'.png',
				'wool_'..name..'.png'
			},
			recipeitem = 'carpet3d:nil',
			groups = {
				snappy=2,choppy=2,
				oddly_breakable_by_hand=3,flammable=3,
				falling_node=1,carpet=1,
				not_in_creative_inventory=1 -- don't make creative inventory full
			},
			sounds = default.node_sound_defaults()
		})
		minetest.register_craft({
			type = "shapeless",
			output = "carpet3d:"..name.."_with_"..front_list[fi][2],
			recipe = {"carpet3d:"..name, front_list[fi][1]},
		})
		for i=1, #decor_list do
			carpet3d.register({
				name = name.."_with_"..decor_list[i][2].."_and_"..front_list[fi][2],
				description = desc..' Carpet with '..decor_list[i][3].." and "..front_list[fi][2],
				images = {
					'wool_'..name..'.png^'..decor_list[i][2]..'.png^'..front_list[fi][2]..'.png',
					'wool_'..name..'.png^'..decor_list[i][2]..'.png^'..front_list[fi][2]..'.png',
					'wool_'..name..'.png'
				},
				recipeitem = 'carpet3d:nil',
				groups = {
					snappy=2,choppy=2,
					oddly_breakable_by_hand=3,flammable=3,
					falling_node=1,carpet=1,
					not_in_creative_inventory=1 -- don't make creative inventory full
				},
				sounds = default.node_sound_defaults()
			})
			minetest.register_craft({
				type = "shapeless",
				output = "carpet3d:"..name.."_with_"..decor_list[i][2].."_and_"..front_list[fi][2],
				recipe = {"carpet3d:"..name.."_with_"..decor_list[i][2], front_list[fi][1]},
			})
		end
	end
	for i=1, #moretrees do
		local treename = moretrees[i][1]
		local treedesc = moretrees[i][2]
		--sapling
		carpet3d.register({
			name = name.."_with_"..treename.."_sapling",
			description = desc..' Carpet with '..treedesc.." Sapling",
			images = {
				'wool_'..name..'.png^'..'moretrees_'..treename..'_sapling.png',
				'wool_'..name..'.png^'..'moretrees_'..treename..'_sapling.png',
				'wool_'..name..'.png'
			},
			recipeitem = 'carpet3d:nil',
			groups = {
				snappy=2,choppy=2,
				oddly_breakable_by_hand=3,flammable=3,
				falling_node=1,carpet=1,
				not_in_creative_inventory=1 -- don't make creative inventory full
			},
			sounds = default.node_sound_defaults()
		})
		minetest.register_craft({
			type = "shapeless",
			output = "carpet3d:"..name.."_with_"..treename.."_sapling",
			recipe = {"carpet3d:"..name, "moretrees:"..treename.."_sapling"},
		})
		--leaves
		carpet3d.register({
			name = name.."_with_"..treename.."_leaves",
			description = desc..' Carpet with '..treedesc.." Leaves",
			images = {
				'wool_'..name..'.png^'..'moretrees_'..treename..'_leaves.png',
				'wool_'..name..'.png^'..'moretrees_'..treename..'_leaves.png',
				'wool_'..name..'.png'
			},
			recipeitem = 'carpet3d:nil',
			groups = {
				snappy=2,choppy=2,
				oddly_breakable_by_hand=3,flammable=3,
				falling_node=1,carpet=1,
				not_in_creative_inventory=1 -- don't make creative inventory full
			},
			sounds = default.node_sound_defaults()
		})
		minetest.register_craft({
			type = "shapeless",
			output = "carpet3d:"..name.."_with_"..treename.."_leaves",
			recipe = {"carpet3d:"..name, "moretrees:"..treename.."_leaves"},
		})
	end
end

print("[carpet3d]:"..carpet3d.count.." carpets registered")
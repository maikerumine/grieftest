-- some classic C64 game chiptunes:
local discs = {
	-- Track name                                           Color
	{ "Critical Mass",                                      "yellow", },
	{ "Project Stealth Fighter (J.S. Bach)",                "blue",   },
	{ "Adidas Championship Football",                       "pink",   },
	{ "Out Run",                                            "green",  },
	{ "Back To The Future II",                              "red",    },
	{ "Airwolf",                                            "white", },
}

-- jukebox crafting

minetest.register_craft({
	output = 'jdukebox:box',
	recipe = {
		{'group:wood', 'group:wood',      'group:wood'},
		{'group:wood', 'default:diamond', 'group:wood'},
		{'group:wood', 'group:wood',      'group:wood'},
	}
})

minetest.register_node("jdukebox:box", {
	description = "Jukebox",
	tiles = {"jdukebox_top.png", "jdukebox_side.png"},
	groups = {oddly_breakable_by_hand=1, flammable=1, choppy=3},
	on_rightclick = function(pos, node, clicker, itemstack)	
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local wield = clicker:get_wielded_item():get_name()
		if inv:is_empty("main") then
			if string.find(wield, "jdukebox:disc") then
				inv:set_stack("main", 1, itemstack:take_item())
				local discid = wield:match("jdukebox:disc_(%d)")
				meta:set_string("hwnd", minetest.sound_play("jukebox_track_"..discid, {pos = pos, loop = true, gain = 10, max_hear_distance = 100}))
			end
		else
			local drop_pos = minetest.find_node_near(pos, 1, "air")
			if drop_pos == nil then drop_pos = {x=pos.x, y=pos.y+1, z=pos.z} end
			minetest.add_item(drop_pos, inv:get_stack("main", 1))
			if meta:get_string("hwnd") then minetest.sound_stop(meta:get_string("hwnd")) end
			inv:remove_item("main", inv:get_stack("main", 1))
		end

	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("main", 1)
	end,	
	on_destruct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if not inv:is_empty("main") then
			local drop_pos = minetest.find_node_near(pos, 1, "air")
			if drop_pos == nil then drop_pos = {x=pos.x, y=pos.y+1,z=pos.z} end
			minetest.add_item(drop_pos, inv:get_stack("main", 1))
			if meta:get_string("hwnd") then minetest.sound_stop(meta:get_string("hwnd")) end
		end
	end,
})

for i = 1, #discs do
	local track_name, dye = discs[i][1], discs[i][2]

	minetest.register_alias("jdukebox:box"..i, "jdukebox:box")

	minetest.register_craftitem("jdukebox:disc_"..i, {
		description = track_name,
		inventory_image = "jdukebox_disc_"..i..".png",
		stack_max = 1,
	})

	minetest.register_craft({
		output = "jdukebox:disc_"..i,
		recipe = {
			{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
			{"default:coal_lump", "dye:"..dye,         "default:coal_lump"},
			{"default:coal_lump", "default:coal_lump", "default:coal_lump"},
		}
	})
end

minetest.register_craft({
	type = "fuel",
	recipe = "jdukebox:box",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mesecons_noteblock:noteblock",
	burntime = 30,
})



-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too
default = {}

default.LIGHT_MAX = 14



-- GUI related stuff
--default.gui_bg = "bgcolor[#080808BB;true]"
default.gui_bg = "bgcolor[#080000BB;true]"
default.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
default.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"

function default.get_hotbar_bg(x,y)
	local out = ""
	for i=0,7,1 do
		out = out .."image["..x+i..","..y..";1,1;gui_hb_bg.png]"
	end
	return out
end

default.gui_survival_form = "size[9,8.5]"..
			default.gui_bg..
			default.gui_bg_img..
			default.gui_slots..
			"list[current_player;main;0,4.25;9,1;]"..  --9 was 8
			"list[current_player;main;0,5.5;9,3;9]"..  --9 was 8
			"list[current_player;craft;1.75,0.5;3,3;]"..
			"list[current_player;craftpreview;5.75,1.5;1,1;]"..
			"image[4.75,1.5;1,1;gui_furnace_arrow_bg.png^[transformR270]"..
			"listring[current_player;main]"..
			"listring[current_player;craft]"..
			default.get_hotbar_bg(0,4.25)

			
minetest.register_on_joinplayer(function(player)
	--init inventory
	player:get_inventory():set_width("main", 9)
	player:get_inventory():set_size("main", 36)

end)			
			
			
			
			
			
-- Load files
dofile(minetest.get_modpath("default").."/functions.lua")
dofile(minetest.get_modpath("default").."/rnd_antigrief.lua")
dofile(minetest.get_modpath("default").."/nodes.lua")
dofile(minetest.get_modpath("default").."/fire.lua")
dofile(minetest.get_modpath("default").."/furnace.lua")
dofile(minetest.get_modpath("default").."/goldenapple.lua")
--dofile(minetest.get_modpath("default").."/enderchest.lua")
dofile(minetest.get_modpath("default").."/dropondeath.lua")
dofile(minetest.get_modpath("default").."/killme.lua")
dofile(minetest.get_modpath("default").."/tools.lua")
dofile(minetest.get_modpath("default").."/craftitems.lua")
dofile(minetest.get_modpath("default").."/crafting.lua")
dofile(minetest.get_modpath("default").."/mapgen.lua")
dofile(minetest.get_modpath("default").."/player.lua")
dofile(minetest.get_modpath("default").."/portal.lua")
dofile(minetest.get_modpath("default").."/portal2.lua")
dofile(minetest.get_modpath("default").."/mcl_end.lua")
dofile(minetest.get_modpath("default").."/trees.lua")
dofile(minetest.get_modpath("default").."/torch.lua")
dofile(minetest.get_modpath("default").."/aliases.lua")
dofile(minetest.get_modpath("default").."/legacy.lua")
dofile(minetest.get_modpath("default").."/mapfix.lua")
dofile(minetest.get_modpath("default").."/builtin.lua")



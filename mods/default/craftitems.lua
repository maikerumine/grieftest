-- mods/default/craftitems.lua

minetest.register_craftitem("default:stick", {
	description = "Stick",
	inventory_image = "default_stick.png",
	groups = {stick = 1},
	stack_max = 64,
})

minetest.register_craftitem("default:paper", {
	description = "Paper",
	inventory_image = "default_paper.png",
	stack_max = 64,
})

local lpp = 14 -- Lines per book's page
local function book_on_use(itemstack, user)
	local player_name = user:get_player_name()
	local data = minetest.deserialize(itemstack:get_metadata())
	local formspec, title, text, owner = "", "", "", player_name
	local page, page_max, lines, string = 1, 1, {}, ""

	if data then
		title = data.title
		text = data.text
		owner = data.owner

		for str in (text .. "\n"):gmatch("([^\n]*)[\n]") do
			lines[#lines+1] = str
		end

		if data.page then
			page = data.page
			page_max = data.page_max

			for i = ((lpp * page) - lpp) + 1, lpp * page do
				if not lines[i] then break end
				string = string .. lines[i] .. "\n"
			end
		end
	end

	if owner == player_name then
		formspec = "size[8,8]" .. default.gui_bg ..
			default.gui_bg_img ..
			"field[0.5,1;7.5,0;title;Title:;" ..
				minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;text;Contents:;" ..
				minetest.formspec_escape(text) .. "]" ..
			"button_exit[2.5,7.5;3,1;save;Save]"
	else
		formspec = "size[8,8]" .. default.gui_bg ..
			default.gui_bg_img ..
			"label[0.5,0.5;by " .. owner .. "]" ..
			"tablecolumns[color;text]" ..
			"tableoptions[background=#00000000;highlight=#00000000;border=false]" ..
			"table[0.4,0;7,0.5;title;#FFFF00," .. minetest.formspec_escape(title) .. "]" ..
			"textarea[0.5,1.5;7.5,7;;" ..
				minetest.formspec_escape(string ~= "" and string or text) .. ";]" ..
			"button[2.4,7.6;0.8,0.8;book_prev;<]" ..
			"label[3.2,7.7;Page " .. page .. " of " .. page_max .. "]" ..
			"button[4.9,7.6;0.8,0.8;book_next;>]"
	end

	minetest.show_formspec(player_name, "default:book", formspec)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "default:book" then return end
	local inv = player:get_inventory()
	local stack = player:get_wielded_item()

	if fields.save and fields.title ~= "" and fields.text ~= "" then
		local new_stack, data
		if stack:get_name() ~= "default:book_written" then
			local count = stack:get_count()
			if count == 1 then
				stack:set_name("default:book_written")
			else
				stack:set_count(count - 1)
				new_stack = ItemStack("default:book_written")
			end
		else
			data = minetest.deserialize(stack:get_metadata())
		end

		if not data then data = {} end
		data.title = fields.title
		data.text = fields.text
		data.text_len = #data.text
		data.page = 1
		data.page_max = math.ceil((#data.text:gsub("[^\n]", "") + 1) / lpp)
		data.owner = player:get_player_name()
		local data_str = minetest.serialize(data)

		if new_stack then
			new_stack:set_metadata(data_str)
			if inv:room_for_item("main", new_stack) then
				inv:add_item("main", new_stack)
			else
				minetest.add_item(player:getpos(), new_stack)
			end
		else
			stack:set_metadata(data_str)
		end

	elseif fields.book_next or fields.book_prev then
		local data = minetest.deserialize(stack:get_metadata())
		if not data.page then return end

		if fields.book_next then
			data.page = data.page + 1
			if data.page > data.page_max then
				data.page = 1
			end
		else
			data.page = data.page - 1
			if data.page == 0 then
				data.page = data.page_max
			end
		end

		local data_str = minetest.serialize(data)
		stack:set_metadata(data_str)
		book_on_use(stack, player)
	end

	player:set_wielded_item(stack)
end)

minetest.register_craftitem("default:book", {
	description = "Book",
	inventory_image = "default_book.png",
	groups = {book = 1},
	on_use = book_on_use,
	stack_max = 64,
})

minetest.register_craftitem("default:book_written", {
	description = "Book With Text",
	inventory_image = "mcl_books_book_written.png",
	groups = {book = 1, not_in_creative_inventory = 1},
	stack_max = 1,
	on_use = book_on_use,
})

minetest.register_craft({
	type = "shapeless",
	output = "default:book_written",
	recipe = {"default:book", "default:book_written"}
})

minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() ~= "default:book_written" then
		return
	end

	local copy = ItemStack("default:book_written")
	local original
	local index
	for i = 1, player:get_inventory():get_size("craft") do
		if old_craft_grid[i]:get_name() == "default:book_written" then
			original = old_craft_grid[i]
			index = i
		end
	end
	if not original then
		return
	end
	local copymeta = original:get_metadata()
	-- copy of the book held by player's mouse cursor
	itemstack:set_metadata(copymeta)
	-- put the book with metadata back in the craft grid
	craft_inv:set_stack("craft", index, original)
end)

minetest.register_craftitem("default:coal_lump", {
	description = "Coal Lump",
	inventory_image = "default_coal_lump.png",
	groups = {coal = 1},
	stack_max = 64,
})

--Charcoal :)
minetest.register_craftitem("default:charcoal", {
	description = "Charcoal",
	inventory_image = "charcoal.png",
	groups = {coal = 1},
	stack_max = 64,
})

minetest.register_alias("default:iron_lump", "default:stone_with_iron")
--minetest.register_craftitem("default:stone_with_iron", {
--	description = "Iron Ore",
--	inventory_image = "default_stone.png^default_mineral_iron.png",
--	stack_max = 64,
--})

minetest.register_craftitem("default:iron_nugget", {
	description = "Iron Nugget",
	_doc_items_longdesc = "Iron nuggets are very small pieces of molten iron; the main purpose is to create iron ingots.",
	inventory_image = "default_iron_nugget.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_craftitem("default:gold_nugget", {
	description = "Gold Nugget",
	_doc_items_longdesc = "Gold nuggets are very small pieces of molten gold; the main purpose is to create gold ingots.",
	inventory_image = "default_gold_nugget.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_craftitem("default:mese_crystal", {
	description = "Mese Crystal",
	inventory_image = "default_mese_crystal.png",
	stack_max = 64,
})

minetest.register_craftitem("default:gold_lump", {
	description = "Gold Lump",
	inventory_image = "default_gold_lump.png",
	stack_max = 64,
})

minetest.register_craftitem("default:emerald_crystal", {
	description = "Emerald Crystal",
	inventory_image = "default_emerald.png",
	stack_max = 64,
})

minetest.register_craftitem("default:diamond", {
	description = "Diamond",
	inventory_image = "default_diamond.png",
	stack_max = 64,
})

minetest.register_craftitem("default:clay_lump", {
	description = "Clay Lump",
	inventory_image = "default_clay_lump.png",
	stack_max = 64,
})

minetest.register_craftitem("default:steel_ingot", {
	description = "Steel Ingot",
	inventory_image = "default_steel_ingot.png",
	stack_max = 64,
})

minetest.register_craftitem("default:gold_ingot", {
	description = "Gold Ingot",
	inventory_image = "default_gold_ingot.png",
	stack_max = 64,
})

minetest.register_craftitem("default:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "default_mese_crystal_fragment.png",
	stack_max = 64,
})

minetest.register_craftitem("default:clay_brick", {
	description = "Clay Brick",
	inventory_image = "default_clay_brick.png",
	stack_max = 64,
})

minetest.register_craftitem("default:obsidian_shard", {
	description = "Obsidian Shard",
	inventory_image = "default_obsidian_shard.png",
	stack_max = 64,
})

minetest.register_craftitem("default:flint", {
	description = "Flint",
	inventory_image = "default_flint.png",
	stack_max = 64,
})


minetest.register_craftitem("default:bowl",{
	description = "Bowl",
	_doc_items_longdesc = "Bowls are mainly used to hold tasty soups.",
	inventory_image = "default_bowl.png",
	stack_max = 64,
	groups = { craftitem = 1 },
})

-- Nether and Realm Craftitems
minetest.register_craftitem(":default:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "default_mese_crystal_fragment.png",
	on_place = function(stack, _, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:obsidian" then
			local done = make_portal(pt.under)
			if done and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end

		return stack
	end,
})

minetest.register_craftitem(":default:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "default_mese_crystal_fragment.png",
	on_place = function(stack, _, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:emeraldblock" then
			local done2 = make_portal2(pt.under)
			if done2 and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
			end
		end

		return stack
	end,
})

-- Flint and steel
minetest.register_tool(":default:flint_and_steel", {
	description = "Flint and Steel",
	inventory_image = "fire_flint_steel.png",
	on_use = function(itemstack, user, pointed_thing)
		itemstack:add_wear(1000)
		local pt = pointed_thing
		if pt.type == "node" then
			local node_under = minetest.get_node(pt.under).name
			local is_coalblock = node_under == "default:coalblock"
			local is_rack = node_under == "default:rack"
			local is_tnt = node_under == "tnt:tnt"
			local is_gunpowder = node_under == "tnt:gunpowder"
			if minetest.get_item_group(node_under, "flammable") >= 1 or
					is_coalblock or is_rack or is_tnt or is_gunpowder then
				local flame_pos = pt.above
				if is_coalblock then
					flame_pos = {x = pt.under.x, y = pt.under.y + 1, z = pt.under.z}
				elseif is_tnt or is_gunpowder then
					flame_pos = pt.under
				end
				if minetest.get_node(flame_pos).name == "air" or
						is_tnt or is_gunpowder then
					local player_name = user:get_player_name()
					if not minetest.is_protected(flame_pos, player_name) then
						if is_coalblock then
							minetest.set_node(flame_pos,
								{name = "default:permanent_flame"})
						elseif is_rack then
							minetest.set_node(flame_pos,
								{name = "default:permanent_flame"})
						elseif is_tnt then
							minetest.set_node(flame_pos,
								{name = "tnt:tnt_burning"})
						elseif is_gunpowder then
							minetest.set_node(flame_pos,
								{name = "tnt:gunpowder_burning"})
						else
							minetest.set_node(flame_pos,
								{name = "default:basic_flame"})
						end
					else
						minetest.chat_send_player(player_name, "This area is protected")
					end
				end
			end
		end
		if not minetest.setting_getbool("creative_mode") then
			return itemstack
		end
	end,
	--nether
	on_place = function(stack,_, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:obsidian" then
			done = make_portal(pt.under)  --broken please fix for y
			if done and not minetest.setting_getbool("creative_mode") then
				--stack:take_item()
				stack:add_wear(1000)
			end
		end
		return stack
	end,
	
	
})



--Quartz Crystal
minetest.register_craftitem("default:quartz_crystal", {
	description = "Quartz Crystal",
	inventory_image = "quartz_crystal_full.png",
	stack_max = 64,
	--end
	on_place = function(stack,_, pt)
		if pt.under and minetest.get_node(pt.under).name == "default:purpur_block" then
			done3 = make_end_portal(pt.under)  --broken please fix for y
			if done3 and not minetest.setting_getbool("creative_mode") then
				stack:take_item()
				--stack:add_wear(1000)
			end
		end
		return stack
	end,
})
minetest.register_craftitem("default:quartz_crystal_piece", {
	description = "Quartz Crystal Piece",
	inventory_image = "quartz_crystal_piece.png",
	stack_max = 64,
})



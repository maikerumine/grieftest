--table length thing
function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end
--if in table thing
function intable(tbl, item)
    for key, value in pairs(tbl) do
        if value == item then return key end
    end
    return false
end
	

--DONE   current goal, give a pickaxe a random table of enchantments - 

--DONE for the cherry pick enchantment, do an on_dignode function for all players, then check for the enchantment, drop the item that was mined using player:dig_node

--do multiple levels for these

--DONE make the thing slowly raise the tool with a sound, make a noise with particles and throw the tool at the player

--possibly a max level enchant? maybe?

--damage group enchant?

--DONE make the enchantment box use the moving water texture, with an overlay, to make it look like it's magic

--make the enchantment box randomly eat items instead of enchanting them

--make the enchantment box explode, and kill player's in area on rare occasions

--make the enchant box clear the player's inventory on RARE occasions

--modify treecapitator to use voxel manip

--make bad effects also happen


enchant = {}

enchant.enchantments_pick = {
"speed", --speed (check a .after thing to tell how fast you'll dig it.) 
"durable", --resistance or infinity - 1 is resistance 2 is infinity
"luck", --get multiple items
"cherry pick", --similar to silk touch in MC
}
enchant.pick = {
--"default:pick_bronze",
"default:pick_diamond",
"default:pick_mese",
"default:pick_steel",
"default:pick_stone",
"default:pick_wood",
}

--since tools can't be modified on the fly, I have to do this. 384 tools from 6. GREAT.
--pickaxe enchantments
for x = 1,tablelength(enchant.pick) do
	print(enchant.pick[x])
	--try to do this some other, maybe
	for a = 0,1 do --speed
	for b = 0,1 do --durable
	for c = 0,1 do --luck
	for d = 0,1 do --cherry pick
	if a.."_"..b.."_"..c.."_"..d ~= "0_0_0_0" then -- no enchantments, then don't duplicate the tool

		--name the tool, and define it
		local tool = enchant.pick[x]
		local name = minetest.registered_items[enchant.pick[x]]["description"]
		if a == 1 then
			name = name.."\n-Speed"
		end
		if b == 1 then
			name = name.."\n-Durable"
		end
		if c == 1 then
			name = name.."\n-Luck"
		end
		if d == 1 then
			name = name.."\n-Cherry Pick"
		end
		--print(tool.."_"..a.."_"..b.."_"..c.."_"..d)
		--add the enchant to the tools - don't add to the logic above to improve readability
		--global because of bugs with registered tools or something

		local table = {}
		local uses = 0
		local maxlevel = 0
		--if enchanted with speed, half time, if not, use standard tool time.
		if a == 1 then
			for i = 1,3 do
				if  minetest.registered_tools[enchant.pick[x]]["tool_capabilities"]["groupcaps"]["cracky"]["times"][i] then
					table[i] = minetest.registered_tools[enchant.pick[x]]["tool_capabilities"]["groupcaps"]["cracky"]["times"][i]/2
				end
			end
		else
			table = minetest.registered_tools[enchant.pick[x]]["tool_capabilities"]["groupcaps"]["cracky"]["times"]
		end
		--if enchanted with durable, double the uses, if not, use standard uses.
		if b == 1 then
			uses = minetest.registered_tools[enchant.pick[x]]["tool_capabilities"]["groupcaps"]["cracky"]["uses"] * 2
		else
			uses = minetest.registered_tools[enchant.pick[x]]["tool_capabilities"]["groupcaps"]["cracky"]["uses"]
		end
		--possibly turn this into enchant
		maxlevel = minetest.registered_tools[enchant.pick[x]]["tool_capabilities"]["groupcaps"]["cracky"]["maxlevel"]

		minetest.register_tool(":"..tool.."_"..a.."_"..b.."_"..c.."_"..d, {
			description = name,
			inventory_image = minetest.registered_items[enchant.pick[x]]["inventory_image"],
			groups = {not_in_creative_inventory=1,enchanted_pick=1,luck=c,cherry_pick=d}, --don't clutter the inventory
			tool_capabilities = {
				--full_punch_interval = 1.3,
				--max_drop_level=0,
				groupcaps={
					cracky = {times=table, uses=uses, maxlevel=maxlevel},
				},
				damage_groups = {fleshy=3},
			},
		})
	end
	end
	end
	end
	end	
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------

enchant.enchantments_shovel = {
"speed", --speed (check a .after thing to tell how fast you'll dig it.) 
"durable", --resistance or infinity - 1 is resistance 2 is infinity
"luck", --get multiple items
"cherry pick", --similar to silk touch in MC
}
enchant.shovel = {
--"default:shovel_bronze",
"default:shovel_diamond",
"default:shovel_mese",
"default:shovel_steel",
"default:shovel_stone",
"default:shovel_wood",
}

--since tools can't be modified on the fly, I have to do this. 384 tools from 6. GREAT.
--pickaxe enchantments
for x = 1,tablelength(enchant.shovel) do
	print(enchant.shovel[x])
	--try to do this some other, maybe
	for a = 0,1 do --speed
	for b = 0,1 do --durable
	for c = 0,1 do --luck
	for d = 0,1 do --cherry pick
	if a.."_"..b.."_"..c.."_"..d ~= "0_0_0_0" then -- no enchantments, then don't duplicate the tool

		--name the tool, and define it
		local tool = enchant.shovel[x]
		local name = minetest.registered_items[enchant.shovel[x]]["description"]
		if a == 1 then
			name = name.."\n-Speed"
		end
		if b == 1 then
			name = name.."\n-Durable"
		end
		if c == 1 then
			name = name.."\n-Luck"
		end
		if d == 1 then
			name = name.."\n-Cherry Pick"
		end
		--print(tool.."_"..a.."_"..b.."_"..c.."_"..d)
		--add the enchant to the tools - don't add to the logic above to improve readability
		--global because of bugs with registered tools or something

		local table = {}
		local uses = 0
		local maxlevel = 0
		--if enchanted with speed, half time, if not, use standard tool time.
		if a == 1 then
			for i = 1,3 do
				if  minetest.registered_tools[enchant.shovel[x]]["tool_capabilities"]["groupcaps"]["crumbly"]["times"][i] then
					table[i] = minetest.registered_tools[enchant.shovel[x]]["tool_capabilities"]["groupcaps"]["crumbly"]["times"][i]/2
				end
			end
		else
			table = minetest.registered_tools[enchant.shovel[x]]["tool_capabilities"]["groupcaps"]["crumbly"]["times"]
		end
		--if enchanted with durable, double the uses, if not, use standard uses.
		if b == 1 then
			uses = minetest.registered_tools[enchant.shovel[x]]["tool_capabilities"]["groupcaps"]["crumbly"]["uses"] * 2
		else
			uses = minetest.registered_tools[enchant.shovel[x]]["tool_capabilities"]["groupcaps"]["crumbly"]["uses"]
		end
		--possibly turn this into enchant
		maxlevel = minetest.registered_tools[enchant.shovel[x]]["tool_capabilities"]["groupcaps"]["crumbly"]["maxlevel"]

		minetest.register_tool(":"..tool.."_"..a.."_"..b.."_"..c.."_"..d, {
			description = name,
			inventory_image = minetest.registered_items[enchant.shovel[x]]["inventory_image"],
			groups = {not_in_creative_inventory=1,enchanted_shovel=1,luck=c,cherry_pick=d}, --don't clutter the inventory
			tool_capabilities = {
				--full_punch_interval = 1.3,
				--max_drop_level=0,
				groupcaps={
					crumbly = {times=table, uses=uses, maxlevel=maxlevel},
				},
				damage_groups = {fleshy=3},
			},
		})
	end
	end
	end
	end
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

enchant.enchantments_axe = {
"speed", --speed (check a .after thing to tell how fast you'll dig it.) 
"durable", --resistance or infinity - 1 is resistance 2 is infinity
"luck", --get multiple items
"tree feller", --My favorite MC mod - replaces cherry pick
}
enchant.axe = {
--"default:axe_bronze",
"default:axe_diamond",
"default:axe_mese",
"default:axe_steel",
"default:axe_stone",
"default:axe_wood",
}

--since tools can't be modified on the fly, I have to do this. 384 tools from 6. GREAT.
--pickaxe enchantments
for x = 1,tablelength(enchant.axe) do
	--print(enchant.axe[x])
	--try to do this some other, maybe
	for a = 0,1 do --speed
	for b = 0,1 do --durable
	for c = 0,1 do --luck
	for d = 0,1 do --tree feller
	if a.."_"..b.."_"..c.."_"..d ~= "0_0_0_0" then -- no enchantments, then don't duplicate the tool

		--name the tool, and define it
		local tool = enchant.axe[x]
		local name = minetest.registered_items[enchant.axe[x]]["description"]
		if a == 1 then
			name = name.."\n-Speed"
		end
		if b == 1 then
			name = name.."\n-Durable"
		end
		if c == 1 then
			name = name.."\n-Luck"
		end
		if d == 1 then
			name = name.."\n-Tree Feller"
		end
		--print(tool.."_"..a.."_"..b.."_"..c.."_"..d)
		--add the enchant to the tools - don't add to the logic above to improve readability
		--global because of bugs with registered tools or something

		local table = {}
		local uses = 0
		local maxlevel = 0
		--if enchanted with speed, half time, if not, use standard tool time.
		if a == 1 then
			for i = 1,3 do
				if  minetest.registered_tools[enchant.axe[x]]["tool_capabilities"]["groupcaps"]["choppy"]["times"][i] then
					table[i] = minetest.registered_tools[enchant.axe[x]]["tool_capabilities"]["groupcaps"]["choppy"]["times"][i]/2
				end
			end
		else
			table = minetest.registered_tools[enchant.axe[x]]["tool_capabilities"]["groupcaps"]["choppy"]["times"]
		end
		--if enchanted with durable, double the uses, if not, use standard uses.
		if b == 1 then
			uses = minetest.registered_tools[enchant.axe[x]]["tool_capabilities"]["groupcaps"]["choppy"]["uses"] * 2
		else
			uses = minetest.registered_tools[enchant.axe[x]]["tool_capabilities"]["groupcaps"]["choppy"]["uses"]
		end
		--possibly turn this into enchant
		maxlevel = minetest.registered_tools[enchant.axe[x]]["tool_capabilities"]["groupcaps"]["choppy"]["maxlevel"]

		minetest.register_tool(":"..tool.."_"..a.."_"..b.."_"..c.."_"..d, {
			description = name,
			inventory_image = minetest.registered_items[enchant.axe[x]]["inventory_image"],
			groups = {not_in_creative_inventory=1,enchanted_axe=1,luck=c,tree_feller=d}, --don't clutter the inventory
			tool_capabilities = {
				--full_punch_interval = 1.3,
				--max_drop_level=0,
				groupcaps={
					choppy = {times=table, uses=uses, maxlevel=maxlevel},
				},
				damage_groups = {fleshy=3},
			},
		})
	end
	end
	end
	end
	end	
end




local enchant_top = {
	name = "default_water_source_animated.png^[colorize:red:120^enchant_table_top.png",
	animation = {
		type = "vertical_frames",
		aspect_w = 16,
		aspect_h = 16,
		length = 2.0,
	},
}
function clear_inv(player)
	local inv = player:get_inventory()
	local size = inv:get_size("main")
	for i = 1,size do 
		local stack = inv:get_stack("main", i)
		inv:set_stack("main", i, "")
	end
end

function decimate_player_with_crucible(pos)
	local radius = 3
	local min = {x=pos.x-radius,y=pos.y-radius,z=pos.z-radius}
	local max = {x=pos.x+radius,y=pos.y+radius,z=pos.z+radius}
	local vm = minetest.get_voxel_manip()	
	local emin, emax = vm:read_from_map(min,max)
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()

	for x = -radius,radius do
	for y = -radius,radius do
	for z = -radius,radius do
	if x*x+y*y+z*z <= radius * radius + radius then --from sfan5's nuke mod (1.6)
		local p_pos = area:index(pos.x+x,pos.y+y,pos.z+z)
		data[p_pos] = minetest.get_content_id("air")
	end
	end
	end
	end

	vm:set_data(data)
	vm:calc_lighting()
	vm:write_to_map()
	vm:update_map()
	minetest.forceload_block(pos)

	--kill players and delete objects
	for _,object in ipairs(minetest.env:get_objects_inside_radius(pos, radius)) do
		if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
			object:remove()
		end
		if object:is_player() then
			object:set_hp(0)
			clear_inv(object)		
		end
	end
end


minetest.register_node("enchant:crucible", {
	description = "Crucible",

	--Thanks to Gambit and kilbith for this
	tiles = {enchant_top,"enchant_table_bottom.png","enchant_table_side.png","enchant_table_side.png","enchant_table_side.png","enchant_table_side.png",},
	paramtype2 = "facedir",
	is_ground_content = true,
	groups = {snappy=1,choppy=3,flammable=2},
	paramtype = "light",
	drawtype = "nodebox",
	selection_box = {type="regular"},
	node_box = {
			type = "fixed",
			fixed = {
			--jukebox core - divide by 16 because 16 pixels
			{-8/16, -8/16, -8/16, 8/16, 7/16, 8/16},
			--top
			{-8/16, 6/16, -8/16, 8/16, 7/16, 8/16},
			--top trim
			{6/16, 7/16, -8/16, 8/16, 8/16, 8/16},
			{-8/16, 7/16, 6/16, 8/16, 8/16, 8/16},
			{-8/16, 7/16, -8/16, -6/16, 8/16, 8/16},
			{-8/16, 7/16, -8/16, 8/16, 8/16, -6/16},
			},
		},
	on_place = minetest.rotate_node,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local name = itemstack:get_name()
		--only enchantable items
		if intable(enchant.pick, name) ~= false or intable(enchant.shovel, name) ~= false or intable(enchant.axe, name) ~= false then
			local chance = math.random()
			if chance <= 0.85 then
				local meta = itemstack:get_metadata()
				--only enchant unenchanted tools
				if intable(enchant.pick, name) ~= false and meta == "" then 
					--set up a random amount of perks, with random perks, in a random order, random.
					local enc_tab = {}
					local counter = 1
					for i = 1,math.random(1,tablelength(enchant.enchantments_pick)) do
						local perk = enchant.enchantments_pick[math.random(1,tablelength(enchant.enchantments_pick))]
						if intable(enc_tab, perk) == false then
							enc_tab[counter] = perk
							counter = counter + 1
						end
					end
					local tool = itemstack:get_name()
					local a, b, c, d = 0,0,0,0
					if intable(enc_tab, enchant.enchantments_pick[1]) then --speed
						a = 1 
					end
					if intable(enc_tab, enchant.enchantments_pick[2]) then --durable
						b = 1 
					end
					if intable(enc_tab, enchant.enchantments_pick[3]) then --luck
						c = 1 
					end
					if intable(enc_tab, enchant.enchantments_pick[4]) then --cherry pick
						d = 1 
					end
					if a.."_"..b.."_"..c.."_"..d ~= "0_0_0_0" then -- no enchantments, then don't put out a normal tool
						local name = itemstack:get_name()
						itemstack:take_item()--set_name(tool.."_"..a.."_"..b.."_"..c.."_"..d)
						local pos = pointed_thing.under
						pos.y = pos.y + 0.7
						--local item = minetest.add_item(pos, tool.."_"..a.."_"..b.."_"..c.."_"..d)
						local item = minetest.add_item(pos,name)
						if item == nil then
							print(tool.."_"..a.."_"..b.."_"..c.."_"..d)
							print("BUG!")
							return
						end 
						local item = item:get_luaentity().object
						item:setvelocity({x = 0, y = 0.1, z = 0})
						item:setacceleration({x = 0, y = 0, z = 0})
						item:set_properties({automatic_rotate = 0}) --or do 10
						local sound = minetest.sound_play("build", {
							pos = pos,
							max_hear_distance = 20,
							gain = 1,
						})
						minetest.add_particlespawner({
							amount = 100,
							time = 13,
							minpos = {x=pos.x-(6/16), y=pos.y-0.1, z=pos.z-(6/16)},
							maxpos = {x=pos.x+(6/16), y=pos.y-0.1, z=pos.z+(6/16)},
							minvel = {x=0, y=0, z=0},
							maxvel = {x=0, y=0, z=0},
							minacc = {x=0, y=0.1, z=0},
							maxacc = {x=0, y=1, z=0},
							minexptime = 1,
							maxexptime = 2,
							minsize = 1,
							maxsize = 1,
							collisiondetection = false,
							vertical = false,
							texture = "bubble.png",
						})
						minetest.after(13, function()
							--don't do anything if the player cancelled the event
							if item:get_luaentity() == nil then
								return
							end
							minetest.sound_stop(sound)
							minetest.sound_play("enchant", {
								pos = pos,
								max_hear_distance = 20,
								gain = 1,
							})
							minetest.add_particlespawner({
								amount = 100,
								time = 0.1,
								minpos = item:getpos(),
								maxpos = item:getpos(),
								minvel = {x=-1, y=-1, z=-1},
								maxvel = {x=1, y=1, z=1},
								minacc = {x=0, y=0, z=0},
								maxacc = {x=0, y=0, z=0},
								minexptime = 1,
								maxexptime = 2,
								minsize = 1,
								maxsize = 1,
								collisiondetection = false,
								vertical = false,
								texture = "bubble.png",
							})
							--make it so you cannot get the enchantment before it's done with the cinematic
							local newpos = item:getpos()
							local newpos2= clicker:getpos()
							item:remove()
							local item = minetest.add_item(newpos, tool.."_"..a.."_"..b.."_"..c.."_"..d)
							item:setvelocity({x=newpos2.x-newpos.x,y=(newpos2.y-newpos.y)+6,z=newpos2.z-newpos.z})
							item:setacceleration({x = 0, y = -10, z = 0})
						end)



						return(itemstack)
					else
						--do nothing
					end
				end
				if intable(enchant.shovel, name) ~= false and meta == "" then 
					--set up a random amount of perks, with random perks, in a random order, random.
					local enc_tab = {}
					local counter = 1
					for i = 1,math.random(1,tablelength(enchant.enchantments_shovel)) do
						local perk = enchant.enchantments_shovel[math.random(1,tablelength(enchant.enchantments_shovel))]
						if intable(enc_tab, perk) == false then
							enc_tab[counter] = perk
							counter = counter + 1
						end
					end
					local tool = itemstack:get_name()
					local a, b, c, d = 0,0,0,0
					if intable(enc_tab, enchant.enchantments_shovel[1]) then --speed
						a = 1 
					end
					if intable(enc_tab, enchant.enchantments_shovel[2]) then --durable
						b = 1 
					end
					if intable(enc_tab, enchant.enchantments_shovel[3]) then --luck
						c = 1 
					end
					if intable(enc_tab, enchant.enchantments_shovel[4]) then --cherry pick
						d = 1 
					end
					if a.."_"..b.."_"..c.."_"..d ~= "0_0_0_0" then -- no enchantments, then don't put out a normal tool
						local name = itemstack:get_name()
						itemstack:take_item()--set_name(tool.."_"..a.."_"..b.."_"..c.."_"..d)
						local pos = pointed_thing.under
						pos.y = pos.y + 0.7
						--local item = minetest.add_item(pos, tool.."_"..a.."_"..b.."_"..c.."_"..d)
						local item = minetest.add_item(pos,name)
						if item == nil then
							print(tool.."_"..a.."_"..b.."_"..c.."_"..d)
							print("BUG!")
							return
						end 
						local item = item:get_luaentity().object
						item:setvelocity({x = 0, y = 0.1, z = 0})
						item:setacceleration({x = 0, y = 0, z = 0})
						item:set_properties({automatic_rotate = 0}) --or do 10
						local sound = minetest.sound_play("build", {
							pos = pos,
							max_hear_distance = 20,
							gain = 1,
						})
						minetest.add_particlespawner({
							amount = 100,
							time = 13,
							minpos = {x=pos.x-(6/16), y=pos.y-0.1, z=pos.z-(6/16)},
							maxpos = {x=pos.x+(6/16), y=pos.y-0.1, z=pos.z+(6/16)},
							minvel = {x=0, y=0, z=0},
							maxvel = {x=0, y=0, z=0},
							minacc = {x=0, y=0.1, z=0},
							maxacc = {x=0, y=1, z=0},
							minexptime = 1,
							maxexptime = 2,
							minsize = 1,
							maxsize = 1,
							collisiondetection = false,
							vertical = false,
							texture = "bubble.png",
						})
						minetest.after(13, function()
							--don't do anything if the player cancelled the event
							if item:get_luaentity() == nil then
								return
							end
							minetest.sound_stop(sound)
							minetest.sound_play("enchant", {
								pos = pos,
								max_hear_distance = 20,
								gain = 1,
							})
							minetest.add_particlespawner({
								amount = 100,
								time = 0.1,
								minpos = item:getpos(),
								maxpos = item:getpos(),
								minvel = {x=-1, y=-1, z=-1},
								maxvel = {x=1, y=1, z=1},
								minacc = {x=0, y=0, z=0},
								maxacc = {x=0, y=0, z=0},
								minexptime = 1,
								maxexptime = 2,
								minsize = 1,
								maxsize = 1,
								collisiondetection = false,
								vertical = false,
								texture = "bubble.png",
							})
							--make it so you cannot get the enchantment before it's done with the cinematic
							local newpos = item:getpos()
							local newpos2= clicker:getpos()
							item:remove()
							local item = minetest.add_item(newpos, tool.."_"..a.."_"..b.."_"..c.."_"..d)
							item:setvelocity({x=newpos2.x-newpos.x,y=(newpos2.y-newpos.y)+6,z=newpos2.z-newpos.z})
							item:setacceleration({x = 0, y = -10, z = 0})
						end)



						return(itemstack)

					else
						--do nothing
					end
				end
				if intable(enchant.axe, name) ~= false and meta == "" then 
					--set up a random amount of perks, with random perks, in a random order, random.
					local enc_tab = {}
					local counter = 1
					for i = 1,math.random(1,tablelength(enchant.enchantments_axe)) do
						local perk = enchant.enchantments_axe[math.random(1,tablelength(enchant.enchantments_axe))]
						if intable(enc_tab, perk) == false then
							enc_tab[counter] = perk
							counter = counter + 1
						end
					end
					local tool = itemstack:get_name()
					local a, b, c, d = 0,0,0,0
					if intable(enc_tab, enchant.enchantments_axe[1]) then --speed
						a = 1 
					end
					if intable(enc_tab, enchant.enchantments_axe[2]) then --durable
						b = 1 
					end
					if intable(enc_tab, enchant.enchantments_axe[3]) then --luck
						c = 1 
					end
					if intable(enc_tab, enchant.enchantments_axe[4]) then --cherry pick
						d = 1 
					end
					if a.."_"..b.."_"..c.."_"..d ~= "0_0_0_0" then -- no enchantments, then don't put out a normal tool
						local name = itemstack:get_name()
						itemstack:take_item()--set_name(tool.."_"..a.."_"..b.."_"..c.."_"..d)
						local pos = pointed_thing.under
						pos.y = pos.y + 0.7
						--local item = minetest.add_item(pos, tool.."_"..a.."_"..b.."_"..c.."_"..d)
						local item = minetest.add_item(pos,name)
						if item == nil then
							print(tool.."_"..a.."_"..b.."_"..c.."_"..d)
							print("BUG!")
							return
						end 
						local item = item:get_luaentity().object
						item:setvelocity({x = 0, y = 0.1, z = 0})
						item:setacceleration({x = 0, y = 0, z = 0})
						item:set_properties({automatic_rotate = 0}) --or do 10
						local sound = minetest.sound_play("build", {
							pos = pos,
							max_hear_distance = 20,
							gain = 1,
						})
						minetest.add_particlespawner({
							amount = 100,
							time = 13,
							minpos = {x=pos.x-(6/16), y=pos.y-0.1, z=pos.z-(6/16)},
							maxpos = {x=pos.x+(6/16), y=pos.y-0.1, z=pos.z+(6/16)},
							minvel = {x=0, y=0, z=0},
							maxvel = {x=0, y=0, z=0},
							minacc = {x=0, y=0.1, z=0},
							maxacc = {x=0, y=1, z=0},
							minexptime = 1,
							maxexptime = 2,
							minsize = 1,
							maxsize = 1,
							collisiondetection = false,
							vertical = false,
							texture = "bubble.png",
						})
						minetest.after(13, function()
							--don't do anything if the player cancelled the event
							if item:get_luaentity() == nil then
								return
							end
							minetest.sound_stop(sound)
							minetest.sound_play("enchant", {
								pos = pos,
								max_hear_distance = 20,
								gain = 1,
							})
							minetest.add_particlespawner({
								amount = 100,
								time = 0.1,
								minpos = item:getpos(),
								maxpos = item:getpos(),
								minvel = {x=-1, y=-1, z=-1},
								maxvel = {x=1, y=1, z=1},
								minacc = {x=0, y=0, z=0},
								maxacc = {x=0, y=0, z=0},
								minexptime = 1,
								maxexptime = 2,
								minsize = 1,
								maxsize = 1,
								collisiondetection = false,
								vertical = false,
								texture = "bubble.png",
							})
							--make it so you cannot get the enchantment before it's done with the cinematic
							local newpos = item:getpos()
							local newpos2= clicker:getpos()
							item:remove()
							local item = minetest.add_item(newpos, tool.."_"..a.."_"..b.."_"..c.."_"..d)
							item:setvelocity({x=newpos2.x-newpos.x,y=(newpos2.y-newpos.y)+6,z=newpos2.z-newpos.z})
							item:setacceleration({x = 0, y = -10, z = 0})
						end)



						return(itemstack)

					else
						--do nothing
					end
				end
				-- then do the enchantments for other tools

				--now let's make it do some enchanted actions!
				--local meta_table = minetest.deserialize(itemstack:get_metadata()) 
				--for i = 1,tablelength(meta_table) do --do all the enchantment actions -----    This should probably be some kind of function!    ------ 
				--	if meta_table[i] == "speed" then
				--		print("this item has speed")
				--	end
				--end

				--return(itemstack)
			elseif chance > 0.85 and chance < 0.998 then
				--it ate the item! such bad luck
				itemstack:take_item()
				minetest.sound_play("chomp", {
					pos = pos,
					max_hear_distance = 20,
					gain = 1,
				})
				minetest.add_particlespawner({
					amount = 200,
					time = 5,
					minpos = {x=pos.x-(6/16), y=pos.y-0.1, z=pos.z-(6/16)},
					maxpos = {x=pos.x+(6/16), y=pos.y-0.1, z=pos.z+(6/16)},
					minvel = {x=0, y=0, z=0},
					maxvel = {x=0, y=0, z=0},
					minacc = {x=0, y=0.5, z=0},
					maxacc = {x=0, y=3, z=0},
					minexptime = 1,
					maxexptime = 2,
					minsize = 1,
					maxsize = 1,
					collisiondetection = false,
					vertical = false,
					texture = "heart.png",
				})
			elseif chance >= 0.999 then
				--warning: this function is brutal
				--you must have broken 200 mirrors and crashed with a salt truck, let's destroy your life
				minetest.sound_play("bad_luck", {
					pos = pos,
					max_hear_distance = 55,
					gain = 1,
				})
				minetest.add_particlespawner({
					amount = 200,
					time = 10,
					minpos = {x=pos.x-(6/16), y=pos.y-0.1, z=pos.z-(6/16)},
					maxpos = {x=pos.x+(6/16), y=pos.y-0.1, z=pos.z+(6/16)},
					minvel = {x=0, y=0, z=0},
					maxvel = {x=0, y=0, z=0},
					minacc = {x=0, y=0.5, z=0},
					maxacc = {x=0, y=3, z=0},
					minexptime = 1,
					maxexptime = 2,
					minsize = 1,
					maxsize = 1,
					collisiondetection = false,
					vertical = false,
					texture = "bubble.png^[colorize:red:120",
				})
				minetest.after(10, function() --give them the illusion that they might live

					--explosion stuff (use this for fireworks/tnt/nukes)
					decimate_player_with_crucible(pos)
					minetest.add_particlespawner({
						amount = 200,
						time = 0.1,
						minpos = pos,
						maxpos = pos,
						minvel = {x=-5, y=-5, z=-5},
						maxvel = {x=5, y=5, z=5},
						minacc = {x=0, y=0, z=0},
						maxacc = {x=0, y=0, z=0},
						minexptime = 3,
						maxexptime = 5,
						minsize = 1,
						maxsize = 1,
						collisiondetection = false,
						vertical = false,
						texture = "bubble.png",
					})
					minetest.sound_play("boom", {
						pos = pos,
						max_hear_distance = 55,
						gain = 1,
					})			
				end)
			end
		end
	end,
})
minetest.register_craft({
	output = "enchant:crucible",
	recipe = {
		{"default:meselamp","default:marble_bricks","default:meselamp"},
		{"default:emeraldblock","mobs_mc:ghast_head","default:emeraldblock"},
		{"default:obsidianbrick","default:diamondblock","default:obsidianbrick"},
	}
})

--do some enchantments

----------------USE HANDLE NODE DROPS INSTEAD!!!
--let's rehandle the item drop
function unenchanted_add(pos,drops,digger)
	local inv = digger:get_inventory()

	if inv:room_for_item("main", drops[1]) == true then
		inv:add_item("main", drops[1])
	else
		minetest.add_item(pos, drops[1])
	end
end
function enchanted_add(pos,drops,digger)
	local inv = digger:get_inventory()
	local source_node = minetest.get_node(pos).name

	if inv:room_for_item("main", source_node) == true then
		inv:add_item("main", source_node)
	else
		minetest.add_item(pos, source_node)
	end
end
function treecapitate(pos,drops,digger)
	if minetest.get_item_group(minetest.get_node(pos).name, "choppy") ~= 0 then 
		for i = 1,20 do
			if minetest.get_item_group(minetest.get_node(pos).name, "choppy") ~= 0 then
				unenchanted_add(pos,drops,digger)
				minetest.remove_node(pos)
				pos.y = pos.y + 1
			end
		end
	end		
end
function super_treecapitate(pos,drops,digger)
	if minetest.get_item_group(minetest.get_node(pos).name, "choppy") ~= 0 then 
		for i = 1,20 do
			if minetest.get_item_group(minetest.get_node(pos).name, "choppy") ~= 0 then
				unenchanted_add(pos,drops,digger)
				if math.random() > 0.5 then
					unenchanted_add(pos,drops,digger)
				end
				minetest.remove_node(pos)
				pos.y = pos.y + 1
			end
		end
	end		
end
function minetest.handle_node_drops(pos, drops, digger)
	local itemstack = digger:get_wielded_item()
	local name = itemstack:get_name()
	--mix the shovel and pickaxe enchants into one
	if minetest.get_item_group(name, "enchanted_pick") == 1 or minetest.get_item_group(name, "enchanted_shovel") == 1 or minetest.get_item_group(name, "enchanted_axe") == 1 then
		--this player just dug with an enchanted pickaxe or shovel - check if axe with treefeller first
		if minetest.get_item_group(name, "tree_feller") == 0 then
			if minetest.get_item_group(name, "cherry_pick") == 0 then
				unenchanted_add(pos,drops,digger)
				if minetest.get_item_group(name, "luck") == 1 then
					if math.random() > 0.5 then
						unenchanted_add(pos,drops,digger)
					end
				end
			elseif minetest.get_item_group(name, "cherry_pick") == 1 then
				enchanted_add(pos,drops,digger)
				--add luck to this
				if minetest.get_item_group(name, "luck") == 1 then
					if math.random() > 0.5 then
						enchanted_add(pos,drops,digger)
					end			
				end
			end
		else
			if minetest.get_item_group(name, "luck") == 1 then
				super_treecapitate(pos,drops,digger)
			else
				treecapitate(pos,drops,digger)
			end
		end
	else
		unenchanted_add(pos,drops,digger)
	end
	
end





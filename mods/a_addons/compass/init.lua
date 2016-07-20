
local default_spawn_settings = minetest.setting_get("static_spawnpoint")

minetest.register_globalstep(function(dtime)
	local players  = minetest.get_connected_players()
	for i,player in ipairs(players) do
		local function has_compass(player)
			for _,stack in ipairs(player:get_inventory():get_list("main")) do
				if minetest.get_item_group(stack:get_name(), "compass") ~= 0 then
					return true
				end
			end
			return false
		end
		if has_compass(player) then
			--local spawn = beds_player_spawns[player:get_player_name()] or
			local spawn = beds.spawn[player:get_player_name()] or
				       minetest.setting_get("static_spawnpoint") or
			              {x=0,y=0,z=0}
			local pos = player:getpos()
			local dir = player:get_look_yaw()
			local angle_north = math.deg(math.atan2(spawn.x - pos.x, spawn.z - pos.z))
			if angle_north < 0 then angle_north = angle_north + 360 end
			local angle_dir = 90 - math.deg(dir)
			local angle_relative = (angle_north - angle_dir) % 360
			local compass_image = math.floor((angle_relative/11.25) + 16.5) % 32

			for j,stack in ipairs(player:get_inventory():get_list("main")) do
				if minetest.get_item_group(stack:get_name(), "compass") ~= 0 and
						minetest.get_item_group(stack:get_name(), "compass")-1 ~= compass_image then
					player:get_inventory():set_stack("main", j, "compass:"..compass_image)
				end
			end
		end
	end
end)

local images = {
    "compass_0.png",
    "compass_1.png",
    "compass_2.png",
    "compass_3.png",
    "compass_4.png",
    "compass_5.png",
    "compass_6.png",
    "compass_7.png",
    "compass_8.png",
    "compass_9.png",
    "compass_10.png",
    "compass_11.png",
    "compass_12.png",
    "compass_13.png",
    "compass_14.png",
    "compass_15.png",
    "compass_16.png",
    "compass_17.png",
    "compass_18.png",
    "compass_19.png",
    "compass_20.png",
    "compass_21.png",
    "compass_22.png",
    "compass_23.png",
    "compass_24.png",
    "compass_25.png",
    "compass_26.png",
    "compass_27.png",
    "compass_28.png",
    "compass_29.png",
    "compass_30.png",
    "compass_31.png",
}

local i
for i,img in ipairs(images) do
	local inv = 1
	if i == 1 then
		inv = 0
	end
	minetest.register_tool("compass:"..(i-1), {
		description = "Compass",
		inventory_image = img,
		wield_image = img,
		stack_max = 1,
		groups = {not_in_creative_inventory=inv,compass=i}
	})
end

minetest.register_craft({
	output = 'compass:1',
	recipe = {
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot', 'default:mese_crystal', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''}
	}
})

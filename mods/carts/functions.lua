-- function carts:get_sign(z)
-- 	if z == 0 then
-- 		return 0
-- 	else
-- 		return z / math.abs(z)
-- 	end
-- end

-- function carts:velocity_to_dir(v)
-- 	if math.abs(v.x) > math.abs(v.z) then
-- 		return {x=carts:get_sign(v.x), y=carts:get_sign(v.y), z=0}
-- 	else
-- 		return {x=0, y=carts:get_sign(v.y), z=carts:get_sign(v.z)}
-- 	end
-- end

function carts:manage_attachment(player, obj)
	if not player then
		return
	end
	local status = obj ~= nil
	local player_name = player:get_player_name()
	if default.player_attached[player_name] == status then
		return
	end
	default.player_attached[player_name] = status

	if status then
		player:set_attach(obj, "", {x=0, y=6, z=0}, {x=0, y=0, z=0})
		player:set_eye_offset({x=0, y=-4, z=0},{x=0, y=-4, z=0})
	else
		player:set_detach()
		player:set_eye_offset({x=0, y=0, z=0},{x=0, y=0, z=0})
	end
end

function carts:register_rail(name, def_overwrite, railparams)
	local def = {
		drawtype = "raillike",
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		selection_box = {
			type = "fixed",
			fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
		},
		sounds = default.node_sound_metal_defaults()
	}
	for k, v in pairs(def_overwrite) do
		def[k] = v
	end
	if not def.inventory_image then
		def.wield_image = def.tiles[1]
		def.inventory_image = def.tiles[1]
	end

	if railparams then
		carts.railparams[name] = table.copy(railparams)
	end

	minetest.register_node(name, def)
end

function carts:get_rail_groups(additional_groups)
	-- Get the default rail groups and add more when a table is given
	local groups = {dig_immediate = 2, attached_node = 1, rail = 1, connect_to_raillike = 1}
	if type(additional_groups) == "table" then
		for k, v in pairs(additional_groups) do
			groups[k] = v
		end
	end
	return groups
end

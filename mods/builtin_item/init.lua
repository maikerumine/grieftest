-- Minetest: builtin/item_entity.lua (27th January 2016)

-- water flow functions by QwertyMine3, edited by TenPlus1
local function to_unit_vector(dir_vector)

	local inv_roots = {
		[0] = 1,
		[1] = 1,
		[2] = 0.70710678118655,
		[4] = 0.5,
		[5] = 0.44721359549996,
		[8] = 0.35355339059327
	}

	local sum = dir_vector.x * dir_vector.x + dir_vector.z * dir_vector.z

	return {
		x = dir_vector.x * inv_roots[sum],
		y = dir_vector.y,
		z = dir_vector.z * inv_roots[sum]
	}
end

local function is_touching(realpos, nodepos, radius)

	return (math.abs(realpos - nodepos) > (0.5 - radius))
end

local function node_ok(pos)

	local node = minetest.get_node_or_nil(pos)

	if not node then
		return minetest.registered_nodes["default:dirt"]
	end

	if minetest.registered_nodes[node.name] then
		return node
	end

	return minetest.registered_nodes["default:dirt"]
end

local function is_water(pos)

	return (minetest.registered_nodes[
		node_ok({x = pos.x, y = pos.y, z = pos.z}).name].groups.water)
end

local function is_liquid(pos)

	return (minetest.registered_nodes[
		node_ok({x = pos.x, y = pos.y, z = pos.z}).name].groups.liquid)
end

local function node_is_liquid(node)

	return (minetest.registered_nodes[node.name].groups.liquid)
end

local function quick_flow_logic(node, pos_testing, direction)

	if minetest.registered_nodes[node.name].liquidtype == "source" then

		local node_testing = node_ok(pos_testing)
		local param2_testing = node_testing.param2

		if minetest.registered_nodes[node_testing.name].liquidtype ~= "flowing" then
			return 0
		else
			return direction
		end

	elseif minetest.registered_nodes[node.name].liquidtype == "flowing" then

		local node_testing = node_ok(pos_testing)
		local param2_testing = node_testing.param2

		if minetest.registered_nodes[node_testing.name].liquidtype == "source" then
			return -direction

		elseif minetest.registered_nodes[node_testing.name].liquidtype == "flowing" then

			if param2_testing < node.param2 then

				if (node.param2 - param2_testing) > 6 then
					return -direction
				else
					return direction
				end

			elseif param2_testing > node.param2 then

				if (param2_testing - node.param2) > 6 then
					return direction
				else
					return -direction
				end
			end
		end
	end

	return 0
end

local function quick_flow(pos, node)

	local x, z = 0, 0
	
	if not node_is_liquid(node)  then
		return {x = 0, y = 0, z = 0}
	end
	
	x = x + quick_flow_logic(node, {x = pos.x - 1, y = pos.y, z = pos.z},-1)
	x = x + quick_flow_logic(node, {x = pos.x + 1, y = pos.y, z = pos.z}, 1)
	z = z + quick_flow_logic(node, {x = pos.x, y = pos.y, z = pos.z - 1},-1)
	z = z + quick_flow_logic(node, {x = pos.x, y = pos.y, z = pos.z + 1}, 1)

	return to_unit_vector({x = x, y = 0, z = z})
end

--if not in water but touching, move centre to touching block
--x has higher precedence than z -- if pos changes with x, it affects z
local function move_centre(pos, realpos, node, radius)

	if is_touching(realpos.x, pos.x, radius) then

		if is_liquid({x = pos.x - 1, y = pos.y, z = pos.z}) then
			pos = {x = pos.x - 1, y = pos.y, z = pos.z}
			node = node_ok(pos)

		elseif is_liquid({x = pos.x + 1, y = pos.y, z = pos.z}) then
			pos = {x = pos.x + 1, y = pos.y, z = pos.z}
			node = node_ok(pos)
		end
	end

	if is_touching(realpos.z, pos.z, radius) then

		if is_liquid({x = pos.x, y = pos.y, z = pos.z - 1}) then
			pos = {x = pos.x, y = pos.y, z = pos.z - 1}
			node = node_ok(pos)

		elseif is_liquid({x = pos.x, y = pos.y, z = pos.z + 1}) then
			pos = {x = pos.x, y = pos.y, z = pos.z + 1}
			node = node_ok(pos)
		end
	end

	return pos, node
end
-- END water flow functions

function core.spawn_item(pos, item)

	local obj = core.add_entity(pos, "__builtin:item")

	-- Don't use obj if it couldn't be added to the map.
	if obj then
		obj:get_luaentity():set_item(ItemStack(item):to_string())
	end

	return obj
end

-- if item_entity_ttl is not set, enity will have default life time
-- setting to -1 disables the feature
local time_to_live = tonumber(core.setting_get("item_entity_ttl")) or 900

-- if destroy_item is 1 then dropped items will burn inside lava
local destroy_item = tonumber(core.setting_get("destroy_item")) or 1

-- entity gravity
local gravity = tonumber(minetest.setting_get("movement_gravity")) or 9.81

-- particle effects for when item is destroyed
local function add_effects(pos)

	minetest.add_particlespawner({
		amount = 1,
		time = 0.25,
		minpos = pos,
		maxpos = pos,
		minvel = {x = -1, y = 2, z = -1},
		maxvel = {x = 1, y = 5, z = 1},
		minacc = {x = -4, y = -4, z = -4},
		maxacc = {x = 4, y = 4, z = 4},
		minexptime = 1,
		maxexptime = 3,
		minsize = 1,
		maxsize = 4,
		texture = "tnt_smoke.png",
	})
end

-- check if within map limits (-30911 to 30927)
local function within_limits(pos)

	if  pos.x > -30913
	and pos.x <  30928
	and pos.y > -30913
	and pos.y <  30928
	and pos.z > -30913
	and pos.z <  30928 then
		return true -- within limits
	end

	return false -- beyond limits
end

core.register_entity(":__builtin:item", {
	initial_properties = {
		hp_max = 1,
		physical = true,
		collide_with_objects = false,
		collisionbox = {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3},
		visual = "wielditem",
		visual_size = {x = 0.4, y = 0.4},
		textures = {""},
		spritediv = {x = 1, y = 1},
		initial_sprite_basepos = {x = 0, y = 0},
		is_visible = false,
		infotext = "",
	},

	itemstring = "",
	physical_state = true,
	age = 0,

	set_item = function(self, itemstring)

		self.itemstring = itemstring

		local stack = ItemStack(itemstring)
		local itemname = stack:get_name()
		local max_count = stack:get_stack_max()
		local count = math.min(stack:get_count(), max_count)
		local size = 0.2 + 0.1 * (count / max_count)

		if not core.registered_items[itemname] then
			itemname = "unknown"
		end

		self.object:set_properties({
			is_visible = true,
			visual = "wielditem",
			textures = {itemname},
			visual_size = {x = size, y = size},
			collisionbox = {-size, -size, -size, size, size, size},
			automatic_rotate = math.pi * 0.5,
			infotext = core.registered_items[itemname].description
		})
	end,

	update_gravity = function(self)
		if not self.physical_state then
			self.object:setacceleration({x = 0, y = 0, z = 0})
			return
		end

		self.object:setacceleration({x = 0, y = -gravity, z = 0})
	end,

	get_staticdata = function(self)

		return core.serialize({
			itemstring = self.itemstring,
			always_collect = self.always_collect,
			age = self.age,
			dropped_by = self.dropped_by
		})
	end,

	on_activate = function(self, staticdata, dtime_s)

		-- special function to fast remove entities (xanadu only)
		if (mobs and mobs.entity and mobs.entity == false)
		or not self then

			self.object:remove()

			return
		end

		if string.sub(staticdata, 1, string.len("return")) == "return" then

			local data = core.deserialize(staticdata)

			if data and type(data) == "table" then

				self.itemstring = data.itemstring
				self.always_collect = data.always_collect
				self.age = data.age or 0
				self.age = self.age + dtime_s
				self.dropped_by = data.dropped_by
			end
		else
			self.itemstring = staticdata
		end

		self.object:set_armor_groups({immortal = 1})
		self.object:setvelocity({x = 0, y = 2, z = 0})
		self:update_gravity()
		self:set_item(self.itemstring)
	end,

	try_merge_with = function(self, own_stack, object, entity)

		if self.age == entity.age then
			-- Can not merge with itself
			return false
		end
		
		local stack = ItemStack(entity.itemstring)
		local name = stack:get_name()

		if own_stack:get_name() ~= name or own_stack:get_free_space() == 0 then
			-- Can not merge different or full stack
			return false
		end

		local count = own_stack:get_count()
		local total_count = stack:get_count() + count
		local max_count = stack:get_stack_max()

		-- Merge the remote stack into this one
		if total_count > max_count then
			return false
		end

		local pos = object:getpos()
		pos.y = pos.y + ((total_count - count) / max_count) * 0.15

		self:set_item(name .. " " .. total_count)

		entity.itemstring = ""
		object:remove()

		return true
	end,

	on_step = function(self, dtime)

		self.age = self.age + dtime
		if time_to_live > 0 and self.age > time_to_live then
			self.itemstring = ""
			self.object:remove()
			return
		end

		local pos = self.object:getpos()
		local node = node_ok({
			x = pos.x,
			y = pos.y - 0.5,
			z = pos.z
		})
		local def = core.registered_nodes[node.name]

		-- destroy item when dropped into lava (if enabled)
		if destroy_item > 0 and def.groups.lava then
			minetest.sound_play("builtin_item_lava", {
				pos = pos,
				max_hear_distance = 6,
				gain = 0.5
			})
			add_effects(pos)
			self.object:remove()
			return
		end

		-- flowing water pushes item along (by QwertyMine3)
		local nod = node_ok({x = pos.x, y = pos.y + 0.5, z = pos.z})
		if minetest.registered_nodes[nod.name].liquidtype == "flowing" then

			local vec = quick_flow(self.object:getpos(),
				node_ok(self.object:getpos()))

			if vec then

				local v = self.object:getvelocity()

				self.object:setvelocity(
					{x = vec.x, y = v.y, z = vec.z})

			end

			return
		end

		-- Ignore is walkable -> stop until the block loaded
		local entity_fall = (def and not def.walkable)

		if self.physical_state == entity_fall then
			return
		end

		self.object:setvelocity({x = 0, y = 0, z = 0})
		self.physical_state = entity_fall
		self.object:set_properties({
			physical = entity_fall
		})

		self:update_gravity()

		-- Collect the items around to merge with
		local own_stack = ItemStack(self.itemstring)
		if own_stack:get_free_space() == 0 then
			return
		end

		local objects = core.get_objects_inside_radius(pos, 0.8)

		for k, object in pairs(objects) do

			local entity = object:get_luaentity()

			if entity and entity.name == "__builtin:item" then

				if self:try_merge_with(own_stack, object, entity) then

					own_stack = ItemStack(self.itemstring)

					if own_stack:get_free_space() == 0 then
						return
					end
				end
			end
		end
	end,

	on_punch = function(self, puncher)

		local inv = puncher:get_inventory()

		if inv and self.itemstring ~= "" then

			local left = inv:add_item("main", self.itemstring)

			if left and not left:is_empty() then

				self:set_item(left:to_string())

				return
			end
		end

		self.itemstring = ""
		self.object:remove()
	end,
})

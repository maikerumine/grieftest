--
-- Helper functions
--
local init = os.clock()

local function is_water(pos)
	local nn = minetest.get_node(pos).name
	return minetest.get_item_group(nn, "water") ~= 0
end

local function get_velocity(v, yaw, y)
	local x = -math.sin(yaw)*v
	local z = math.cos(yaw)*v
	return {x=x, y=y, z=z}
end

--
-- boat entity
--
local boat = {
	physical = true,
	--collisionbox = {-1,-0.5,-1, 1,0.5,1},
	collisionbox = {-0.5, -0.35, -0.5, 0.5, 0.3, 0.5},
	visual = "mesh",
	--mesh = "mcl_boats_base.x",
	mesh = "boats_boat.obj",
	--textures = {"mcl_boats_texture.png"},
	textures = {"default_wood.png"},
	_driver = nil,
	_v = 0,
	_stepcount = 0,
	_unattended = 0
}

function boat.on_rightclick(self, clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	if self._driver and clicker == self._driver then
		self._driver = nil
		clicker:set_detach()
	elseif not self._driver then
		self._driver = clicker
		clicker:set_attach(self.object, "", {x=0,y=5,z=0}, {x=0,y=0,z=0})
		self.object:setyaw(clicker:get_look_yaw())
	end
end

function boat.on_activate(self, staticdata, dtime_s)
	self.object:set_armor_groups({immortal=1})
	if staticdata then
		self._v = tonumber(staticdata)
	end
end

function boat.get_staticdata(self)
	return tostring(self._v)
end

function boat.on_punch(self, puncher, time_from_last_punch, tool_capabilities, direction)

	 if self._driver then
		self._driver:set_detach()
		self._driver = nil
		if puncher and puncher:is_player() and (not minetest.setting_getbool("creative_mode")) then
			puncher:get_inventory():add_item("main", "mcl_boats:boat")
		end
		self.object:remove()
	else

		if puncher and puncher:is_player() and (not minetest.setting_getbool("creative_mode")) then
			puncher:get_inventory():add_item("main", "mcl_boats:boat")
		end
		self.object:remove()
	
	end
end

function boat.on_step(self, dtime)

	self._stepcount=self._stepcount+1
	if self._stepcount>9 then
	
		self._stepcount=0
		
		if self._driver then
			local ctrl = self._driver:get_player_control()

			self._unattended=0
		
			local yaw = self.object:getyaw()

			if ctrl.up and self._v<3 then
				self._v = self._v + 1
			end
			
			if ctrl.down and self._v>=-1 then
				self._v = self._v - 1
			end	
			
			if ctrl.left then
				if ctrl.down then
					self.object:setyaw(yaw-math.pi/12-dtime*math.pi/12)
				else
					self.object:setyaw(yaw+math.pi/12+dtime*math.pi/12)
				end
			end
			if ctrl.right then
				if ctrl.down then
					self.object:setyaw(yaw+math.pi/12+dtime*math.pi/12)
				else
					self.object:setyaw(yaw-math.pi/12-dtime*math.pi/12)
				end
			end
		end

		local tmp_velocity = get_velocity(self._v, self.object:getyaw(), 0)

		local tmp_pos = self.object:getpos()

		tmp_velocity.y=0

		if is_water(tmp_pos) then
			tmp_velocity.y=2
		end

		tmp_pos.y=tmp_pos.y-0.5

		if minetest.get_node(tmp_pos).name=="air" then
			tmp_velocity.y=-2
		end

		self.object:setvelocity(tmp_velocity)

	end
	
end

local woods = { "", "_spruce", "_birch", "_jungle", "_acacia" }
local names = { "Wood Boat", "Spruce Boat", "Birch Boat", "Jungle Boat", "Acacia Boat" }
local craftstuffs = { "default:wood", "default:pine_wood", "default:aspen_wood", "default:junglewood", "default:acacia_wood" }
local images = { "oak", "spruce", "birch", "jungle", "acacia" }

for w=1, #woods do
	local textures = {"mcl_boats_texture.png"}
	minetest.register_entity("mcl_boats:boat"..woods[w], boat)

	minetest.register_craftitem("mcl_boats:boat"..woods[w], {
		description = names[w],
		inventory_image = "mcl_boats_"..images[w].."_boat.png",
		liquids_pointable = true,
		groups = { boat = 1, transport = 1},
		stack_max = 1,
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return
			end

			-- Call on_rightclick if the pointed node defines it
			local node = minetest.get_node(pointed_thing.under)
			if placer and not placer:get_player_control().sneak then
				if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
					return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer, itemstack) or itemstack
				end
			end

			if not is_water(pointed_thing.under) then
				return
			end
			pointed_thing.under.y = pointed_thing.under.y+0.5
			minetest.add_entity(pointed_thing.under, "mcl_boats:boat"..woods[w])
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
			return itemstack
		end,
	})

	local c = craftstuffs[w]
	minetest.register_craft({
		output = "mcl_boats:boat"..woods[w],
		recipe = {
			{c, "", c},
			{c, c, c},
		},
	})
end

minetest.register_craft({
	type = "fuel",
	recipe = "group:boat",
	burntime = 20,
})

local time_to_load= os.clock() - init
print(string.format("[MOD] "..minetest.get_current_modname().." loaded in %.4f s", time_to_load))

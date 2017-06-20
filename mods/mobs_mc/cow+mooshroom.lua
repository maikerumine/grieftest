--License for code WTFPL and otherwise stated in readmes

local cow_def = {
	type = "animal",
	hp_min = 10,
	hp_max = 10,
	collisionbox = {-0.45, -0.01, -0.45, 0.45, 1.39, 0.45},
	rotate = -180,
	visual = "mesh",
	mesh = "mobs_mc_cow.b3d",
	textures = {
		{"mobs_mc_cow.png"},
	},
	visual_size = {x=2.8, y=2.8},
	makes_footstep_sound = true,
	walk_velocity = 1,
	drops = {
		{name = "mobs_mc:beef_raw",
		chance = 1,
		min = 1,
		max = 3,},
		{name = "mobs:leather",
		chance = 1,
		min = 0,
		max = 2,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	runaway = true,
	sounds = {
		random = "Cow1",
		death = "Cowhurt1",
		damage = "Cowhurt1",
	},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "farming:wheat",
	on_rightclick = function(self, clicker)
		if self.child then
			return
		end
		local item = clicker:get_wielded_item()
		if item:get_name() == "bucket:bucket_empty" and clicker:get_inventory() then
			local inv = clicker:get_inventory()
			inv:remove_item("main", "bucket:bucket_empty")
			-- if room add bucket of milk to inventory, otherwise drop as item
			if inv:room_for_item("main", {name="mobs_mc:milk_bucket"}) then
				clicker:get_inventory():add_item("main", "mobs_mc:milk_bucket")
			else
				local pos = self.object:getpos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "mobs_mc:milk_bucket"})
			end
		end
		mobs:capture_mob(self, clicker, 0, 5, 60, false, nil)
	end,
	follow = "farming:wheat",
	view_range = 10,
	fear_height = 2,
}

mobs:register_mob("mobs_mc:cow", cow_def)

-- Mooshroom
local mooshroom_def = table.copy(cow_def)

mooshroom_def.mesh = "mobs_mc_mooshroom.b3d"
mooshroom_def.textures = { {"mobs_mc_mooshroom.png"}, }
mooshroom_def.on_rightclick = function(self, clicker)
	if self.child then
		return
	end
	local item = clicker:get_wielded_item()
	-- Use shears to get mushrooms and turn mooshroom into cow
	if item:get_name() == "mobs:shears" then
		local pos = self.object:getpos()
		minetest.sound_play("shears", {pos = pos})
		minetest.add_item({x=pos.x, y=pos.y+1.4, z=pos.z}, "flowers:mushroom_red 5")

		local oldyaw = self.object:getyaw()
		self.object:remove()
		local cow = minetest.add_entity(pos, "mobs_mc:cow")
		cow:setyaw(oldyaw)

		if not minetest.setting_getbool("creative_mode") then
			item:add_wear(300)
			clicker:get_inventory():set_stack("main", clicker:get_wield_index(), item)
		end
	-- Use bucket to milk
	elseif item:get_name() == "bucket:bucket_empty" and clicker:get_inventory() then
		local inv = clicker:get_inventory()
		inv:remove_item("main", "bucket:bucket_empty")
		-- If room, add milk to inventory, otherwise drop as item
		if inv:room_for_item("main", {name="mobs_mc:milk_bucket"}) then
			clicker:get_inventory():add_item("main", "mobs_mc:milk_bucket")
		else
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "mobs_mc:milk_bucket"})
		end
	-- Use bowl to get mushroom stew
	elseif item:get_name() == "mobs_mc:bowl" and clicker:get_inventory() then
		local inv = clicker:get_inventory()
		inv:remove_item("main", "mobs_mc:bowl")
		-- If room, add mushroom stew to inventory, otherwise drop as item
		if inv:room_for_item("main", {name="mobs_mc:mushroom_stew"}) then
			clicker:get_inventory():add_item("main", "mobs_mc:mushroom_stew")
		else
			local pos = self.object:getpos()
			pos.y = pos.y + 0.5
			minetest.add_item(pos, {name = "mobs_mc:mushroom_stew"})
		end
	end
	mobs:capture_mob(self, clicker, 0, 5, 60, false, nil)
end
mobs:register_mob("mobs_mc:mooshroom", mooshroom_def)


-- Spawning
mobs:register_spawn("mobs_mc:cow", {"default:dirt_with_grass"}, 20, 8, 17000, 2, 31000)
mobs:register_spawn("mobs_mc:mooshroom", {"default:mycelium_snow", "default:mycelium"}, 20, 8, 7000, 1, 31000)


-- compatibility
mobs:alias_mob("mobs_animal:cow", "mobs_mc:cow")

-- spawn egg
mobs:register_egg("mobs_mc:cow", "Cow", "mobs_mc_spawn_icon_cow.png", 0)
mobs:register_egg("mobs_mc:mooshroom", "Mooshroom", "mobs_mc_spawn_icon_mooshroom.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Cow loaded")
end

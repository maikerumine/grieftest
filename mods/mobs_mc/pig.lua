--License for code WTFPL and otherwise stated in readmes

mobs:register_mob("mobs_mc:pig", {
	type = "animal",
	runaway = true,
	hp_min = 10,
	hp_max = 10,
	collisionbox = {-0.45, -0.01, -0.45, 0.45, 0.865, 0.45},
	rotate = -180,
	visual = "mesh",
	mesh = "pig.b3d",
	textures = {
		{"mobs_mc_pig.png"},
	},
	visual_size = {x=2.5, y=2.5},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3,
	drops = {
		{name = "mobs:pork_raw",
		chance = 1,
		min = 1,
		max = 3,},
	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	fear_height = 4,
	sounds = {
		random = "mobs_pig",
		death = "mobs_pig_angry",
		damage = "mobs_pig",
		distance = 16,
	},
	animation = {
		speed_normal = 40,
		stand_start = 0,
		stand_end = 0,
		walk_start = 0,
		walk_end = 40,
		hurt_start = 118,
		hurt_end = 154,
		death_start = 154,
		death_end = 179,
		eat_start = 49,
		eat_end = 78,
		look_start = 78,
		look_end = 108,
	},
	follow = {"default:apple", "farming:potato", "farming:carrot", "mobs_mc:carrot_on_a_stick"},
	view_range = 5,
	do_custom = function(self, dtime)

		-- set needed values if not already present
		if not self.v2 then
			self.v2 = 0
			self.max_speed_forward = 2  --swap due to -180 model
			self.max_speed_reverse = 4  --swap due to -180 model
			self.accel = 4
			self.terrain_type = 3
			self.driver_attach_at = {x = 0.0, y = 6.75, z = 1.5}
			self.player_rotation = {x = 0, y = 180, z = 0}
			self.driver_eye_offset = {x = 0, y = 3, z = 0}
			self.driver_scale = {x = 1/self.visual_size.x, y = 1/self.visual_size.y}
		end

		-- if driver present allow control of horse
		if self.driver then

			mobs.drive(self, "walk", "stand", false, dtime)

			return false -- skip rest of mob functions
		end

		return true
	end,

	on_die = function(self, pos)

		-- drop saddle when horse is killed while riding
		-- also detach from horse properly
		if self.driver then
			minetest.add_item(pos, "mobs:saddle")
			mobs.detach(self.driver, {x = 1, y = 0, z = 1})
		end

	end,

	on_rightclick = function(self, clicker)
		if not clicker or not clicker:is_player() then
			return
		end

		local wielditem = clicker:get_wielded_item()
		-- Feed pig
		if wielditem:get_name() ~= "mobs_mc:carrot_on_a_stick" then
			if mobs:feed_tame(self, clicker, 1, true, true) then
				return
			end
		end

		-- Put saddle on pig
		local item = clicker:get_wielded_item()
		if item:get_name() == "mobs:saddle" and self.saddle ~= "yes" then
			self.base_texture = {"mobs_mc_pig.png^mobs_mc_pig_saddle.png"}
			self.object:set_properties({
				textures = self.base_texture
			})
			self.saddle = "yes"
			self.tamed = true
			self.drops = {
				{name = "mobs:pork_raw",
				chance = 1,
				min = 1,
				max = 3,},
				{name = "mobs:saddle",
				chance = 1,
				min = 1,
				max = 1,},
			}
			if not minetest.settings:get_bool("creative_mode") then
				local inv = clicker:get_inventory()
				local stack = inv:get_stack("main", clicker:get_wield_index())
				stack:take_item()
				inv:set_stack("main", clicker:get_wield_index(), stack)
			end
			return
		end

		-- Mount or detach player
		local name = clicker:get_player_name()
		if self.driver and clicker == self.driver then
			-- Detach if already attached
			mobs.detach(clicker, {x=1, y=0, z=0})
			return

		elseif not self.driver and self.saddle == "yes" and wielditem:get_name() == "mobs_mc:carrot_on_a_stick" then
			-- Ride pig if it has a saddle and player uses a carrot on a stick

			mobs.attach(self, clicker)

			if not minetest.settings:get_bool("creative_mode") then

				local inv = self.driver:get_inventory()
				-- 26 uses
				if wielditem:get_wear() > 63000 then
					-- Break carrot on a stick
					local def = wielditem:get_definition()
					if def.sounds and def.sounds.breaks then
						minetest.sound_play(def.sounds.breaks, {pos = clicker:getpos(), max_hear_distance = 8, gain = 0.5})
					end
					if minetest.get_modpath("fishing") then
						wielditem = {name = "fishing:pole_wood", count = 1}
					else
						wielditem = {name = "default:stick", count = 1}
					end
				else
					wielditem:add_wear(2521)
				end
				inv:set_stack("main",self.driver:get_wield_index(), wielditem)
			end
			return
		end

		-- used to capture pig with magic lasso
		mobs:capture_mob(self, clicker, 0, 0, 80, false, nil)
	end,
})

mobs:register_spawn("mobs_mc:pig", {"default:dirt_with_grass"}, minetest.LIGHT_MAX, 9, 15000, 30, 31000)
	


-- compatibility
mobs:alias_mob("mobs:pig", "mobs_mc:pig")

-- spawn eggs
mobs:register_egg("mobs_mc:pig", "Pig", "mobs_mc_spawn_icon_pig.png", 0)

if minetest.settings:get("log_mods") then
	minetest.log("action", "MC Pig loaded")
end

mobs:spawn_specific("nssm:mese_dragon", {"default:bedrock","default:mese"}, {"air"},
	0, 20, 60, 300, 2, -31000, -50)
	
	

mobs:register_mob("nssm:mese_dragon", {
	type = "monster",
	hp_max = 333,
	hp_min = 333,
	collisionbox = {-1, 0, -1, 1, 5, 1},
	visual = "mesh",
	mesh = "mese_dragon.x",
	textures = {{"mese_dragon.png"}},
	visual_size = {x=12, y=12},
	makes_footstep_sound = true,
	view_range = 45,
	rotate = 270,
	fear_height = 5,
	walk_velocity = 2,
	run_velocity = 4,
    sounds = {
		shoot_attack = "mesed",
		attack = "mese_dragon",
		distance = 60,
	},
	damage = 16,
	jump = true,
	jump_height = 10,
	jump_chance = 98,
	fear_height = 120,	
	--fly = true,
	dogshoot_switch = 1,
	dogshoot_count_max =1,
	passive = false,
	floats=1,
	drops = {
		{name = "mobs:mese_meteor",
		chance = 1,
		min = 1,
		max = 1},
		{name = "default:mese_crystal",
		chance = 1,
		min = 99,
		max = 99},
		{name = "nssm:sun_sword", chance = 1, min = 1, max = 1},
    },
	armor = 60,
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = nil,
	attack_type = "dogshoot",
	explosion_radius = 14,
	dogshoot_stop = true,
	--arrow = "mobs:roar_of_the_dragon",
	--arrow = "nssm:roar_of_the_dragon",
	--arrow = "mobs:fireball",
	arrow = "nssm:fireball2",
	reach = 5,
	shoot_interval = 0.5,
	shoot_offset = -1,
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 60,
		stand_end = 120,
		walk_start = 161,
		walk_end = 205,
		run_start = 206,
		run_end = 242,
		punch_start = 242,
		punch_end = 275,
		punch1_start = 330,
		punch1_end = 370,
    dattack_start = 120,
    dattack_end = 160,
    	--attacks_monsters = true,
	--peaceful = false,
	--group_attack = true,
	},
--[[
	do_custom = function(self)
		--mobs:midas_ability(self, "default:mese_block", self.run_velocity,2, 3)
		mobs:midas_ability(self, "default:glass", self.run_velocity,2, 3)
	end,

	custom_attack = function(self)
		if self.timer > 1 then
			self.timer = 0
			self.attack_rip = self.attack_rip+1

			local s = self.object:getpos()
			local p = self.attack:getpos()

			p.y = p.y + 1.5
			s.y = s.y + 1.5

			if minetest.line_of_sight(p, s) == true then
				-- play attack sound
				if self.sounds.attack then
					minetest.sound_play(self.sounds.attack, {
						object = self.object,
						max_hear_distance = self.sounds.distance
					})
				end
				-- punch player
				self.attack:punch(self.object, 1.0,  {
					full_punch_interval=1.0,
					damage_groups = {fleshy=self.damage}
				}, nil)
			end
			if self.attack_rip>=8 then
				self.attack_rip =0
				set_animation("punch1")
				for dx = -17,17 do
					for dz= -17,17 do
						local k = {x = s.x+dx, y=s.y+20, z=s.z+dz}
						local n = minetest.env:get_node(k).name
						if n=="air" and math.random(1,23)==1 then
							minetest.env:set_node(k, {name="nssm:mese_meteor"})
							nodeupdate(k)
						end
					end
				end
			end
		end
	end
	]]
})



mobs:register_arrow("nssm:roar_of_the_dragon", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	--textures = {"transparent.png"},
	textures = {"mese_egg.png"},
	velocity = 10,

	on_step = function(self, dtime)

		local pos = self.object:getpos()

		local n = minetest.env:get_node(pos).name

		if self.timer == 0 then
			self.timer = os.time()
		end

		if os.time() - self.timer > 8 or minetest.is_protected(pos, "") then
			self.object:remove()
		end

		local objects = minetest.env:get_objects_inside_radius(pos, 1)
	    for _,obj in ipairs(objects) do
			local name = obj:get_entity_name()
			if name~="nssm:roar_of_the_dragon" and name ~= "nssm:mese_dragon" then
		        obj:set_hp(obj:get_hp()-0.05)
		        if (obj:get_hp() <= 0) then
		            if (not obj:is_player()) and name ~= self.object:get_luaentity().name then
		                obj:remove()
		            end
		        end
			end
	    end

		minetest.env:set_node(pos, {name="air"})
		if math.random(1,2)==1 then
			dx = math.random(-1,1)
			dy = math.random(-1,1)
			dz = math.random(-1,1)
			local p = {x=pos.x+dx, y=pos.y+dy, z=pos.z+dz}
			minetest.env:set_node(p, {name="air"})
		end
	end
})
--GOOD LUCK LOL!
-- fireball (weapon)
mobs:register_arrow(":nssm:fireball2", {
	visual = "sprite",
	visual_size = {x = 1.5, y = 1.5},
	--textures = {"mobs_fireball.png"},
	textures = {"mobs_skeleton2_front.png^[makealpha:255,255,255 "},
	velocity = 6,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 8},
		}, nil)

	end,

	hit_mob = function(self, player)
	minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		player:punch(self.object, 1.0, {
			full_punch_interval = 0.5,
			damage_groups = {fleshy = 8},
		}, nil)
		
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 6, 1, 0)
		--from tnt
		minetest.sound_play("tnt_explode", {pos = pos, gain = 1.5, max_hear_distance = 2*64})
		
	end
})




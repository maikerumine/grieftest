
mobs:register_mob("nssm:uloboros", {
	type = "monster",
	hp_max = 18,
	hp_min = 17,
	collisionbox = {-0.5, 0.00, -0.5, 0.5, 0.8, 0.5},
	visual = "mesh",
	mesh = "uloboros.x",
	textures = {{"uloboros.png"}},
	visual_size = {x=4, y=4},
	makes_footstep_sound = true,
	view_range = 22,
	walk_velocity = 1.5,
	fear_height = 4,
	run_velocity = 2.5,
	rotate = 270,
	sounds = {
		random = "uloboros",
	},
	damage = 8,
	jump = true,
	drops = {
		{name = "default:mese_crystal_fragment", chance = 2, min = 1, max = 2},
	},
	armor = 100,
	water_damage = 1,
	lava_damage = 7,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 20,
		speed_run = 30,
		stand_start = 1,
		stand_end = 80,
		walk_start = 120,
		walk_end = 160,
		run_start = 120,
		run_end = 160,
		punch_start = 80,
		punch_end = 110,
	},
--[[
	do_custom = function(self)

		if math.random(1, 75) > 1 then
			return
		end

		local pos = self.object:getpos()
		local dx = math.random(1, 3)
		local dz = math.random(1, 3)
		local p = {x = pos.x + dx, y = pos.y - 1, z = pos.z + dz}
		local t = {x = pos.x + dx, y = pos.y, z = pos.z + dz}

		if minetest.get_node(p).name ~= "air"
		and minetest.get_node(t).name == "air" then

			minetest.set_node(t, {name = "nssm:web"})
		end
	end,
]]
})

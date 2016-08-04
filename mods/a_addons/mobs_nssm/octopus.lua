
mobs:register_mob("nssm:octopus", {
	type = "monster",
	hp_max = 22,
	hp_min = 15,
	collisionbox = {-0.9, -0.5, -0.9, 0.9, 0.92, 0.9},
	visual = "mesh",
	mesh = "octopus.x",
	textures = {{"octopus.png"}},
	visual_size = {x=4, y=4},
	view_range = 25,
	fly = true,
	fly_in = "default:water_source",
	fall_speed = -20,
	walk_velocity = 1.5,
	run_velocity = 3,
	damage = 2,
	rotate = 270,
	jump = false,
	jump_chance = 0,
	jump_height = 0,
	sounds = {
		random = "octopus",
	},
	drops = {
		{name = "default:mese_crystal_fragment", chance = 1, min = 2, max = 3},
		{name = "nssm:crab_light_mace", chance = 16, min = 0, max = 1},
	},
	armor = 100,
	water_damage = 0,
	lava_damage = 10,
	light_damage = 0,
	attack_type = "dogfight",
	animation = {
		speed_normal = 25,
		speed_run = 35,
		stand_start = 1,
		stand_end = 50,
		walk_start = 60,
		walk_end = 100,
		run_start = 60,
		run_end = 100,
		punch_start = 120,
		punch_end = 160,
	}
})

--MCmobs v0.4
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")


--###################
--################### OCELOT - CAT
--###################


--mcocelot
mobs:register_mob("mobs_mc:ocelot", {
	type = "animal",
	hp_min = 10,
	hp_max = 10,
	    --collisionbox = {-0.268, -0.02, -0.268,  0.268, -0.5, 0.268},
		collisionbox = {-0.3, -0.03, -0.3, 0.3, 0.4, 0.3},
    rotate = -180,
	visual = "mesh",
	mesh = "cat.b3d",
    textures = {{"cat.png"},{"cat1.png"},{"cat2.png"},{"cat3.png"},{"cat4.png"}},
	visual_size = {x=3, y=3},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 3,
	drops = {

	},
	drawtype = "front",
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 3,
	sounds = {
		random = "mobs_kitten",
		--death = "Sheep3",
		--damage = "Sheep3",
	},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},
	follow = "fishing:fish_raw",
	view_range = 12,
	passive = false,
	attack_type = "dogfight",
	pathfinding = true,
	damage = 2,
attacks_monsters = true,

})

--spawn
mobs:register_spawn("mobs_mc:ocelot", {"default:dirt_with_dry__grass"}, 20, 12, 15000, 2, 31000)

-- compatibility
mobs:alias_mob("mobs:kitten", "mobs_mc:ocelot")

-- spawn eggs
mobs:register_egg("mobs_mc:ocelot", "Ocelot", "cat_inv.png", 0)

if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Ocelot loaded")
end

--MCmobs v0.2
--maikerumine
--made for MC like Survival game
--License for code WTFPL and otherwise stated in readmes


--dofile(minetest.get_modpath("mobs").."/api.lua")

mobs:register_mob("mobs_mc:cow", {
	type = "animal",
	hp_max = 28,
	collisionbox = {-0.6, -0.01, -0.6, 0.6, 1.8, 0.6},
	
	visual = "mesh",
	mesh = "mobs_cow.x",
	textures = {
	{"mobs_cow.png"}
	},
	makes_footstep_sound = true,
	walk_velocity = 1,
	armor = 200,
	drops = {
		{name = "mobs:beef_raw",
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
	sounds = {
		random = "Cow1",
		death = "Cowhurt1",
		damage = "Cowhurt1",
	},
	animation = {
		speed_normal = 24,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 49,
		hurt_start = 118,
		hurt_end = 154,
		death_start = 154,
		death_end = 179,
		eat_start = 49,
		eat_end = 78,
		look_start = 78,
		look_end = 108,
	},
	follow = "farming:wheat",
	view_range = 5,
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "bucket:bucket_empty" and clicker:get_inventory() then
			local inv = clicker:get_inventory()
			inv:remove_item("main", "bucket:bucket_empty")
			-- if room add bucket of milk to inventory, otherwise drop as item
			if inv:room_for_item("main", {name="mobs:bucket_milk"}) then
				clicker:get_inventory():add_item("main", "mobs:bucket_milk")
			else
				local pos = self.object:getpos()
				pos.y = pos.y + 0.5
				minetest.add_item(pos, {name = "mobs:bucket_milk"})
			end
		end
	end,
})
mobs:register_spawn("mobs_mc:cow", {"default:dirt_with_grass"}, 20, 8, 7000, 1, 31000)


-- beef
minetest.register_craftitem(":mobs:beef_raw", {
	description = "Raw Beef",
	inventory_image = "beef_raw.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem(":mobs:beef_cooked", {
	description = "Steak",
	inventory_image = "beef_cooked.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:beef_cooked",
	recipe = "mobs:beef_raw",
	cooktime = 5,
})


-- saddle
minetest.register_craftitem(":mobs:saddle", {
	description = "Saddle",
	inventory_image = "saddle.png",
})

minetest.register_craft({
	output = "mobs:saddle",
	recipe = {
		{"mobs:leather", "mobs:leather", "mobs:leather"},
		{"farming:string", "", "farming:string"},
	{"default:steel_ingot", "", "default:steel_ingot"}
	},
})


-- compatibility
mobs:alias_mob("mobs:cow", "mobs_mc:cow")

-- spawn egg
mobs:register_egg("mobs_mc:cow", "Cow", "spawn_egg_cow.png")


if minetest.setting_get("log_mods") then
	minetest.log("action", "MC Cow loaded")
end
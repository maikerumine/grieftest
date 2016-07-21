--MC Heads for minetest
--maikerumine

minetest.register_node( "mobs_mc:creeper_head", {
	description = "Creeper Head-W.I.P.",
	tiles = {
		"mobs_creeper_top.png",
		"mobs_creeper_top.png",  --was bottom
		"mobs_creeper_side.png",
		"mobs_creeper_side.png",
		"mobs_creeper_side.png", --was rear
		"mobs_creeper_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:enderman_head", {
	description = "Enderman Head-W.I.P.",
	tiles = {
		"mobs_endermen_top.png",
		"mobs_endermen_top.png",
		"mobs_endermen_side.png",
		"mobs_endermen_side.png",
		"mobs_endermen_side.png",
		"mobs_endermen_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:ghast_head", {
	description = "Ghast Head-W.I.P.",
	tiles = {
		"ghast_white.png",
		"ghast_white.png",
		"ghast_white.png",
		"ghast_white.png",
		"ghast_white.png",
		"mobs_ghast_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:skeleton_head", {
	description = "Skeleton Head-W.I.P.",
	tiles = {
		"mobs_skeleton_top.png",
		"mobs_skeleton_top.png",
		"mobs_skeleton_side.png",
		"mobs_skeleton_side.png",
		"mobs_skeleton_side.png",
		"mobs_skeleton_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = false,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:skeleton2_head", {
	description = "Skeleton2 Head-W.I.P.",
	tiles = {
		"mobs_skeleton2_top.png",
		"mobs_skeleton2_top.png",
		"mobs_skeleton2_side.png",
		"mobs_skeleton2_side.png",
		"mobs_skeleton2_side.png",
		"mobs_skeleton2_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:spider_head", {
	description = "Spider Head-W.I.P.",
	tiles = {
		"mobs_spider_top.png",
		"mobs_spider_top.png",
		"mobs_spider_side.png",
		"mobs_spider_side.png",
		"mobs_spider_side.png",
		"mobs_spider_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:zombie_head", {
	description = "Zombie Head-W.I.P.",
	tiles = {
		"mobs_zombie_top.png",
		"mobs_zombie_top.png",
		"mobs_zombie_side.png",
		"mobs_zombie_side.png",
		"mobs_zombie_side.png",
		"mobs_zombie_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})

minetest.register_node( "mobs_mc:zombiepig_head", {
	description = "Zombie Pigmen Head-W.I.P.",
	tiles = {
		"mobs_zombiepig_top.png",
		"mobs_zombiepig_top.png",
		"mobs_zombiepig_side.png",
		"mobs_zombiepig_side.png",
		"mobs_zombiepig_side.png",
		"mobs_zombiepig_front.png"
	},
	paramtype2 = "facedir",
			node_box = {
				type = "fixed",
				fixed = {-0.25, -0.5, -0.25, 0.25, 0.00, 0.25},
			},
			
	drawtype = "nodebox",
	paramtype = "light",
	visual_scale = 1.0,
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
	stack_max = 1,
})


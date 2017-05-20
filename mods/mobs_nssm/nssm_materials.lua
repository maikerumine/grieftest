
--ore generation
--[[
minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:cobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:mossycobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1000,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "default:sandstonebrick",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1000,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "stairs:stair_sandstonebrick",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1000,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "nssm:ant_dirt",
		wherein        = "stairs:stair_cobble",
		clust_scarcity = 1,
		clust_num_ores = 27,
		clust_size     = 3,
		y_min     = -1000,
		y_max     = 40,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs:cobweb",
		wherein        = "default:junglegrass",
		clust_scarcity = 2*2*2,
		clust_num_ores = 2,
		clust_size     = 2,
		y_min     = -20,
		y_max     = 200,
			})

minetest.register_ore({
		ore_type       = "scatter",
		ore            = "mobs:cobweb",
		wherein        = "default:jungleleaves",
		clust_scarcity = 4*4*4,
		clust_num_ores = 5,
		clust_size     = 5,
		y_min     = -20,
		y_max     = 200,
			}
)
]]
--nodes
minetest.register_node("nssm:mese_meteor", {
	description = "Mese Meteor",
	tile_images = {"mese_meteor.png"} ,
	paramtype = "light",
	drop = "",
	groups = {crumbly=1, falling_node=1, flammable = 2},
	

})
minetest.register_abm({
	nodenames = {"nssm:mese_meteor"},
	neighbors = {"air"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		--local under = {x=pos.x, y=pos.y-1, z=pos.z}
		--local n = minetest.env:get_node(under).name
		--if n~= "air" then
		minetest.set_node({x=pos.x+1, y=pos.y, z=pos.z}, {name = "fire:basic_flame"})
		minetest.set_node({x=pos.x-1, y=pos.y, z=pos.z}, {name = "fire:basic_flame"})
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z-1}, {name = "fire:basic_flame"})
		minetest.set_node({x=pos.x, y=pos.y, z=pos.z+1}, {name = "fire:basic_flame"})
		minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z}, {name = "fire:basic_flame"})

		--on_punch = function(self, pos)	
			--mese_dragon = minetest.add_entity(self.object:getpos(), "nssm:mese_dragon")
			--ent = mese_dragon:get_luaentity()
		--end
		
		--on_punch = function(node,pos)
			--mese_dragon = minetest.add_entity(node:getpos(), "nssm:mese_dragon")
			--ent = mese_dragon:get_luaentity()
		--end
end	
})

--SPAWN BY BUILDING
--Code from Andre "LAG"

--redefine mese
minetest.register_node(":default:mese", {
	description = "MESE",
	tiles = {"default_mese_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=3},
	sounds = default.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local stack = ItemStack("default:mese")
		local pos = pointed_thing.above

		if
			minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name=="default:mese" and
			minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z+1}).name=="default:mese" and
			minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name=="default:mese" and
			minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name=="default:mese" and
			minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z+1}).name=="default:mese" and
			minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z-1}).name=="default:mese" and
			minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name=="default:mese" and
			minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name=="default:mese"
		then
			stack = ItemStack("nssm:mese_meteor")
			--local mob = minetest.add_entity(pos, "nssm:mese_dragon")

		end
		local ret = minetest.item_place(stack, placer, pointed_thing)
		if ret==nil then
			return itemstack
		else
			return ItemStack("default:mese "..itemstack:get_count()-(1-ret:get_count()))
		end
	end,
})

	--redefine dragon_block
minetest.register_node(":default:dragon_block", {
	description = "Dragon Block -Use for spawning Mese Dragon",
	drawtype = "glasslike",
	tiles = {"default_dragon_block.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3},
	sounds = default.node_sound_glass_defaults(),
	light_source = default.LIGHT_MAX,
	stack_max = 64,
	on_place = function(itemstack, placer, pointed_thing)
		local stack = ItemStack("default:dragon_block")
		local pos = pointed_thing.above
		if
			minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z}).name=="default:dragon_block" and
			minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z+1}).name=="default:dragon_block" and
			minetest.get_node({x=pos.x+1,y=pos.y,z=pos.z-1}).name=="default:dragon_block" and
			minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z}).name=="default:dragon_block" and
			minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z+1}).name=="default:dragon_block" and
			minetest.get_node({x=pos.x-1,y=pos.y,z=pos.z-1}).name=="default:dragon_block" and
			minetest.get_node({x=pos.x,y=pos.y,z=pos.z+1}).name=="default:dragon_block" and
			minetest.get_node({x=pos.x,y=pos.y,z=pos.z-1}).name=="default:dragon_block"
		then
			stack = ItemStack("nssm:mese_meteor")
			local mob = minetest.add_entity(pos, "nssm:mese_dragon")

		end
		local ret = minetest.item_place(stack, placer, pointed_thing)
		if ret==nil then
			return itemstack
		else
			return ItemStack("default:dragon_block "..itemstack:get_count()-(1-ret:get_count()))
		end
	end,
})	
--[[	
minetest.register_node("nssm:ant_dirt", {
	description = "Ant Dirt",
	tiles = {"ant_dirt.png"},
	groups = {crumbly=3},
})

minetest.register_node("nssm:web", {
	description = "Web",
	inventory_image = "web.png",
	tiles = {"web.png"} ,
	drawtype = "plantlike",
	paramtype = "light",
	walkable = false,
	pointable = true,
	diggable = true,
	buildable_to = false,
	drop = "farming:cotton",
	drowning = 0,
	liquid_renewable = false,
	liquidtype = "source",
	liquid_range = 0,
	liquid_alternative_flowing = "nssm:web",
	liquid_alternative_source = "nssm:web",
	liquid_viscosity = 20,
	groups = {flammable = 2, snappy = 1},
})
]]
--tools
--mesedragon
minetest.register_tool('nssm:sun_sword', {
	description = 'Sun Sword',
	inventory_image = 'sun_sword.png',
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.80, [2]=0.40, [3]=0.20}, uses=70, maxlevel=1},
			fleshy={times={[2]=0.6, [3]=0.2}, uses=70, maxlevel=1}
		},
		damage_groups = {fleshy=10},
	},
	minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)
		if puncher:get_wielded_item():get_name() == 'nssm:sun_sword' then
			if node.name ~= "air" then
				minetest.add_node(pointed_thing.above, {name = "fire:basic_flame"})
			end
		end
	end)
})

--[[
--spiders
minetest.register_tool("nssm:masticone_fang_sword", {
	description = "Masticone Fang Sword",
	inventory_image = "masticone_fang_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.6, [2]=0.5, [3]=0.4}, uses=200, maxlevel=1},
			fleshy={times={[2]=0.8, [3]=0.4}, uses=200, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})
--heron
minetest.register_tool("nssm:night_sword", {
	description = "Night Sword",
	inventory_image = "night_sword.png",
	tool_capabilities = {
		full_punch_interval =0.4 ,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=0.4, [2]=0.3, [3]=0.2}, uses=300, maxlevel=1},
			fleshy={times={[2]=0.7, [3]=0.3}, uses=300, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
})
--oct
minetest.register_tool("nssm:crab_light_mace", {
	description = "Light Crab Mace",
	inventory_image = "crab_light_mace.png",
	tool_capabilities = {
		full_punch_interval =2 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.4, [3]=1}, uses=120, maxlevel=1}
		},
		damage_groups = {fleshy=8},
	},
})
--uboloc
minetest.register_tool("nssm:crab_heavy_mace", {
	description = "Heavy Crab Mace",
	inventory_image = "crab_heavy_mace.png",
	tool_capabilities = {
		full_punch_interval =4 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=2, [3]=1.4}, uses=120, maxlevel=1}
		},
		damage_groups = {fleshy=12},
	},
})

minetest.register_node("nssm:rope", {
	description = "Rope",
	paramtype = "light",
	walkable = false,
	climbable = true,
	sunlight_propagates = true,
	drawtype = "plantlike",
	tiles = { "rope.png" },
	groups = {snappy=1},
})

--werwolfe
minetest.register_tool("nssm:stoneater_pick", {
	description = "Stoneater Pickaxe",
	inventory_image = "stoneater_pick.png",
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=0.0}, uses=200, maxlevel=1},
		},
		damage_groups = {fleshy=5},
	},
})
--croc
minetest.register_tool("nssm:mantis_sword", {
	description = "Mantis Sword",
	inventory_image = "mantis_sword.png",
	tool_capabilities = {
		full_punch_interval =0.7 ,
		max_drop_level=1,
		groupcaps={
			fleshy={times={[2]=1.0, [3]=0.4}, uses=50, maxlevel=1},
			snappy={times={[2]=0.80, [3]=0.3}, uses=100, maxlevel=1},
		},
		damage_groups = {fleshy=6},
	},
})
--ants
minetest.register_tool("nssm:ant_sword", {
	description = "Ant Sword",
	inventory_image = "ant_sword.png",
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.30, [2]=0.90, [3]=0.40}, uses=40, maxlevel=3},
		},
		damage_groups = {fleshy=8},
	},
})
]]
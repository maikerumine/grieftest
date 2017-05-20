local use_moreores = minetest.get_modpath("moreores")

-- Regisiter Shields

minetest.register_tool("shields:shield_wood", {
	description = "Wooden Shield",
	inventory_image = "shields_inv_shield_wood.png",
	groups = {armor_shield=5, armor_heal=0, armor_use=2000},
	wear = 0,
})

minetest.register_tool("shields:shield_steel", {
	description = "Steel Shield",
	inventory_image = "shields_inv_shield_steel.png",
	groups = {armor_shield=10, armor_heal=0, armor_use=500},
	wear = 0,
})
--[[
minetest.register_tool("shields:shield_bronze", {
	description = "Bronze Shield",
	inventory_image = "shields_inv_shield_bronze.png",
	groups = {armor_shield=10, armor_heal=6, armor_use=250},
	wear = 0,
})
]]
minetest.register_tool("shields:shield_diamond", {
	description = "Diamond Shield",
	inventory_image = "shields_inv_shield_diamond.png",
	groups = {armor_shield=15, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("shields:shield_gold", {
	description = "Gold Shield",
	inventory_image = "shields_inv_shield_gold.png",
	groups = {armor_shield=10, armor_heal=6, armor_use=250},
	wear = 0,
})

if use_moreores then
	minetest.register_tool("shields:shield_mithril", {
		description = "Mithril Shield",
		inventory_image = "shields_inv_shield_mithril.png",
		groups = {armor_shield=15, armor_heal=12, armor_use=50},
		wear = 0,
	})
end

local craft_ingreds = {
	wood = "default:wood",
	steel = "default:steel_ingot",
	--bronze = "default:bronze_ingot",
	diamond = "default:diamond",
	gold = "default:gold_ingot",
}


minetest.register_tool("shields:shield_veteran", {
	description = "Veteran Shield",
	inventory_image = "shields_inv_shield_veteran.png",
	groups = {armor_shield=15, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("shields:shield_rusher", {
	description = "Rusher Shield",
	inventory_image = "shields_inv_shield_rusher.png",
	groups = {armor_shield=15, armor_heal=12, armor_use=100},
	wear = 0,
})

minetest.register_tool("shields:shield_nomad", {
	description = "Nomad Shield",
	inventory_image = "shields_inv_shield_nomad.png",
	groups = {armor_shield=15, armor_heal=12, armor_use=100},
	wear = 0,
})


if use_moreores then
	craft_ingreds.mithril = "moreores:mithril_ingot"
end

for k, v in pairs(craft_ingreds) do
	minetest.register_craft({
		output = "shields:shield_"..k,
		recipe = {
			{v, v, v},
			{v, v, v},
			{"", v, ""},
		},
	})
end

minetest.register_craft({
	output = 'shields:shield_nomad',
	recipe = {
		{'default:steel_ingot', 'dye:blue', 'default:steel_ingot'},
		{'default:steel_ingot', 'shields:shield_diamond', 'default:steel_ingot'},
		{'default:steel_ingot', 'flowers:flower_dandelion_white', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'shields:shield_rusher',
	recipe = {
		{'default:steel_ingot', 'dye:white', 'default:steel_ingot'},
		{'default:steel_ingot', 'shields:shield_diamond', 'default:steel_ingot'},
		{'default:steel_ingot', 'flowers:flower_dandelion_white', 'default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'shields:shield_veteran',
	recipe = {
		{'default:steel_ingot', 'dye:black', 'default:steel_ingot'},
		{'default:steel_ingot', 'shields:shield_diamond', 'default:steel_ingot'},
		{'default:steel_ingot', 'flowers:flower_dandelion_white', 'default:steel_ingot'},
	}
})



minetest.after(0, function()
	table.insert(armor.elements, "shield")
end)



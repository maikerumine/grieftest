local colors = {
	"White", "Black", "Light Blue", "Green", "Red",
	"Light Gray", "Purple", "Lime", "Magenta", "Orange",
	"Brown", "Blue", "Yellow", "Pink", "Cyan", "Gray"
}

minetest.register_node("hardenedclay:hardened_clay", {
	description = "Hardened Clay",
	tiles = {"hardened_clay.png"},
	groups = {cracky=3},
})

minetest.register_craft({
	type = "cooking",
	output = "hardenedclay:hardened_clay",
	recipe = "default:clay",
})

for _, color in pairs(colors) do
	local nodecolor = color:lower():gsub(" ", "_")
	minetest.register_node("hardenedclay:hardened_clay_"..nodecolor, {
		description = color.." Stained Clay",
		tiles = {"hardened_clay_stained_"..nodecolor..".png"},
		groups = {cracky=3},
		sounds = default.node_sound_stone_defaults(),
		stack_max = 64,
	})
	minetest.register_craft({
		type = "shapeless",
		output = 'hardenedclay:hardened_clay_'..nodecolor.." 8",
		recipe = {
			'hardenedclay:hardened_clay', 'hardenedclay:hardened_clay', 'hardenedclay:hardened_clay',
			'hardenedclay:hardened_clay', 'dye:'..nodecolor, 'hardenedclay:hardened_clay',
			'hardenedclay:hardened_clay', 'hardenedclay:hardened_clay', 'hardenedclay:hardened_clay',
		}
	})
	minetest.register_alias("hardenedclay:"..nodecolor.."_hardened_clay",
			"hardenedclay:hardened_clay_"..nodecolor)
end


minetest.register_globalstep(function(dtime)
	local players  = minetest.get_connected_players()
	for i,player in ipairs(players) do
		local function has_clock(player)
			for _,stack in ipairs(player:get_inventory():get_list("main")) do
				if minetest.get_item_group(stack:get_name(), "clock") ~= 0 then
					return true
				end
			end
			return false
		end
		if has_clock(player) then
			local time = math.floor((64 * (minetest.get_timeofday() + .5)) % 64 + 1)

			for j,stack in ipairs(player:get_inventory():get_list("main")) do
				if minetest.get_item_group(stack:get_name(), "clock") ~= 0 and
						minetest.get_item_group(stack:get_name(), "clock") ~= time then
					player:get_inventory():set_stack("main", j, "clock:"..time)
				end
			end
		end
	end
end)

local images = {
    "w0.png",
    "w1.png",
    "w2.png",
    "w3.png",
    "w4.png",
    "w5.png",
    "w6.png",
    "w7.png",
    "w8.png",
    "w9.png",
    "w10.png",
    "w11.png",
    "w12.png",
    "w13.png",
    "w14.png",
    "w15.png",
    "w16.png",
    "w17.png",
    "w18.png",
    "w19.png",
    "w20.png",
    "w21.png",
    "w22.png",
    "w23.png",
    "w24.png",
    "w25.png",
    "w26.png",
    "w27.png",
    "w28.png",
    "w29.png",
    "w30.png",
    "w31.png",
    "w32.png",
    "w33.png",
    "w34.png",
    "w35.png",
    "w36.png",
    "w37.png",
    "w38.png",
    "w39.png",
    "w40.png",
    "w41.png",
    "w42.png",
    "w43.png",
    "w44.png",
    "w45.png",
    "w46.png",
    "w47.png",
    "w48.png",
    "w49.png",
    "w50.png",
    "w51.png",
    "w52.png",
    "w53.png",
    "w54.png",
    "w55.png",
    "w56.png",
    "w57.png",
    "w58.png",
    "w59.png",
    "w60.png",
    "w61.png",
    "w62.png",
    "w63.png",
}

local i
for i,img in ipairs(images) do
	local inv = 1
	if i == 1 then
		inv = 0
	end
	minetest.register_tool("clock:"..(i), {
		description = "Clock",
		inventory_image = img,
		wield_image = img,
		stack_max = 1,
		groups = {not_in_creative_inventory=inv,clock=i}
	})
end

minetest.register_craft({
	output = "clock:1",
	recipe = {
		{"", "default:gold_ingot", ""},
		{"default:gold_ingot", "default:mese_crystal", "default:gold_ingot"},
		{"", "default:gold_ingot", ""},
	},
})

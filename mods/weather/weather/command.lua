minetest.register_privilege("weather", {
	description = "Change the weather",
	give_to_singleplayer = false
})

-- Set weather
minetest.register_chatcommand("weather", {
	params = "<weather>",
	description = "Set weather to rain, snow or none", -- full description
	privs = {weather = true},
	func = function(name, param)
		weather = param
		save_weather()
	end
})

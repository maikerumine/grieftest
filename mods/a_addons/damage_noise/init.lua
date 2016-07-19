--sounds: http://www.freesound.org/people/thecheeseman/sounds/44428/ http://www.freesound.org/people/thecheeseman/sounds/44430/

damage = {}

minetest.register_on_joinplayer(function(player)
	damage[player:get_player_name()] = player:get_hp()
end)

minetest.register_globalstep(function(dtime)
	for _,player in ipairs(minetest.get_connected_players()) do
		local newhp = player:get_hp()
		local oldhp = damage[player:get_player_name()]
		
		if oldhp > newhp then
			local pos = player:getpos()
			minetest.sound_play("hurt", {
				pos = pos,
				max_hear_distance = 100,
				gain = 10.0,
			})
		end
		damage[player:get_player_name()] = newhp
	end
end)

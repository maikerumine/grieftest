--[[
death_messages - A Minetest mod which sends a chat message when a player dies.
Copyright (C) 2016  EvergreenTree

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
--]]

-----------------------------------------------------------------------------------------------
local title = "Death Messages"
local version = "0.1.2"
local mname = "death_messages"
-----------------------------------------------------------------------------------------------
dofile(minetest.get_modpath("death_messages").."/settings.txt")
-----------------------------------------------------------------------------------------------

-- A table of quips for death messages.  The first item in each sub table is the
-- default message used when RANDOM_MESSAGES is disabled.
local messages = {}

-- Lava death messages
messages.lava = {
	" melted into a ball of fire.",
	" thought lava was cool.",
	" melted into a ball of fire.",
	" couldn't resist that warm glow of lava.",
	" dug straight down.",
	" went into the lava curtain.",
	" thought it was a hottub.",
	" is melted.",
	" didn't know lava was hot."
}

-- Drowning death messages
messages.water = {
	" drowned.",
	" ran out of air.",
	" failed at swimming lessons.",
	" tried to impersonate an anchor.",
	" forgot he wasn't a fish.",
	" drank themselves to death.",
	" failed to achieve the underwater challenge.",
	" blew one too many bubbles."
}

-- Burning death messages
messages.fire = {
	" burned to a crisp.",
	" got a little too warm.",
	" got too close to the camp fire.",
	" just got roasted, hotdog style.",
	" gout burned up. More light that way."
}

-- Other death messages
messages.other = {
	" died.",
	" did something fatal.",
	" gave up on life.",
	" is somewhat dead now.",
	" kinda screwed up.",
	" couldn't fight very well.",
	" got 0wn3d.",
	" got SMOKED.",
	" got hurted by Oerkki.",
	" got blowed up.",
	" forgot about gravity.",
	" is a Rusher.",
	" loves 2b2t.",
	" passed out -permanently."
}

function get_message(mtype)
	if RANDOM_MESSAGES then
		return messages[mtype][math.random(1, #messages[mtype])]
	else
		return messages[1] -- 1 is the index for the non-random message
	end
end

minetest.register_on_dieplayer(function(player)
	local player_name = player:get_player_name()
	local node = minetest.registered_nodes[minetest.get_node(player:getpos()).name]
	local pos = player:getpos()
	local death = {x=0, y=-60, z=0}
	if minetest.is_singleplayer() then
		player_name = "You"
	end
	

	
	
	-- Death by lava
	if node.groups.lava ~= nil then
		minetest.chat_send_all(player_name .. get_message("lava")) 
	-- Death by drowning
	elseif player:get_breath() == 0 then
		minetest.chat_send_all(player_name .. get_message("water")) 
	-- Death by fire
	elseif node.name == "fire:basic_flame" then
		minetest.chat_send_all(player_name .. get_message("fire")) 
	-- Death by something else
	else
		minetest.chat_send_all(player_name .. get_message("other")) 
	end
	
	player:setpos(death)
	minetest.chat_send_all(player_name ..(" GG"))

end)

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------

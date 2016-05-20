

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
		groupcaps = {
			cracky = {times={[2]=48.00, [3]=26.70}, uses=0, maxlevel=3},
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[1]=3.50,[2]=2.00,[3]=0.70}, uses=0}
		},
		damage_groups = {fleshy=2},
	}
})

--
-- MM Tool
--
--if minetest.get_player_privs("ADMIN").server then
--on_use = function(player)
--if minetest.check_player_privs(player:get_player_name(), {server = true}) then
   --codes
--end


minetest.register_tool("mm:tool", {
	description = "MM Multi-tool",
	inventory_image = "default_tool_woodsword.png",

	tool_capabilities = {
		full_punch_interval = 0.2,
		max_drop_level=4,
		groupcaps={
			cracky = {times={[1]=0.20,[2]=0.20,[3]=0.20,[4]=0.20}, uses=60010, maxlevel=4},
			choppy = {times={[1]=0.20,[2]=0.20,[3]=0.20,[4]=0.20}, uses=60010, maxlevel=4},
			crumbly = {times={[1]=0.20,[2]=0.20,[3]=0.20,[4]=0.20}, uses=60010, maxlevel=4},
			choppy = {times={[1]=0.20,[2]=0.20,[3]=0.20,[4]=0.20}, uses=60010, maxlevel=4},
		},
		damage_groups = {fleshy=20},
		liquids_pointable = true,
	},
	on_place = minetest.item_eat(50, 'mm:tool'),


})

--end
--end

--Extreme Survival created by maikerumine
-- Minetest 0.4.13 mod: "Extreme Survival"
-- namespace: es
--https://github.com/maikerumine

--License:
--~~~~~~~~
--Code:
--(c) Copyright 2015 maikerumine; modified zlib-License
--see "LICENSE.txt" for details.

--Media(if not stated differently):
--(c) Copyright (2014-2015) maikerumine; CC-BY-SA 3.0

es = {}



--Fixer's code--v
--Modified by maikerumine
-- Time to shut down server.
-- Default is twice a day: at 06:05 and 18:05
local H = 23
local X = 23
local Y = 23
local Z = 23

local M = 00
local N = 01

-- Day to shut down server.
-- Default is daily shutdown
-- 1=Sunday, ..., 7=Saturday, nil=Shutdown daily
local D = nil

local timer = 0
minetest.register_globalstep(function(dtime)
   timer = timer + dtime
   if timer < 1 then return end
   timer = 0
   local t = os.date("*t")
   if ((t.hour == H or t.hour == X or t.hour == Y or t.hour == Z) and (t.min == M) and (t.sec <= 2)
         and ((D == nil) or (t.wday == D))) then
      minetest.chat_send_all("Scheduled shutdown.  0600 1800  Eastern Time Zone"
            .."Shutting down in ONE minute.")
	          minetest.chat_send_all("Do not use chests or inventory at this time. "
            .."Shutting down in ONE minute.")
      --minetest.after(2, minetest.request_shutdown)
   end
      if ((t.hour == H or t.hour == X or t.hour == Y or t.hour == Z) and (t.min ==N) and (t.sec <= 2)
         and ((D == nil) or (t.wday == D))) then
      minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
	          minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
	          minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
	          minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
	          minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
      minetest.after(2, minetest.request_shutdown)
   end
end)

--[[
minetest.register_globalstep(function(dtime)
   timer = timer + dtime
   if timer < 1 then return end
   timer = 0
   local t = os.date("*t")
   if ((t.hour == H or t.hour == X or t.hour == Y or t.hour == Z) and (t.min ==N) and (t.sec <= 2)
         and ((D == nil) or (t.wday == D))) then
      minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
	          minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
	          minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
	          minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
	          minetest.chat_send_all("SHUTTING SERVER DOWN NOW!"
            .."  Please come back in a minute.")
      minetest.after(2, minetest.request_shutdown)
   end
end)
]]

--disable sneak on player join to make more interesting mining

--Sent: 31 Jan 2016, 10:53
--From: rnd
--To: maikerumine
--to make stuff happen when player joins ( in this case disable sneak) add somewhere
--in some init.lua ( doesnt really matter which one, for sake of order put in your mod in visible place)
-----------------------------------------
minetest.register_on_joinplayer(function(player)
player:set_physics_override({sneak=false})
end)



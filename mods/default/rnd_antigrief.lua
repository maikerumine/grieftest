-- ANTI GRIEF by rnd
-- Copyright 2016 rnd

----------------------------------------------------------------------------
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
----------------------------------------------------------------------------


-- prevents placing of lava/liquid sources or buckets above 0


--water
--bucket:bucket_water

function prevent_place_above(name)

	local old_on_place=minetest.registered_craftitems[name];--.on_place;
	local old_after_place_node = minetest.registered_nodes[name];--.after_place_node;
	--after_place_node = func(pos, placer, itemstack, pointed_thing)
	
	if old_on_place and old_on_place.on_place then
		old_on_place=old_on_place.on_place;
		minetest.registered_craftitems[name].on_place=function(itemstack, placer, pointed_thing)
			local pos = pointed_thing.above
			if pos.y< -2000 then
				minetest.log("action","ANTI GRIEF " .. placer:get_player_name() .. " tried to place " .. name .. " at " .. minetest.pos_to_string(pos));
				return itemstack
			else
				return old_on_place(itemstack, placer, pointed_thing)
			end
		end
	return;
	end

	if old_after_place_node then

		old_after_place_node=old_after_place_node.after_place_node
		
		local table = minetest.registered_nodes[name];
		local table2 = {}
		for i,v in pairs(table) do
			table2[i] = v
		end
		
		table2.after_place_node=function(pos, placer, itemstack, pointed_thing)
			--after_place_node = func(pos, placer, itemstack, pointed_thing)
			local pos = pointed_thing.above
			if pos.y< -2000 then
				minetest.log("action","ANTI GRIEF " .. placer:get_player_name() .. " tried to place " .. name .. " at " .. minetest.pos_to_string(pos));
				minetest.set_node(pos, {name = "air"});
				return itemstack
			end
		end
		
		
		minetest.register_node(":"..name, table2)
		return;
	end 
	
		
	return;
end
	

minetest.after(0,
function ()
prevent_place_above("bucket:bucket_water");
prevent_place_above("default:water_source");
prevent_place_above("bucket:bucket_lava");
prevent_place_above("default:lava_source");
end
)
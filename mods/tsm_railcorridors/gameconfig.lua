-- This file stores the various node types. This makes it easier to plug this mod into subgames
-- in which you need to change the node names.

-- Adapted for MineClone 2!

-- Node names (Don't use aliases!)
tsm_railcorridors.nodes = {
	dirt = "default:dirt",
	chest = "mcl_chests:chest",
	rail = "carts:rail",
	torch_floor = "default:torch",
	torch_wall = "default:torch_wall",

	--[[ Wood types for the corridors. Corridors are made out of full wood blocks
	and posts. For each corridor system, a random wood type is chosen with the chance
	specified in per mille. ]]
	corridor_woods = {
		{ wood = "default:wood", post = "default:fence_wood", chance = 900},
		{ wood = "default:junglewood", post = "default:fence_junglewood", chance = 100},
	},
}

-- Fallback function. Returns a random treasure. This function is called for chests
-- only if the Treasurer mod is not found.
-- pr: A PseudoRandom object
function tsm_railcorridors.get_default_treasure(pr)
	-- UNUSED IN MINECLONE 2!
end

-- MineClone 2's treasure function. Gets all treasures for a single chest.
-- Based on information from Minecraft Wiki.
function tsm_railcorridors.get_treasures(pr)
	local items = {}
	-- First roll
	local r1 = pr:next(1,71)
	if r1 <= 30 then
		table.insert(items, "mobs:nametag")
	elseif r1 <= 50 then
		table.insert(items, "golden_apple:golden_apple")
	elseif r1 <= 60 then
		-- TODO: Enchanted Book
		table.insert(items, "default:book")
	elseif r1 <= 65 then
		-- Nothing!
	elseif r1 <= 70 then
		table.insert(items, "default:pick_steel")
	else
		-- TODO: Enchanted Golden Apple
		table.insert(items, "golden_apple:golden_apple")
	end

	-- Second roll
	local r2stacks = pr:next(2,4)
	for i=1, r2stacks do
		local r2 = pr:next(1,83)
		if r2 <= 15 then
			table.insert(items, "farming:bread "..pr:next(1,3))
		elseif r2 <= 25 then
			table.insert(items, "default:coal_lump "..pr:next(3,8))
		elseif r2 <= 35 then
			table.insert(items, "farming:tomato "..pr:next(2,4))
		elseif r2 <= 45 then
			table.insert(items, "farming:melon_slice "..pr:next(2,4))
		elseif r2 <= 55 then
			table.insert(items, "farming:carrot "..pr:next(2,4))
		elseif r2 <= 65 then
			table.insert(items, "default:steel_ingot "..pr:next(1,5))
		elseif r2 <= 70 then
			table.insert(items, "dye:blue "..pr:next(4,9))
		elseif r2 <= 75 then
			table.insert(items, "default:mese_crystal_fragment "..pr:next(4,9))
		elseif r2 <= 80 then
			table.insert(items, "default:gold_ingot "..pr:next(1,3))
		else
			table.insert(items, "default:diamond "..pr:next(1,2))
		end
	end

	-- Third roll
	for i=1, 3 do
		local r3 = pr:next(1,50)
		if r3 <= 20 then
			table.insert(items, "carts:rail "..pr:next(4,8))
		elseif r3 <= 35 then
			table.insert(items, "default:torch "..pr:next(1,16))
		elseif r3 <= 40 then
			-- TODO: Activator Rail
			table.insert(items, "carts:rail "..pr:next(1,4))
		elseif r3 <= 45 then
			-- TODO: Detector Rail
			table.insert(items, "carts:rail "..pr:next(1,4))
		else
			table.insert(items, "carts:powerrail "..pr:next(1,4))
		end
	end

	return items
end

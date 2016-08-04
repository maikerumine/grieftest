
local path = minetest.get_modpath("nssm")

-- mobs
dofile(path .. "/ant_soldier.lua")
dofile(path .. "/ant_worker.lua")
dofile(path .. "/black_widow.lua")
dofile(path .. "/crocodile.lua")
dofile(path .. "/moonheron.lua")
dofile(path .. "/octopus.lua")
dofile(path .. "/sandworm.lua")
dofile(path .. "/tarantula.lua")
dofile(path .. "/uloboros.lua")
dofile(path .. "/werewolf.lua")
dofile(path .. "/white_werewolf.lua")
dofile(path .. "/mese_dragon.lua")
dofile(path .. "/nssm_api.lua")

-- items
dofile(path .. "/nssm_materials.lua")

-- where do mobs spawn
dofile(path .. "/spawn.lua")

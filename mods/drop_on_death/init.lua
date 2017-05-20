local function drop_inventory(player, name)
    local invref = player:get_inventory()
    local pos = player:getpos()
    local size = invref:get_size(name)
    for i = 1, size do
        local item = invref:get_stack(name, i)
        if item ~= nil then
            minetest.env:add_item({x = pos.x + math.random() * 4 - 1, y = pos.y+math.random() * 4, z = pos.z + math.random() * 4 - 1}, item)
            invref:set_stack(name, i, "")
        end
    end
end

minetest.register_on_dieplayer(function(player)
    drop_inventory(player, "main")
    drop_inventory(player, "craft")
end)

-- Minetest 0.4.12+ mod: chat2
-- chat2 is mod for minetest game created by Andrey. It's purpose is to improve or replace game built in chat.
--  + Higlight some messages in different colors - nearby talk, PM messages, messages with your name in it, shouts(!)
--  + Also can show all regular chat messages (use "/chat2 *" command)
--  + Switch on/off (use "/chat2" command)
--  + Old messages dissapear after some time
--  - Problems with unicode symbols on some clients

--  This mod is Free and Open Source Software, released under the LGPL 2.1 or later.
--  I used this mod:https://github.com/vegasd/minetest-mods/blob/master/kmchat/init.lua as example for how to use hud api.

chat2 = {}
chat2.speedlimit = {}
chat2.lastmessagetimes = {} --minetest.get_gametime()
chat2.users = {}
chat2.additionalfilters = {}    --additional words set by player, which need to be higligted
chat2.firsthud = {} --to be able to use previously set huds
chat2.messages_on_screen = 11
chat2.chat_width = 100  --symbols
chat2.position_x = 0.01
chat2.position_y = 0.92
chat2.line_distance = 15  --it depends on client, 15 is ok for where i have tested.

chat2.add_message = function(player, new_text, new_color)
    local temp_text
    local temp_color
    local hud
    local name = player:get_player_name()
    local firsthud = chat2.firsthud[name]
    if not player then
        minetest.log("action", "Player "..name.." - chat2 player error")
    end
    if (not chat2.firsthud[name]) or (not player:hud_get(chat2.firsthud[name]) )  then
        minetest.log("action", "Player "..name.." - chat2 no hud yet error")
        return
    end
    
    for id = firsthud, (firsthud + chat2.messages_on_screen - 1) do
        hud = player:hud_get(id)
        if hud and hud.name == "chat2" then
            temp_text = hud.text
            temp_color = hud.number
            player:hud_change(id, "number", new_color)
            player:hud_change(id, "text", new_text)
            new_text = temp_text
            new_color = temp_color
        end
    end
end

chat2.send_message = function(player, message, color)
    local line1 = nil   --allow message to span at most to three lines. more is not ok for public chat.
    local line2 = nil
    local line3 = nil
    local symbols = ''
    for i = 1, #message do
        if 
            string.byte(message, i) == 32 and    --is space symbol
            string.len(symbols) > (chat2.chat_width - 8) and    --space have priority for breaking lines
            (
                not line1 or
                not line2 or
                not line3
            )
        then
            if not line1 then
                line1 = symbols
                symbols = ''
            elseif not line2 then
                line2 = symbols
                symbols = ''
            elseif not line3 then
                line3 = symbols
                symbols = ''
            end
        elseif
            (string.byte(message, i) < 128 or string.byte(message, i) >= 192) and  --is ascii or first byte of unicode
            string.len(symbols) > (chat2.chat_width - 1) and
            (
                not line1 or
                not line2 or
                not line3
            )
        then
            if not line1 then
                line1 = symbols
                symbols = ''
            elseif not line2 then
                line2 = symbols
                symbols = ''
            elseif not line3 then
                line3 = symbols
                symbols = ''
            end
        elseif line1 and line2 and line3 then   --stop when all three lines filled
            break
        end
        symbols = symbols..message:sub(i,i)
    end
    
    if not line1 and symbols then   --when message is shorten than line
        line1 = symbols
    elseif not line2 and symbols then   --when message is shorten than line
        line2 = symbols
    elseif not line3 and symbols then   --when message is shorten than line
        line3 = symbols
    end
    
    if line1 then
        chat2.add_message(player, line1, color)
    end
    if line2 then
        chat2.add_message(player, line2, color)
    end
    if line3 then
        chat2.add_message(player, line3, color)
    end
    
    if message ~= '' then
        chat2.lastmessagetimes[player:get_player_name()] = minetest.get_gametime()
    end
end

minetest.register_on_joinplayer(function(player)
    minetest.after(2, function(player)
        local name = player:get_player_name()
        for i = 1, chat2.messages_on_screen do
            local hud_id = player:hud_add({
                hud_elem_type = "text",
                text = "",
                position = {x = chat2.position_x, y = chat2.position_y},
                name = "chat2",
                scale = {x=500, y=50},
                number = 0xCCCCCC,
                alignment = {x=1, y=0},
                offset = {x=0, y= -i * chat2.line_distance}
            })
            if not chat2.firsthud[name] then
                chat2.firsthud[name] = hud_id
            end
        end
        chat2.users[name] = 1
        chat2.send_message(player, 'chat2 activated! Use /chat2 command to switch it off/on. Use /chat2 * to see all chat here.', 0xDDAA55)
        chat2.lastmessagetimes[name] = minetest.get_gametime()
        end, player)
end)

minetest.register_on_leaveplayer(function(player)
    local name = player:get_player_name()
    chat2.lastmessagetimes[name] = nil
    chat2.users[name] = nil
    chat2.firsthud[name] = nil
end)

minetest.register_on_chat_message(function(name, message)
    
    local fmt = nil
    local color = nil
    local submes = nil
    local player = minetest.get_player_by_name(name)
    local players = minetest.get_connected_players()
    
    if chat2.speedlimit[name]==nil then
        chat2.speedlimit[name] = true
    else
        return
    end
    
    if chat_anticurse then
        local uncensored = chat_anticurse.check_message(name, message)
        if uncensored == 2 or uncensored > 2 then
            return true
        elseif uncensored == 1 then
            return
        end
    end

    submes = string.match(message, "^/(.+)")
    if submes then
        return
    end
    
    submes = string.match(message, "^!(.+)")
    if submes then
        fmt = "<%s> %s"
        color = 0xFF0000
        minetest.log("action", "chat2 !:"..string.format(fmt, name, submes))
    end

    local senderpos = player:getpos()
    for i = 1, #players do
        local fmt_p = fmt
        local color_p = color
        local submes_p = submes
        local name_p = players[i]:get_player_name()
        
        --if not submes_p and chat2.users[name_p] and string.find(message, name_p, 1, true) ~= nil then
        if not submes_p and chat2.users[name_p] and string.find( string.lower(message), string.lower(name_p), 1, true) ~= nil then
            fmt_p = "<%s> %s"
            color_p = 0x00FF00
            submes_p = message
        end
        
        if not submes_p and chat2.users[name_p] and chat2.additionalfilters[name_p] then
            local additionalfound = false
            for n = 1, #chat2.additionalfilters[name_p] do
                --if additionalfound or name == chat2.additionalfilters[name_p][n] or string.find(message, chat2.additionalfilters[name_p][n], 1, true) ~= nil then
                if additionalfound or name == chat2.additionalfilters[name_p][n] or string.find( string.lower(message), string.lower(chat2.additionalfilters[name_p][n]), 1, true) ~= nil then
                    additionalfound = true
                end
            end
            if additionalfound then
                fmt_p = "<%s> %s"
                color_p = 0x55FF55
                submes_p = message
            end
        end

        if not submes_p and chat2.users[name_p] and name_p ~= name then
            recieverpos = players[i]:getpos()
            if vector.distance(senderpos, recieverpos) < 12 then
                fmt_p = "<%s> %s"
                color_p = 0x88FFFF
                submes_p = message
            end
        end
        
        if not submes_p and chat2.users[name_p] == 2 then
            fmt_p = "<%s> %s"
            color_p = 0xFFFFFF
            submes_p = message
        end
        
        if submes_p and chat2.users[name_p] then
            chat2.send_message(players[i], string.format(fmt_p, name, submes_p), color_p)
        end
    end
    
    return
end)

if minetest.chatcommands["msg"] then
    local old_command = minetest.chatcommands["msg"].func
    minetest.chatcommands["msg"].func = function(name, param)
        local sendto, message = param:match("^(%S+)%s(.+)$")
        if sendto and message and chat2.users[sendto] then

            if chat_anticurse then
                local uncensored = chat_anticurse.check_message(name, message)
                if uncensored == 2 or uncensored > 2 then
                    return old_command(name, param)
                elseif uncensored == 1 then
                    return old_command(name, param)
                end
            end

            local player = minetest.get_player_by_name(sendto)
            local sender = minetest.get_player_by_name(name)
            if player and sender then
                chat2.send_message(player, string.format("<%s> %s", name, message), 0xFF00FF)
                chat2.send_message(sender, string.format("<%s> %s", name, message), 0xF000F0)
                minetest.log("action", "chat2 msg:"..string.format("<%s> %s", name, message))
            end

        end
        return old_command(name, param)
    end
end

minetest.register_chatcommand("chat2", {
    params = "",
	description = "Turn chat2 off/on or add words to monitor or use /chat2 * to see all chat here",
	privs = {shout = true},
	func = function(name, param)
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "chat2: Player not found"
        end

        if chat2.users[name] == nil and param and #param > 0 then
            minetest.chat_send_player(name, 'First, please turn chat2 on.')
            return
        end
        
        if param == "*" then
            if chat2.users[name] == 1 then
                chat2.users[name] = 2
                minetest.chat_send_player(name, 'chat2 - receiving all')
                minetest.log("action", "chat2: receiving all "..name)
            else
                chat2.users[name] = 1
                minetest.chat_send_player(name, 'chat2 - receiving only special messages')
                minetest.log("action", "chat2: receiving only special messages "..name)
            end
            return
        end
        
        --user add additional search strings
        if param and #param > 0 then
            local parameters = {}
            if chat2.additionalfilters[name] and #chat2.additionalfilters[name] > 0 and #chat2.additionalfilters[name] < 14 then
                parameters = chat2.additionalfilters[name]
            end
            for s in string.gmatch(param, "%g+") do
                parameters[#parameters+1] = s:sub(0, 20)
            end
            if #parameters > 0 and #parameters < 15 then
                chat2.additionalfilters[name] = parameters
                minetest.chat_send_player(name, 'chat2 parameters set')
            else
                chat2.additionalfilters[name] = nil
                minetest.chat_send_player(name, 'chat2 parameters removed(too mutch)')
            end
            return
        end
            
        if chat2.users[name] ~= nil then
            for i = 1, chat2.messages_on_screen do
                chat2.send_message(player, '', 0x000000)
            end
            chat2.lastmessagetimes[name] = nil
            chat2.users[name] = nil
        else
            minetest.chat_send_player(name, 'chat2 activated! Use /chat2 command if you want to switch it off.')
            chat2.send_message(player, 'chat2 activated!', 0xDDAA55)
            chat2.lastmessagetimes[name] = minetest.get_gametime()
            chat2.users[name] = 1
        end
	end,
})

-- every 3 seconds clean speedlimit
local timer = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime;
	if timer >= 3 then
        chat2.speedlimit = {}
		timer = 0
        
        --clean chat
        local players = minetest.get_connected_players()
        for i = 1, #players do
            local name = players[i]:get_player_name()
            if 
                chat2.lastmessagetimes[name] and 
                (minetest.get_gametime() - chat2.lastmessagetimes[name]) > 90 
            then 
                chat2.send_message(players[i], '', 0x000000)
                if (minetest.get_gametime() - chat2.lastmessagetimes[name]) > (90 + chat2.messages_on_screen * 3) then
                    chat2.lastmessagetimes[name] = nil
                end
            end
        end
	end
end)
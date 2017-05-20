local cart_entity = {
    hp_max = 80,
	physical = false, -- otherwise going uphill breaks
	collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
	visual = "mesh",
	mesh = "carts_cart.b3d",
	visual_size = {x=1, y=1},
	textures = {"carts_cart.png"},

	driver = nil,
	punched = false, -- used to re-send velocity and position
    punch_direction = true,
    control_left = nil,
    control_right = nil,

	attached_items = {},

    old_pos = nil,	--rounded
    next_pos = nil,	--rounded
    old_direction = nil,
    full_stop = false,  --when cart stopped and dont hawe any reason to move

    -- sound refresh interval = 1.0sec
    rail_sound = function(self, dtime)
    	if not self.sound_ttl then
    		self.sound_ttl = 1.0
    		return
    	elseif self.sound_ttl > 0 then
    		self.sound_ttl = self.sound_ttl - dtime
    		return
    	end
    	self.sound_ttl = 1.0
    	if self.sound_handle then
    		local handle = self.sound_handle
    		self.sound_handle = nil
    		minetest.after(0.2, minetest.sound_stop, handle)
    	end
    	local vel = self.object:getvelocity()
    	local speed = vector.length(vel)
    	if speed > 3 then
    		self.sound_handle = minetest.sound_play(
    			"carts_cart_moving", {
    			object = self.object,
    			gain = (speed / carts.speed_max) / 2,
    			loop = true,
    		})
    	end
    end,

    --set yaw using vector
    set_yaw = function(self, v)
        if v.x == 0 and v.z == 0 then
            return  --keep old jaw
        end

        local yaw = math.pi
        if v.z < 0 then
            yaw = math.pi - math.atan(v.x/v.z)
        elseif v.z > 0 then
            yaw = -math.atan(v.x/v.z)
        elseif v.x > 0 then
            yaw = -math.pi/2
        elseif v.x < 0 then
            yaw = math.pi/2
        end

        self.object:setyaw(yaw)
    end,

    --get yaw as a vector
    get_yaw = function(self)
        local yaw = self.object:getyaw()

        local v = {x=0, y=0, z=0}

        yaw = yaw + math.pi/2
        v.x = math.cos(yaw)
        v.z = math.sin(yaw)

        v = vector.normalize(v)
        return v
    end,

    --set velocity
    set_velocity = function(self, v)
        if not v then
            v = {x=0, y=0, z=0}
        end
        self.object:setvelocity(v)
    end,

    --align cart position on railroad
    precize_on_rail = function(self, pos, tolerance)
        local v = self.object:getvelocity()
        local aligned_pos = table.copy(pos)
    	if self.old_direction.x == 0 and math.abs(self.old_pos.x-pos.x)>tolerance then
            aligned_pos.x = self.old_pos.x
    		self.object:setpos(aligned_pos)
    	elseif self.old_direction.z == 0 and math.abs(self.old_pos.z-pos.z)>tolerance then
            aligned_pos.z = self.old_pos.z
    		self.object:setpos(aligned_pos)
    	elseif self.old_direction.y == 0 and math.abs(self.old_pos.y-pos.y)>tolerance then
            aligned_pos.y = self.old_pos.y
    		self.object:setpos(aligned_pos)
    	end
    end,

    -- rounded to 1 direction vector betvin start and end positions
    precize_direction = function(self, pos1, pos2)
        local dir = {x=0, y=0, z=0}
        if pos1.x == pos2.x then
            dir.z = math.sign(pos2.z - pos1.z)
        elseif pos1.z == pos2.z then
            dir.x = math.sign(pos2.x - pos1.x)
        elseif math.abs(pos2.x - pos1.x) < math.abs(pos2.z - pos1.z) then
            dir.z = math.sign(pos2.z - pos1.z)
        else
            dir.x = math.sign(pos2.x - pos1.x)
        end

        if math.abs(pos2.y - pos1.y) > 0 then
            dir.y = math.sign(pos2.y - pos1.y)
        end
        return dir
    end,

    --position, relative to
    --x-FRONT/BACK, z-LEFT/RIGHT
    get_pos_relative = function(self, rel_pos, position, direction)
        local pos = position
        if pos == nil then
            pos = self.object:getpos()
        end

        if not rel_pos then
            return pos
        elseif rel_pos.x == 0 and rel_pos.z == 0 then
            return {x=pos.x, y=pos.y+rel_pos.y, z=pos.z}
        end

        local dir = direction
        if dir == nil then
            local yaw = self.object:getyaw()

            dir = {x=0, y=0, z=0}

            yaw = yaw + math.pi/2
            dir.x = math.cos(yaw)
            dir.z = math.sin(yaw)

            dir = vector.normalize(dir)
        end

        if --NORD
            dir.x > 0 and
            dir.z <= math.abs(dir.x)
        then
            return {x=pos.x+rel_pos.x, y=pos.y+rel_pos.y, z=pos.z+rel_pos.z}
        elseif --EAST
            dir.z < 0 and
            dir.x <= math.abs(dir.z)
        then
            return {x=pos.x+rel_pos.z, y=pos.y+rel_pos.y, z=pos.z-rel_pos.x}
        elseif --WEST
            dir.z > 0 and
            dir.x <= math.abs(dir.z)
        then
            return {x=pos.x-rel_pos.z, y=pos.y+rel_pos.y, z=pos.z+rel_pos.x}
        elseif --SOUTH
            dir.x < 0 and
            dir.z <= math.abs(dir.x)
        then
            return {x=pos.x-rel_pos.x, y=pos.y+rel_pos.y, z=pos.z-rel_pos.z}
        end

        minetest.log("warning", "Object direction not set")
        return pos  --should not be reached
    end,

    --calculate next acceptable cart position
    get_next_rail_pos = function(self, pos, dir)
        local n_pos = nil
        if self.control_left then
            if minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=0, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=0, z=1}, pos, dir);    --left
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=-1, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=-1, z=1}, pos, dir);    --left down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=1, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=1, z=1}, pos, dir);    --left up
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=0, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=0, z=0}, pos, dir);     --front
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=1, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=1, z=0}, pos, dir);     --up
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=-1, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=-1, z=0}, pos, dir);    --down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=0, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=0, z=-1}, pos, dir);    --right
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=-1, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=-1, z=-1}, pos, dir);    --right down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=1, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=1, z=-1}, pos, dir);    --right up
            else
                n_pos = nil
            end
        elseif self.control_right then
            if minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=0, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=0, z=-1}, pos, dir);    --right
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=-1, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=-1, z=-1}, pos, dir);    --right down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=1, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=1, z=-1}, pos, dir);    --right up
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=0, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=0, z=0}, pos, dir);     --front
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=1, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=1, z=0}, pos, dir);     --up
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=-1, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=-1, z=0}, pos, dir);    --down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=0, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=0, z=1}, pos, dir);    --left
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=-1, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=-1, z=1}, pos, dir);    --left down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=1, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=1, z=1}, pos, dir);    --left up
            else
                n_pos = nil
            end
        else
            if minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=0, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=0, z=0}, pos, dir);     --front
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=1, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=1, z=0}, pos, dir);     --up
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=1, y=-1, z=0}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=1, y=-1, z=0}, pos, dir);    --down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=0, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=0, z=1}, pos, dir);    --left
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=0, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=0, z=-1}, pos, dir);    --right
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=-1, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=-1, z=1}, pos, dir);    --left down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=-1, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=-1, z=-1}, pos, dir);    --right down
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=1, z=1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=1, z=1}, pos, dir);    --left up
            elseif minetest.get_item_group(minetest.get_node(self:get_pos_relative({x=0, y=1, z=-1}, pos, dir)).name, "rail") > 0 then
                n_pos = self:get_pos_relative({x=0, y=1, z=-1}, pos, dir);    --right up
            else
                n_pos = nil
            end
        end
        if n_pos then
            n_pos = vector.round(n_pos)
        end
        return n_pos
    end,

    on_activate = function(self, staticdata, dtime_s)
        -- self.object:set_armor_groups({immortal=1})
        self.object:set_armor_groups({fleshy=40, snappy=60, choppy=80})

        --decrease speed after cart is left unattended
        self.object:setvelocity(vector.multiply(self.object:getvelocity(), 0.5))

        local pos = self.object:getpos()
        local d = self:get_yaw()

        self.old_pos = vector.round(pos)
        local dir = self:get_yaw()

        --strict direction
        dir.y = 0
        if math.abs(dir.x) > math.abs(dir.z) then
            dir.z = 0
        else
            dir.x = 0
        end
        self.old_direction = vector.round(dir)
    end,

    on_step = function(self, dtime)
        local pos = self.object:getpos()
        local p = vector.round(pos)
        local v = self.object:getvelocity()
        local s = vector.length(v)

        -- Get player controls
        if self.driver then
            player = minetest.get_player_by_name(self.driver)
            if player then
                ctrl = player:get_player_control()
                if ctrl and ctrl.up then
                    self.control_left = nil
                    self.control_right = nil
                elseif ctrl and ctrl.right then
                    self.control_left = nil
                    self.control_right = true
                elseif ctrl and ctrl.left then
                    self.control_left = true
                    self.control_right = nil
                end
                if ctrl and ctrl.down then
                    if (s - 1) >= 0 then
                        s = s - 1.5
                    end
                end
            end
        end


        if self.full_stop then
            -- when punch or mesecons
            if self.punched and self.punch_direction then
                self.full_stop = false
                --handle punch
                if (s + 1) <= carts.punch_speed_max then
                    s = s + 1
                    local dir = table.copy(self.punch_direction)
                    dir.y = 0
                    --strict direction
                    if math.abs(dir.x) > math.abs(dir.z) then
                        dir.z = 0
                    else
                        dir.x = 0
                    end
                    dir = vector.normalize(dir)
                    self.old_direction = vector.round(dir)
                    self.punched = nil

                    self.old_pos = table.copy(p)
                    self.next_pos = self:get_next_rail_pos(p, self.old_direction)

                    if self.next_pos then
                        --set new cart object parameters
                        v = vector.multiply(vector.normalize(self.old_direction), s)
                        self:set_velocity(v)
                        self:set_yaw(self.old_direction)
                    end
                else
                    self.punched = nil
                end
            end
        elseif s < 0.3 then
            -- when stop is temporary

            local node = minetest.get_node(p)

            -- uphill - invert old direction
            if self.old_direction.y == 1 then
                self.old_direction.x = -self.old_direction.x
                self.old_direction.z = -self.old_direction.z
                self.old_direction.y = -1
                s = s + 0.5 -- downhill
            end

            self.old_pos = table.copy(p)
            self.next_pos = self:get_next_rail_pos(p, self.old_direction)

            if self.next_pos then
                self.old_direction = self:precize_direction(self.old_pos, self.next_pos)
                --check rail and handle energy loss/increase
                if node.name == "carts:powerrail" then
                    s = s + 0.5
                elseif node.name == "carts:brakerail" then
                    s = s - 0.5
                else
                    s = s - 0.05 --rail or something else
                end

                -- cart will not move anymore
                if s < 0.3 then
                    s = 0
                    self.next_pos = nil
                    self.full_stop = true
                end
            else
                s = 0
                self.full_stop = true
            end

            --set new cart object parameters
            v = vector.multiply(vector.normalize(self.old_direction), s)
            self:set_velocity(v)
            self:set_yaw(self.old_direction)

        elseif self.next_pos == nil or
            math.abs(self.old_pos.x - pos.x) > 0.5 or
            math.abs(self.old_pos.z - pos.z) > 0.5
        then
            -- when cart reached next rail
            local node = minetest.get_node(p)
            self:precize_on_rail(pos, 0.2)

            --calculate where cart will go next
            if node.name == "ignore" then
                --map not loaded yet
                self.next_pos = nil
                s = s * 0.5
            elseif minetest.get_item_group(node.name, "rail") > 0 and
                (math.abs(self.old_pos.x - pos.x) > 1.5 or
                math.abs(self.old_pos.z - pos.z) > 1.5)
            then
                --cart went too far, accept new road
                self.old_pos = table.copy(p)
                self.next_pos = self:get_next_rail_pos(p, self.old_direction)
                s = s * 0.9
            elseif (math.abs(self.old_pos.x - pos.x) > 1.5 or
                math.abs(self.old_pos.z - pos.z) > 1.5)
            then
                --cart went too far, return to old road
                if self.next_pos then
                    local nextnext_pos = self:get_next_rail_pos(self.next_pos, self.old_direction)
                    if nextnext_pos == nil then
                        --dead end, stop cart
                        self.old_pos = table.copy(self.next_pos)
                        self.full_stop = true
                        self.next_pos = nil
                        self.object:setpos(self.old_pos)
                        s = 0
                    else
                        --continue from last rail
                        local dir = self:precize_direction(self.next_pos, nextnext_pos)
                        self.old_pos = table.copy(nextnext_pos)
                        self.object:setpos(nextnext_pos)
                        self.next_pos = self:get_next_rail_pos(nextnext_pos, dir)
                    end
                end
                s = s * 0.9
            elseif minetest.get_item_group(node.name, "rail") > 0 and self.next_pos and
                (math.abs(self.old_pos.x - pos.x) > 0.5 or
                math.abs(self.old_pos.z - pos.z) > 0.5)
            then
                --on next rail
                self.old_pos = table.copy(p)
                self.next_pos = self:get_next_rail_pos(p, self.old_direction)

                if self.next_pos == nil then
                    --dead end, stop cart
                    self.full_stop = true
                    self.next_pos = nil
                    self.object:setpos(self.old_pos)
                    s = 0
                end
            elseif minetest.get_item_group(node.name, "rail") > 0 and self.next_pos == nil then
                --on rail position
                self.old_pos = table.copy(p)
                self.next_pos = self:get_next_rail_pos(p, self.old_direction)

                if self.next_pos == nil then
                    --dead end, stop cart
                    self.full_stop = true
                    self.next_pos = nil
                    self.object:setpos(self.old_pos)
                    s = 0
                end
            end

            self.control_left = nil
            self.control_right = nil

            --calculate next cart direction
            if self.old_pos ~=nil and self.next_pos ~= nil then
                local dir = self:precize_direction(self.old_pos, self.next_pos)
                local direction_changes = false

                -- direction changes
                if dir.x ~= self.old_direction.x or dir.z ~= self.old_direction.z or dir.y ~= self.old_direction.y then
                    --do not flip!
                    if dir.x * self.old_direction.x ~= -1 and dir.z * self.old_direction.z ~= -1 then
                        direction_changes = true
                    end
                end

                -- new direction
                if direction_changes then
                    self.old_direction = table.copy(dir)
                end

                -- more energy loss on turns
                if direction_changes then
                    s = s - 0.4
                end
            end

            --handle downhill/uphill energy
            if self.next_pos ~= nil then
                if self.next_pos.y < self.old_pos.y then
                    s = s + 0.5 -- downhill
                elseif self.next_pos.y > self.old_pos.y then
                    s = s - 0.5 -- uphill
                end
            end

            --check rail and handle energy loss/increase
            if self.next_pos ~= nil then
                if node.name == "carts:powerrail" then
                    s = s + 0.5
                elseif node.name == "carts:brakerail" then
                    s = s - 0.5
                else
                    s = s - 0.05 --rail or something else
                end
                -- loss energy on skipped blocks
                s = s - 0.05 * vector.distance(self.next_pos, self.old_pos)
            end

            --mesecons support?
            -- --local acceleration = minetest.get_item_group(node.name, "acceleration")
            -- local acceleration = tonumber(minetest.get_meta(p):get_string("cart_acceleration"))--original PilzAdam version
            -- if acceleration > 0 or acceleration < 0 then
            --     s = s + acceleration     --powerrail
            -- end

            --handle punch
            if self.punched and self.punch_direction then
                if (s + 1) <= carts.punch_speed_max then
                    s = s + 1
                else
                    self.punched = nil
                end
            end

            --limit speed
            if s > carts.speed_max then
                s = carts.speed_max
            elseif s < 0 then
                s = 0
            end

            -- cart will not move anymore
            if s < 0.3 then
                s = 0
                self.next_pos = nil
                -- downhil/uphill and powerrail prevent stop
                if  self.old_direction.y == 0 and
                    node.name ~= "carts:powerrail"
                then
                    self.full_stop = true
                end
            end

            --set new cart object parameters
            v = vector.multiply(vector.normalize(self.old_direction), s)
            self:set_velocity(v)
            self:set_yaw(self.old_direction)
        end

        --animation for uphill/downhill
        if self.old_direction.y < 0 then
            self.object:set_animation({x=1, y=1}, 1, 0)
        elseif self.old_direction.y > 0  then
            self.object:set_animation({x=2, y=2}, 1, 0)
        else
            self.object:set_animation({x=0, y=0}, 1, 0)
        end

        --handle sound
        self:rail_sound(dtime)
    end,

    on_rightclick = function(self, clicker)
    	if not clicker or not clicker:is_player() then
    		return
    	end
    	local player_name = clicker:get_player_name()
    	if self.driver and player_name == self.driver then
    		self.driver = nil
    		carts:manage_attachment(clicker, nil)
    	elseif not self.driver then
    		self.driver = player_name
    		carts:manage_attachment(clicker, self.object)
    	end
    end,

    on_punch = function(self, puncher, time_from_last_punch, tool_capabilities, direction)
    	if not puncher or not puncher:is_player() then
            -- Punched by non-player
    		self.punched = true
            self.punch_direction = direction
        elseif puncher:get_player_control().sneak then
            -- Player digs cart by sneak-punch
            if self.driver == nil or puncher:get_player_name() == self.driver then
        		if self.sound_handle then
        			minetest.sound_stop(self.sound_handle)
        		end
        		-- Detach driver and items
        		if self.driver then
        			if self.old_pos then
        				self.object:setpos(self.old_pos)
        			end
        			local player = minetest.get_player_by_name(self.driver)
        			carts:manage_attachment(player, nil)
        		end
        		for _,obj_ in ipairs(self.attached_items) do
        			if obj_ then
        				obj_:set_detach()
        			end
        		end
        		-- Pick up cart
        		local inv = puncher:get_inventory()
        		if not (creative and creative.is_enabled_for
        				and creative.is_enabled_for(puncher:get_player_name()))
        				or not inv:contains_item("main", "carts:cart") then
        			local leftover = inv:add_item("main", "carts:cart")
        			-- If no room in inventory add a replacement cart to the world
        			if not leftover:is_empty() then
        				minetest.add_item(self.object:getpos(), leftover)
        			end
        		end
        		self.object:remove()
            end
        else
            -- simple tool wear
            if puncher and puncher:is_player() and puncher:get_wielded_item() then
                local tool=puncher:get_wielded_item()
                tool:add_wear(100)
                puncher:set_wielded_item(tool)
            end
            -- cart is not immortal anymore, so handle when it is destroyed
            minetest.after(0,
                function(self)
                    if self.object:get_hp() <= 0 then
                        -- to stop soun when cart unloads, is destroyed or is picked up
                        if self.sound_handle then
                            minetest.sound_stop(self.sound_handle)
                        end
                        -- Detach driver and items
                        if self.driver then
                            if self.old_pos then
                                self.object:setpos(self.old_pos)
                            end
                            local player = minetest.get_player_by_name(self.driver)
                            carts:manage_attachment(player, nil)
                        end
                        for _,obj_ in ipairs(self.attached_items) do
                            if obj_ then
                                obj_:set_detach()
                            end
                        end
                    end
                end,
            self)

            self.punched = true
            self.punch_direction = puncher:get_look_dir()
    	end
    end
}

minetest.register_entity("carts:cart", cart_entity)

minetest.register_craftitem("carts:cart", {
	description = "Cart (Sneak+Click to pick up)",
	inventory_image = minetest.inventorycube("carts_cart_top.png", "carts_cart_side.png", "carts_cart_side.png"),
	wield_image = "carts_cart_side.png",
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local udef = minetest.registered_nodes[node.name]
		if udef and udef.on_rightclick and
				not (placer and placer:get_player_control().sneak) then
			return udef.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		if not pointed_thing.type == "node" then
			return
		end
        if minetest.get_item_group(minetest.get_node(pointed_thing.under).name, "rail") > 0 then
			minetest.add_entity(pointed_thing.under, "carts:cart")
        elseif minetest.get_item_group(minetest.get_node(pointed_thing.above).name, "rail") > 0 then
			minetest.add_entity(pointed_thing.above, "carts:cart")
		else
			return
		end

		minetest.sound_play({name = "default_place_node_metal", gain = 0.5},
			{pos = pointed_thing.above})

		if not (creative and creative.is_enabled_for
				and creative.is_enabled_for(placer:get_player_name())) then
			itemstack:take_item()
		end
		return itemstack
	end,
})

minetest.register_craft({
	output = "carts:cart",
	recipe = {
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	},
})

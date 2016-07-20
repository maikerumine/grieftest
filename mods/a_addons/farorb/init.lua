--------------------------------------------------------------------------------
--	Farwalk Orb
--------------------------------------------------------------------------------
--	Throw the orb to teleport to it's landing position.
--
--	(c)2012 Fernando Zapata (ZLovesPancakes, Franz.ZPT)
--	Code licensed under GNU GPLv2
--		http://www.gnu.org/licenses/gpl-2.0.html
--	Content licensed under CC BY-SA 3.0
--		http://creativecommons.org/licenses/by-sa/3.0/
--------------------------------------------------------------------------------

------------------------------------------------------ Global Variables --------

local V = 22
local G = 9

------------------------------------------------------------ Definition --------

local throw_orb = function( itemstack, user, pointed )
	if itemstack:peek_item() ~= nil then
		local dir = user:get_look_dir()
		local pos = user:getpos()
		local obj = minetest.add_entity( {
			x = pos.x,
			y = pos.y + 1.5,
			z = pos.z
		}, 'farorb:farorb_ent' )
		obj:get_luaentity().launcher = user or nil
		obj:setvelocity( {
			x = dir.x * V,
			y = dir.y * V,
			z = dir.z * V
		})
		obj:setacceleration( {
			x = dir.x * -1,
			y = -G,
			z = dir.z * -1
		})
	end
	if not minetest.setting_getbool("creative_mode") then
		itemstack:take_item()
	end
	return itemstack
end

local farorb_ent = {
	physical = false,
	textures = { 'ender_pearl.png' },
	collisionbox = { 0, 0, 0, 0, 0, 0 },
	visual_size = {x=.5, y=.5},
	launcher = nil,
}

farorb_ent.on_step = function( self, dtime )

	if self.launcher == nil then self.object:remove(); return end

	local pos = self.object:getpos()
	local node = minetest.get_node(pos)

	if node.name ~= 'air' then
		pos = minetest.find_node_near( pos, 3, 'air' )
		if pos == nil then
			minetest.chat_send_player(
				self.launcher:get_player_name(),
				"Can't teleport, no air near location" )
		else
			--self.launcher:setpos( pos )
			self.launcher:moveto( pos )
			self.launcher:set_hp(self.launcher:get_hp()-5)
			minetest.sound_play("damage", {pos=pos})
		end
		self.object:remove()
	end

	--minetest.add_node( pos, { name="fire:basic_flame" } )

end

-------------------------------------------------------------- Register --------

minetest.register_entity( 'farorb:farorb_ent', farorb_ent )

minetest.register_craftitem( 'farorb:farorb', {
	description	= 'Ender Pearl',
	inventory_image	= 'ender_pearl.png',
	on_use		= throw_orb
})

minetest.register_craft({
	output		= 'farorb:farorb',
	recipe		= {
		{ 'default:mese_crystal', 'default:glass'}
	}
})

--------------------------------------------------------------------------------

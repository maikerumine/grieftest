minetest.register_tool("vines:shears", {
  description = "Shears",
  inventory_image = "vines_shears.png",
  wield_image = "vines_shears.png",
  stack_max = 1,
  max_drop_level=3,
tool_capabilities = {
    full_punch_interval = 1.0,
    max_drop_level=0,
    groupcaps={
      snappy={times={[1]=2.5, [2]=1.20, [3]=0.35}, uses=30, maxlevel=2},
      wool={times={[3]=2.5, [2]=1.20, [3]=0.35}, uses=12, maxlevel=2}
    }
  },
  
  
  
  
  
})

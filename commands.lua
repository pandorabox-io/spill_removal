
local c_lavastone = minetest.get_content_id("lavastone:lavastone")
local c_lava_flowing = minetest.get_content_id("default:lava_flowing")
local c_water_flowing = minetest.get_content_id("default:water_flowing")
local c_air = minetest.get_content_id("air")

minetest.register_chatcommand("lavastone_remove", {
  description = "removes lavastone in the current area",
  privs = { lavastone_remove = true },
  func = function(name, param)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    spill_removal.remove(pos, c_lavastone, c_air, 32)
  end
})

minetest.register_chatcommand("lava_remove", {
  description = "removes flowing lava in the current area",
  privs = { lava_remove = true },
  func = function(name, param)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    spill_removal.remove(pos, c_lava_flowing, c_air, 32)
  end
})

minetest.register_chatcommand("water_remove", {
  description = "removes flowing water in the current area",
  privs = { water_remove = true },
  func = function(name, param)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    spill_removal.remove(pos, c_water_flowing, c_air, 32)
  end
})

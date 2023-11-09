
minetest.register_chatcommand("lavastone_remove", {
  description = "removes lavastone in the current area",
  privs = { lavastone_remove = true },
  func = function(name)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    spill_removal.remove(pos, "lavastone:lavastone", nil, "air", 32)
    spill_removal.remove(pos, "default:stone", spill_removal.cooled_param2, "air", 32)
  end
})

minetest.register_chatcommand("lava_remove", {
  description = "removes flowing lava in the current area",
  privs = { lava_remove = true },
  func = function(name)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    spill_removal.remove(pos, "default:lava_flowing", nil, "air", 32)
  end
})

minetest.register_chatcommand("water_remove", {
  description = "removes flowing water in the current area",
  privs = { water_remove = true },
  func = function(name)
    local player = minetest.get_player_by_name(name)
    local pos = player:get_pos()
    spill_removal.remove(pos, "default:water_flowing", nil, "air", 32)
  end
})

if minetest.get_modpath("technic") then
  local c_chernobylite = minetest.get_content_id("technic:chernobylite_block")

  assert(c_chernobylite)

  minetest.register_chatcommand("chernobylite_remove", {
    description = "removes chernobylite in the current area",
    privs = { chernobylite_remove = true },
    func = function(name)
      local player = minetest.get_player_by_name(name)
      local pos = player:get_pos()
      spill_removal.remove(pos, "technic:chernobylite_block", nil, "air", 32)
    end
  })
end

local MP = minetest.get_modpath("spill_removal")

spill_removal = {
    -- method of lavacooling replacement
    lavacooling_method = minetest.settings:get("spill_removal.lavacooling_method"),
    -- param2 of the cooled default:stone
    cooled_param2 = 1
}

dofile(MP.."/api.lua")
dofile(MP.."/lavastone.lua")
dofile(MP.."/cooling.lua")
dofile(MP.."/commands.lua")
dofile(MP.."/privs.lua")

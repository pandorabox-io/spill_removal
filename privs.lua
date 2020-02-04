
minetest.register_privilege("lavastone_remove", {
	description = "Can remove lavastone in an area"
})

minetest.register_privilege("lava_remove", {
	description = "Can remove flowing lava in an area"
})

minetest.register_privilege("water_remove", {
	description = "Can remove flowing water in an area"
})

if minetest.get_modpath("technic") then

	minetest.register_privilege("chernobylite_remove", {
		description = "Can remove chernobylite in an area"
	})

end

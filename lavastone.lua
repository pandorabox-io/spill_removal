
-- taken from https://github.com/minetest/minetest_game/blob/master/mods/default/nodes.lua#L232

minetest.register_node(":lavastone:lavastone", {
	description = "Stone (Cooled lava)",
	tiles = {"default_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = 'default:cobble',
	sounds = default.node_sound_stone_defaults(),
})

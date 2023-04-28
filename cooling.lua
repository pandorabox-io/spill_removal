
-- taken from https://github.com/minetest/minetest_game/blob/master/mods/default/functions.lua
default.cool_lava = function(pos, node)
	if node.name == "default:lava_source" then
		minetest.set_node(pos, {name = "default:obsidian"})
	else
		-- Lava flowing
		if spill_removal.lavacooling_method == "node" then
			-- set a replacement node
			minetest.set_node(pos, {name = "lavastone:lavastone"})
		else
			-- set stone but with a param2 of `1`
			minetest.set_node(pos, {name = "default:stone", param2 = spill_removal.cooled_param2})
		end
	end
	minetest.sound_play("default_cool_lava", {pos = pos, max_hear_distance = 16, gain = 0.25})
end
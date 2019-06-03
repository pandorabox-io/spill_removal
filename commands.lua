
local c_lavastone = minetest.get_content_id("lavastone:lavastone")
local c_air = minetest.get_content_id("air")

local range = {x=32,y=32,z=32}

minetest.register_chatcommand("lavastone_remove", {
  description = "removes lavastone in the current area",
  privs = { lavastone_remove = true },
  func = function(name, param)
	local player = minetest.get_player_by_name(name)
	local pos = player:get_pos()
	
	local pos1 = vector.subtract(pos, range)
	local pos2 = vector.add(pos, range)

	local manip = minetest.get_voxel_manip()
	local e1, e2 = manip:read_from_map(pos1, pos2)
	local area = VoxelArea:new({MinEdge=e1, MaxEdge=e2})
	local data = manip:get_data()

	for z=pos1.z, pos2.z do
	for y=pos1.y, pos2.y do
	for x=pos1.x, pos2.x do

		local index = area:index(x, y, z)
		if data[index] == c_lavastone then
			data[index] = c_air
		end

	end
	end
	end

	manip:set_data(data)
	manip:write_to_map()
  end
})
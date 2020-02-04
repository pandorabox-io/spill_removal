
function spill_removal.remove(pos, source_id, target_id, radius)

  local range = {x=radius,y=radius,z=radius}

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
    if data[index] == source_id then
      data[index] = target_id
    end

  end
  end
  end

  manip:set_data(data)
  manip:write_to_map()
end

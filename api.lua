
function spill_removal.remove(pos, source_name, source_param2, target_name, radius)
  local source_id = minetest.get_content_id(source_name)
  local target_id = minetest.get_content_id(target_name)

  pos = vector.round(pos)

  local range = {x=radius,y=radius,z=radius}

  local pos1 = vector.subtract(pos, range)
  local pos2 = vector.add(pos, range)

  local manip = minetest.get_voxel_manip()
  local e1, e2 = manip:read_from_map(pos1, pos2)
  local area = VoxelArea:new({MinEdge=e1, MaxEdge=e2})
  local data = manip:get_data()
  local param2 = manip:get_param2_data()

  for z=pos1.z, pos2.z do
  for y=pos1.y, pos2.y do
  for x=pos1.x, pos2.x do

    local index = area:index(x, y, z)
    if data[index] == source_id and (source_param2 == nil or param2[index] == source_param2) then
      -- name and/or param2 matches
      data[index] = target_id
    end

  end
  end
  end

  manip:set_data(data)
  manip:write_to_map()
end

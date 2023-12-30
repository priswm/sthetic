local folder_pairs = {{destination = "/home/jsg/.sthetic/progs/awesome", source = "/home/jsg/.config/awesome"}, {destination = "/home/jsg/.shetic/progs/lite-xl", source = "/home/jsg/.config/lite-xl"}, {destination = "/home/jsg/.sthetic/progs/luakit", source = "/home/jsg/.config/luakit/"}}
local function create_static_link(source_path, destination_path)
  local file_attributes = lfs.attributes(source_path)
  if (file_attributes == nil) then
    print(("Source path does not exist: " .. source_path))
    return 
  else
  end
  local command = ("ln -s '" .. source_path .. "' '" .. destination_path .. "'")
  local result = os.execute(command)
  if (result == 0) then
    return print(("Static link created: " .. destination_path))
  else
    return print(("Failed to create static link: " .. destination_path))
  end
end
for _, pair in ipairs(folder_pairs) do
  create_static_link(pair.source, (pair.destination .. "/source"))
  create_static_link(pair.destination, (pair.source .. "/destination"))
end
return nil

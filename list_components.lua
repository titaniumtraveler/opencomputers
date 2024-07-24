local component = require "component"
local fs = component.filesystem

local handle = fs.open("components.txt", "w")

for address, type in component.list() do
  fs.write(handle, "component: " .. type .. " address: " .. address .. "\n")

  for method, _ in pairs(component.methods(address)) do
    fs.write(handle, method .. " " .. component.doc(address, method) .. "\n")
  end

  for name, value in pairs(component.fields(address)) do
    fs.write(handle, "field: " .. name .. " value: " .. value .. "\n")
  end

  fs.write(handle, "\n")
end

fs.close(handle)

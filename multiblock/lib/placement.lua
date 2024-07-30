local M = {}

local component = require "component"
local robot = component.robot
local sides = require "sides"
local Position = require "multiblock.lib.movement".Position

---@class Multiblock.Placement
---@field current   Multiblock.Position  current position of the robot
---@field center    Multiblock.Position  position of the bottom center of the multiblock
---@field exit      Multiblock.Position  position the robot ends up in when finishing the multiblock (this is relative to `center`)
---@field inventory Multiblock.Inventory inventory of the robot
M.Placement = {}
M.Placement.__index = M.Placement

---@param current   Multiblock.Position  current position of the robot
---@param center    Multiblock.Position  position of the bottom center of the multiblock
---@param exit      Multiblock.Position  position the robot ends up in when finishing the multiblock (this is relative to `center`)
---@param inventory Multiblock.Inventory inventory of the robot
---@return self
function M.Placement:new(current, center, exit, inventory)
  ---@type Multiblock.Placement
  local o = {
    current = current,
    center = center,
    exit = exit,
    inventory = inventory,
  }
  setmetatable(o, self)
  return o
end

---@param multiblock Multiblock.Recipe.Multiblock Multiblock to build
---@param anchor     Multiblock.Position          relative position to center the multiblock should be build
---@return boolean, string?
function M.Placement:place_blocks(multiblock, anchor)
  local res, msg
  anchor = self.center + anchor + Position:new(0, 1, 0)

  for y, layer in pairs(multiblock) do
    for z, row in pairs(layer) do
      for x, block in pairs(row) do
        if block then
          -- -1 because lua tables begin with 1 and we need a offset, which starts with 0
          res, msg = self.current:move_to(anchor + Position:new(x - 1, y - 1, z - 1))
          if not res then
            return false, msg
          end

          local slot = self.inventory:remove_item(block)
          if not slot then
            return false, "could not fetch required item `" .. block .. "` from inventory"
          end
          robot.select(slot)
          robot.place(sides.down, sides.down, true)
        end
      end
    end
  end

  res, msg = self.current:move_to(self.center + self.exit)
  if not res then
    return false, msg
  end

  return true
end

---@param  recipe Multiblock.Recipe
---@return boolean, string?
function M.Placement:place_recipe(recipe)
  return self:place_blocks(recipe.multiblock, recipe.anchor)
end

return M

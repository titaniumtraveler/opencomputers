local M = {}

local component = require "component"
local robot = component.robot

---@class Multiblock.Inventory
---@field inventory table<string, Multiblock.Inventory.Entry>
M.Inventory = {}
M.Inventory.__index = M.Inventory

---@class Multiblock.Inventory.Entry
---@field max_stack integer
---@field slots table<integer, integer>

---@return self
function M.Inventory:new()
  local o = { inventory = {} }
  setmetatable(o, self)
  return o
end

---@param stack Component.InventoryController.SlotStack
---@param slot integer
function M.Inventory:add_entry(stack, slot)
  local entry = self.inventory[stack.name]
  if entry then
    if entry.slots[slot] then
      entry.slots[slot] = entry.slots[slot] + stack.size
    else
      entry.slots[slot] = stack.size
    end
  else
    self.inventory[stack.name] = {
      max_stack = stack.maxSize,
      slots = { [slot] = stack.size },
    }
  end
end

---@param item string
---@param amount integer?
---@return integer?
function M.Inventory:remove_item(item, amount)
  local entry = self.inventory[item]
  if not entry then
    return nil
  end

  if not amount then
    amount = 1
  end

  for slot, slot_amount in pairs(entry.slots) do
    if amount < slot_amount then
      entry.slots[slot] = entry.slots[slot] - amount
      return slot
    elseif amount == slot_amount then
      entry.slots[slot] = nil
      if not next(entry.slots) then
        self.inventory[item] = nil
      end

      return slot
    end
  end

  return nil
end

---@param side number? omit to get the internal inventory
---@return self
function M.Inventory.scan(side)
  local inventory_controller = component.inventory_controller

  local inventory = M.Inventory:new()

  local getStackInSlot
  if side then
    ---@param slot number
    ---@return Component.InventoryController.SlotStack?
    getStackInSlot = function(slot)
      return inventory_controller.getStackInSlot(side, slot)
    end
  else
    ---@param slot number
    ---@return Component.InventoryController.SlotStack?
    getStackInSlot = function(slot)
      return inventory_controller.getStackInInternalSlot(slot)
    end
  end

  for slot = 1, robot.inventorySize() do
    local stack = getStackInSlot(slot)
    if stack then
      inventory:add_entry(stack, slot)
    end
  end

  return inventory
end

---@param item string
---@return integer
function M.Inventory:sum_amount(item)
  ---@type integer
  local sum = 0

  local entry = self.inventory[item]
  if entry then
    for _, amount in pairs(entry) do
      sum = sum + amount
    end
  end

  return sum
end

return M

local component = require "component"
local robot = component.robot
local ic = component.inventory_controller

local sides = require "sides"

local EventHandler = require "multiblock.lib.event"
local Inventory = require "multiblock.lib.inventory"
local Placement = require "multiblock.lib.placement"
local Recipe = require "multiblock.lib.recipe"

---@class Multiblock.Actions
---@field home             Multiblock.Position
---@field placement        Multiblock.Placement
---@field redstone_handler Multiblock.EventHandler
---@field output_slot      integer
---@field chosen_recipe?   [Multiblock.Recipe.loaded, integer] chosen recipe to craft + amount
---@field recipes          Multiblock.Recipe.loaded[]
local Actions = {}
Actions.__index = Actions

---@param center        Multiblock.Position
---@param drop          Multiblock.Position
---@return self
function Actions:new(center, drop)
  local home = Position:new(0, 0, 0)
  local placement = Placement:new(home, center, drop, Inventory:new())
  -- return true until condition is achieved
  local redstone_handler = EventHandler:new({
    redstone_changed = function(_, side, oldValue, newValue, _)
      return not (side == sides.back and newValue < oldValue)
    end,
  }, function()
    return true
  end)

  ---@type Multiblock.Actions
  local o = {
    home = home,
    placement = placement,
    redstone_handler = redstone_handler,
    output_slot = robot.inventorySize(),
    recipes = {},
  }
  setmetatable(o, self)
  return o
end

---@param recipe Multiblock.Recipe.loaded
---@return boolean, string?
function Actions:craft_multiblock(recipe)
  local res, msg
  res, msg = self.placement:place_recipe(recipe)
  if not res then
    return false, msg
  end

  local drop_slot = self.placement.inventory:remove_item(recipe.trigger_item)
  if not drop_slot then
    return false, "could not fetch required item `" .. recipe.trigger_item .. "` from inventory"
  end

  robot.select(drop_slot)
  robot.drop(sides.down, 1)

  res, msg = self:move_to_home()
  if not res then
    return false, msg
  end

  return true
end

function Actions:retrieve_output()
  local res, msg = self:move_from_home(self.placement.center + Position:new(0, 1, 0))
  if not res then
    return false, msg
  end
  robot.select(self.output_slot)
  robot.suck(sides.down)

  return true
end

function Actions:output_items()
  robot.select(self.output_slot)
  return robot.drop(sides.up)
end

---@return Multiblock.Recipe.loaded?
function Actions:choose_recipe()
  if self.chosen_recipe then
    local recipe = self.chosen_recipe[1]
    local amount = self.chosen_recipe[2]

    if amount <= 1 then
      self.chosen_recipe = nil
    else
      self.chosen_recipe[2] = amount - 1
    end

    return recipe
  end

  for _, recipe in pairs(self.recipes) do
    local amount = recipe:calculate_amount(self.placement.inventory)
    if 0 < amount then
      if 1 < amount then
        self.chosen_recipe = { recipe, amount - 1 }
      end

      return recipe
    end
  end

  return nil
end

---@return boolean
function Actions:retrieve_items()
  local last_slot = self.output_slot - 1
  local last = ic.getStackInInternalSlot(last_slot)

  if last then
    robot.select(last_slot)
    for i = 1, last_slot - 1 do
      if robot.transferTo(i) then
        last = ic.getStackInInternalSlot(last_slot)
        if not last then
          break
        end
      end
    end

    if last then
      self.placement.inventory = Inventory.scan()
      return false
    end
  end

  robot.select(1)
  robot.turn(true)
  while not last and robot.suck(sides.forward) do
    last = ic.getStackInInternalSlot(last_slot)
  end
  robot.turn(false)

  self.placement.inventory = Inventory.scan()

  return true
end

---@param names string[]
function Actions:set_recipes(names)
  local recipes = {}
  for _, name in pairs(names) do
    table.insert(self.recipes, { name, Recipe:load(name) })
  end
  self.recipes = recipes
end

---@param  position Multiblock.Position
---@return boolean, string?
function Actions:move_from_home(position)
  local res, msg
  res, msg = self.placement.current:move_rel(Position:new(-1, 0, 0))
  if not res then
    return false, msg
  end

  res, msg = self.placement.current:move_to(position)
  if not res then
    return false, msg
  end

  return true
end

---@return boolean, string?
function Actions:move_to_home()
  local res, msg
  res, msg = self.placement.current:move_to(self.home + Position:new(-1, 0, 0))
  if not res then
    return false, msg
  end

  res, msg = self.placement.current:move_rel(Position:new(1, 0, 0))
  if not res then
    return false, msg
  end

  return true
end

return Actions

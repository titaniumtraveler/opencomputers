local component = require "component"
local robot = component.robot

local sides = require "sides"

local Inventory = require "multiblock.lib.inventory"
local Position = require "multiblock.lib.position"
local Placement = require "multiblock.lib.placement"
local Recipe = require "multiblock.lib.recipe"

local enderpearl = Recipe:load("multiblock.recipes.ender_pearl")

local res, msg

local current = Position:new(0, 0, 0)
local center = Position:new(-4, -1, -1)
local drop = Position:new(0, 4, 0)

local inventory = Inventory.scan()
local placement = Placement:new(current, center, drop, inventory)

res, msg = placement:place_recipe(enderpearl)
if not res then
  print(msg)
  return
end

local drop_slot = inventory:remove_item(enderpearl.trigger_item)
if not drop_slot then
  print("could not fetch required item `" .. enderpearl.trigger_item .. "` from inventory")
  return
end

robot.select(drop_slot)
robot.drop(sides.down, 1)

res, msg = placement.current:move_to(Position:new(0, 0, 0))
if not res then
  print(msg)
  return
end

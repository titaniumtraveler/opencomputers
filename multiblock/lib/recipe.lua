---@module "multiblock.types.recipe"
---@module "multiblock.lib.inventory"

local Position = require "multiblock.lib.position"

---@class Multiblock.Recipe.loaded: Multiblock.Recipe
---@field path   string
---@field anchor Multiblock.Position
---@field cost   Multiblock.Recipe.cost
local Recipe = {}
Recipe.__index = Recipe

---@alias Multiblock.Recipe.cost table<string, integer>

---@param path string
---@return self
function Recipe:load(path)
  ---@type Multiblock.Recipe.loaded
  local recipe = require(path)

  if not getmetatable(recipe) then
    recipe.path = path
    recipe.anchor = Position:new(table.unpack(recipe.anchor))
    setmetatable(recipe, self)
    -- TODO: add some validation logic in here
    recipe.cost = recipe:calculate_cost()
  end

  return recipe
end

---@return Multiblock.Recipe.cost
function Recipe:calculate_cost()
  local cost = {}

  cost[self.trigger_item] = 1

  for _, layer in pairs(self.multiblock) do
    for _, row in pairs(layer) do
      for _, item in pairs(row) do
        if item then
          if cost[item] then
            cost[item] = cost[item] + 1
          else
            cost[item] = 1
          end
        end
      end
    end
  end

  return cost
end

---@param inv Multiblock.Inventory
---@return integer
function Recipe:calculate_amount(inv)
  local craft_amount = math.huge
  for item, item_amount in pairs(self.cost) do
    craft_amount = math.min(craft_amount, inv:sum_amount(item) // item_amount)
  end
  return craft_amount
end

return Recipe

local event = require "event"

local Actions = require "multiblock.lib.actions"
local Position = require "multiblock.lib.position"

local actions = Actions:new(Position:new(-4, -1, -2), Position:new(0, 4, 0))

actions:set_recipes({
  "multiblock.recipes.ender_pearl",
  "multiblock.recipes.compact_normal",
  "multiblock.recipes.compact_wall",
  "multiblock.recipes.compact_giant_sm",
})

---@return boolean, string?
local function run()
  local res, msg
  local finished = true
  ---@type number?
  local event_handle = nil
  local redstone_changed = function(...)
    local f = actions:redstone_changed(...)
    finished = finished or f
  end

  while true do
    res, msg = actions:output_items()
    if not res then
      return false, msg
    end

    local recipe = actions:choose_recipe()
    if not recipe then
      local items = actions:retrieve_items()
      if not items then
        return false, "failed to find storage for new items"
      end

      recipe = actions:choose_recipe()
    end

    if event_handle then
      event.cancel(event_handle)
      while not finished do
        redstone_changed(event.pull("redstone_changed"))
      end

      res, msg = actions:retrieve_output()
      if not res then
        return false, msg
      end
    end

    if recipe then
      res, msg = actions:craft_multiblock(recipe)
      if not res then
        return false, msg
      end

      local handle = event.listen("redstone_changed", redstone_changed)
      finished = false
      if not handle then
        return false, "failed to register listener"
      end
      event_handle = handle
    else
      res, msg = actions:output_items()
      if not res then
        return false, msg
      end
      -- TODO: poll for incoming items instead
      return true
    end
  end
end

local res, msg = run()
if not res then
  print(msg)
end

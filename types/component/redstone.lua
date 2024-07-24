---@meta
---@module "component.base"

---@class Component.Redstone: Component.Base
local redstone = {}

--- Get the redstone input (all sides, or optionally on the specified side)
---@param side number?
---@return number | number[]
function redstone.getInput(side) end

---  Set the redstone output (all sides, or optionally on the specified side). Returns previous values
---@param side number?
---@param value number | number[]
---@return number | number[]
function redstone.setOutput(side, value) end

--- Get the current wake-up threshold.
---@return number
function redstone.getWakeThreshold() end

--- Get the redstone output (all sides, or optionally on the specified side)
---@param side number?
---@return number | table
function redstone.getOutput(side) end

--- Get the comparator input on the specified side.
---@param side number
---@return number
function redstone.getComparatorInput(side) end

--- Set the wake-up threshold.
---@param threshold number
---@return number
function redstone.setWakeThreshold(threshold) end

return redstone

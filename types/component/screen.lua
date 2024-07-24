---@meta
---@module "component.base"

---@class Component.Gpu: Component.Base
local screen = {}

--- Returns whether the screen is currently on.
---@return boolean
function screen.isOn() end

--- Returns whether the screen is in high precision mode (sub-pixel mouse event positions).
---@return boolean
function screen.isPrecise() end

--- Turns off the screen. Returns true if it was on.
---@return boolean
function screen.turnOff() end

--- The aspect ratio of the screen. For multi-block screens this is the number of blocks, horizontal and vertical.
---@retur number, number
function screen.getAspectRatio() end

--- Turns the screen on. Returns true if it was off.
---@return boolean
function screen.turnOn() end

--- The list of keyboards attached to the screen.
---@return table
function screen.getKeyboards() end

--- Set whether to use high precision mode (sub-pixel mouse event positions).
---@param enabled boolean
---@return boolean
function screen.setPrecise(enabled) end

return screen

---@meta
---@module "component.base"

---@class Component.Computer: Component.Base
local computer = {}

--- Starts the computer. Returns true if the state changed.
---@return boolean
function computer.start() end

--- Returns whether the computer is running.
---@return boolean
function computer.isRunning() end

--- Plays a tone, useful to alert users via audible feedback.
---@param frequency (string | number)?
---@param duration number?
function computer.beep(frequency, duration) end

--- Returns a map of program name to disk label for known programs.
---@return table<string, string>
function computer.getProgramLocations() end

--- Collect information on all connected devices.
---@return table<string, any>
function computer.getDeviceInfo() end

--- Stops the computer. Returns true if the state changed.
---@return boolean
function computer.stop() end

return computer

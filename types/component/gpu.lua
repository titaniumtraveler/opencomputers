---@meta
---@module "component.base"

---@class Component.Gpu: Component.Base
local gpu = {}

--- Fills a portion of the screen at the specified position with the specified size with the specified character.
---@param x number
---@param y number
---@param width number
---@param height number
---@param char string
---@return boolean
function gpu.fill(x, y, width, height, char) end

--- Sets the background color to the specified value. Optionally takes an explicit palette index.
--- Returns the old value and if it was from the palette its palette index.
---@param value number
---@param palette boolean?
---@return number, number?
function gpu.setBackground(value, palette) end

--- Get the current background color and whether it's from the palette or not.
---@return number, boolean
function gpu.getBackground() end

--- Copies a portion of the screen from the specified location with the specified size by the specified translation.
---@param x number
---@param y number
---@param width number
---@param height number
---@param tx number
---@param ty number
---@return boolean
function gpu.copy(x, y, width, height, tx, ty) end

--- Get the value displayed on the screen at the specified index, as well as the foreground and background color.
--- If the foreground or background is from the palette, returns the palette indices as fourth and fifth results, else nil, respectively.
---@param x number
---@param y number
---@return string, number, number, number?, number?
function gpu.get(x, y) end

--- Get the maximum supported color depth.
---@return number
function gpu.maxDepth() end

--- Get the current viewport resolution.
---@return number, number
function gpu.getViewport() end

--- Set the viewport resolution. Cannot exceed the screen resolution. Returns true if the resolution changed.
---@param width number
---@param height number
---@return boolean
function gpu.setViewport(width, height) end

--- Get the palette color at the specified palette index.
---@param index number
---@return number
function gpu.getPaletteColor(index) end

--- Binds the GPU to the screen with the specified address and resets screen settings if `reset` is true.
---@param address string
---@param reset boolean=true
---@return boolean
function gpu.bind(address, reset) end

--- Get the maximum screen resolution.
---@return number, number
function gpu.maxResolution() end

--- Set the screen resolution. Returns true if the resolution changed.
---@param width number
---@param height number
---@return boolean
function gpu.setResolution(width, height) end

--- Set the palette color at the specified palette index. Returns the previous value.
---@param index number
---@param color number
---@return number
function gpu.setPaletteColor(index, color) end

--- Get the address of the screen the GPU is currently bound to.
---@return string
function gpu.getScreen() end

--- Plots a string value to the screen at the specified position. Optionally writes the string vertically.
---@param x number
---@param y number
---@param value string
---@param vertical boolean?
---@return boolean
function gpu.set(x, y, value, vertical) end

--- Get the current screen resolution.
---@return number, number
function gpu.getResolution() end

--- Set the color depth. Returns the previous value.
---@param depth number
---@return number
function gpu.setDepth(depth) end

--- Returns the currently set color depth.
---@return number
function gpu.getDepth() end

--- Get the current foreground color and whether it's from the palette or not.
---@return number, boolean
function gpu.getForeground() end

--- Sets the foreground color to the specified value. Optionally takes an explicit palette index. Returns the old value and if it was from the palette its palette index.
---@param value number
---@param palette boolean?
---@return number, number?
function gpu.setForeground(value, palette) end

return gpu

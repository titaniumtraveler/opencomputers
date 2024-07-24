---@meta
---@module "component.base"

---@class Component.Eeprom: Component.Base
local eeprom = {}

--- Get the currently stored byte array.
---@return string
function eeprom.getData() end

--- Set the label of the EEPROM.
---@param data string
---@return string
function eeprom.setLabel(data) end

--- Get the label of the EEPROM.
---@return string
function eeprom.getLabel() end

--- Get the storage capacity of this EEPROM.
---@return number
function eeprom.getSize() end

--- Overwrite the currently stored byte array.
---@param data string
function eeprom.set(data) end

--- Get the checksum of the data on this EEPROM.
---@return string
function eeprom.getChecksum() end

--- Make this EEPROM readonly if it isn't already. This process cannot be reversed!
---@param checksum string
---@return boolean
function eeprom.makeReadonly(checksum) end

--- Get the currently stored byte array.
---@return string
function eeprom.get() end

--- Overwrite the currently stored byte array.
---@param data string
function eeprom.setData(data) end

--- Get the storage capacity of this EEPROM.
---@return number
function eeprom.getDataSize() end

return eeprom

---@meta
---@module "component.base"

---@class Component.Modem: Component.Base
local modem = {}

--- Opens the specified port. Returns true if the port was opened.
---@param port number
---@return boolean
function modem.open(port) end

--- Broadcasts the specified data on the specified port.
---@param port number
---@param ... any
function modem.broadcast(port, ...) end

--- Get the signal strength (range) used when sending messages.
---@return number
function modem.getStrength() end

--- Set the signal strength (range) used when sending messages.
---@param strength number
---@return number
function modem.setStrength(strength) end

--- Closes the specified port (default: all ports). Returns true if ports were closed.
---@param port number?
---@return boolean
function modem.close(port) end

--- Sends the specified data to the specified target.
---@param address string
---@param port number
---@param ... any
function modem.send(address, port, ...) end

--- Get the current wake-up message.
---@return string, boolean
function modem.getWakeMessage() end

--- Whether this card has wireless networking capability.
---@return boolean
function modem.isWireless() end

--- Whether the specified port is open.
---@param port number
---@return boolean
function modem.isOpen(port) end

--- Set the wake-up message and whether to ignore additional data/parameters.
---@param message string
---@param fuzzy boolean?
---@return string
function modem.setWakeMessage(message, fuzzy) end

--- Whether this card has wired networking capability.
---@return boolean
function modem.isWired() end

return modem

---@meta

---@class Component
local component = {
  computer = require "component.computer",
  crafting = require "component.crafting",
  eeprom = require "component.eeprom",
  filesystem = require "component.filesystem",
  gpu = require "component.gpu",
  inventory_controller = require "component.inventory_controller",
  keyboard = require "component.keyboard",
  modem = require "component.modem",
  redstone = require "component.redstone",
  robot = require "component.robot",
  screen = require "component.screen",
}

--- Returns the documentation string for the method with the specified name of the component with the specified address, if any.
--- Note that you can also get this string by using `tostring` on a method in a proxy, for example `tostring(component.screen.isOn)`.
---@param address string
---@param method string
---@return string
function component.doc(address, method) end

--- Calls the method with the specified name on the component with the specified address, passing the remaining arguments as arguments to that method.
--- Returns the result of the method call, i.e. the values returned by the method. Depending on the called method's implementation this may throw.
---@param address string
---@param method string[]
---@return any
function component.invoke(address, method) end

--- Returns a table with all components currently attached to the computer, with address as a key and component type as a value.
--- It also provides iterator syntax via `__call`, so you can use it like so: `for address, componentType in component.list() do ... end`
--- If `filter` is set this will only return components that contain the filter string (this is *not* a pattern/regular expression). For example, `component.list("red")` will return `redstone` components.
--- If `true` is passed as a second parameter, exact matching is enforced, e.g. `red` will *not* match `redstone`.
---@param filter string?
---@param exact boolean?
---@return table<string, string>
function component.list(filter, exact) end

--- Returns a table with the names of all methods provided by the component with the specified address.
--- The names are the keys in the table, the values indicate whether the method is called directly or not.
---@param address string
---@return table<string, boolean>
function component.methods(address) end

--- Gets a 'proxy' object for a component that provides all methods the component provides as fields, so they can be called more directly (instead of via `invoke`).
--- This is what's used to generate 'primaries' of the individual component types, i.e. what you get via `component.blah`.
--- For example, you can use it like so: `component.proxy(component.list("redstone")()).getInput(sides.north)`,
--- which gets you a proxy for the first `redstone` component returned by the `component.list` iterator, and then calls `getInput` on it.
--- Note that proxies will always have at least two fields, `type` with the component's type name, and `address` with the component's address.
---@param address string
---@return table
function component.proxy(address) end

--- Get the component type of the component with the specified address.
---@param address string
---@return string
function component.type(address) end

--- Return slot number which the component is installed into. Returns -1 if it doesn't otherwise make sense.
---@param address string
---@return string
function component.slot(address) end

--- Undocumented
---@param address string
---@return table
function component.fields(address) end

--- Tries to resolve an abbreviated address to a full address. Returns the full address on success, or `nil` and an error message otherwise. Optionally filters by component type.
---@param address string
---@param componentType string?
---@return string | [nil, string]
function component.get(address, componentType) end

--- Checks if there is a primary component of the specified component type.
---@param componentType string
---@return boolean
function component.isAvailable(componentType) end

--- Gets the proxy for the primary component of the specified type. Throws an error if there is no primary component of the specified type.
---@param componentType string
---@return table`
function component.getPrimary(componentType) end

--- Sets a new primary component for the specified component type. The address may be abbreviated, but must be valid if it is not `nil`.
--- Triggers the `component_unavailable` and `component_available` signals if set to `nil` or a new value, respectively.
---@param componentType string
---@param address string
function component.setPrimary(componentType, address) end

return component

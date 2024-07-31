local event = require "event"

---@class Multiblock.EventHandler
---@field handler Signal.handler
local EventHandler = {}
EventHandler.__index = EventHandler

---@param handler Signal.handler
---@param default? fun(name: string, ...): ...
---@return self
function EventHandler:new(handler, default)
  ---@type Multiblock.EventHandler
  setmetatable(handler, {
    __index = function(_, name)
      return function(...)
        return (default or function() end)(name, ...)
      end
    end,
  })
  local o = {
    handler = handler,
  }

  setmetatable(o, self)

  return o
end

---@param event_name string
---@param ... any event_args
function EventHandler:handle(event_name, ...)
  return self.handler[event_name](...)
end

function EventHandler:pull(...)
  return self:handle(event.pull(...))
end

return EventHandler

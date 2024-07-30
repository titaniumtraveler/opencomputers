local component = require "component"
local sides = require "sides"

--- Position in coordinate system.
--- Note that this is not necessarily bound to the global coordinate system, but
--- is relative to some anchor and the current direction of the robot.
---
--- A positive X direction is in front of the robot, a negative means behind.
--- A positive Y direction is above the robot and a negative below it.
--- A positive Z direction is right of the robot, a negative means left of it.
---@class Multiblock.Position
---@field x number front/back
---@field y number above/below
---@field z number right/left
Position = {}
Position.__index = Position

---@param x number
---@param y number
---@param z number
---@return Multiblock.Position
function Position:new(x, y, z)
  local o = { x = x, y = y, z = z }
  setmetatable(o, self)
  return o
end

---@param o Multiblock.Position
---@return Multiblock.Position
function Position:__add(o)
  return Position:new(self.x + o.x, self.y + o.y, self.z + o.z)
end

---@param o Multiblock.Position
---@return Multiblock.Position
function Position:__sub(o)
  return Position:new(self.x - o.x, self.y - o.y, self.z - o.z)
end

--- Walk `steps` either in `pos`-direction or `neg` direction depending on the sign of `steps`.
--- If an error occurs this function exits early with the steps walked and error message.
--- The caller is responsible to update the position.
---@param steps number
---@param pos number
---@param neg number
---@return boolean, number, string?
function Position:move_along_axis(steps, pos, neg)
  local walked = 0

  if 0 < steps then
    while walked < steps do
      local res, msg = component.robot.move(pos)
      if not res then
        return false, walked, msg
      end

      walked = walked + 1
    end
  elseif steps < 0 then
    while steps < walked do
      local res, msg = component.robot.move(neg)
      if not res then
        return false, walked, msg
      end

      walked = walked - 1
    end
  end

  return true, walked
end

--- Move `rel` relative to the current position
---@param rel Multiblock.Position
---@return boolean, string?
function Position:move_rel(rel)
  local res, walked, msg

  if 0 < rel.y then
    res, walked, msg = self:move_along_axis(rel.y, sides.up, sides.down)
    self.y = self.y + walked
    if not res then
      return false, msg
    end
  end

  res, walked, msg = self:move_along_axis(rel.x, sides.forward, sides.back)
  self.x = self.x + walked
  if not res then
    return false, msg
  end

  if rel.z ~= 0 then
    -- For *some* reason the robot can't move sideways so we turn and then turn back.
    component.robot.turn(true)
    res, walked, msg = self:move_along_axis(rel.z, sides.forward, sides.back)
    component.robot.turn(false)
    self.z = self.z + walked
    if not res then
      return false, msg
    end
  end

  if rel.y < 0 then
    res, walked, msg = self:move_along_axis(rel.y, sides.up, sides.down)
    self.y = self.y + walked
    if not res then
      return false, msg
    end
  end

  return true
end

--- Move from the current position to `to`
---@param to Multiblock.Position
---@return boolean, string?
function Position:move_to(to)
  return self:move_rel(to - self)
end

return Position

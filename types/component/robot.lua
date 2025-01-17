---@meta
---@module "component.base"

---@class Component.Robot: Component.Base
local robot = {}

--- Checks the contents of the block on the specified sides and returns the findings.
---@param side number
---@return boolean, string
function robot.detect(side) end

--- Get the number of items in the specified slot, otherwise in the selected slot.
---@param slot number
---@return number
function robot.count(slot) end

--- Drops items from the selected slot towards the specified side.
---@param side number
---@param count? number 64
---@return boolean
function robot.drop(side, count) end

--- Move up to the specified amount of items from the selected slot into the specified slot.
--- If no amount is specified, the entire stack is moved to the target slot.
---@param toSlot number
---@param amount number?
---@return boolean
function robot.transferTo(toSlot, amount) end

--- Get the remaining space in the specified slot, otherwise in the selected slot.
---@param slot number?
---@return number
function robot.space(slot) end

--- The size of this device's internal inventory.
---@return number
function robot.inventorySize() end

--- Place a block towards the specified side. The `face' allows a more precise click calibration, and is relative to the targeted blockspace.
---@param side number
---@param face number=side
---@param sneaky boolean=false
---@return boolean
function robot.place(side, face, sneaky) end

--- Compare the fluid in the selected tank with the fluid in the specified tank on the specified side. Returns true if equal.
---@param side number
---@param tank number?
---@return boolean
function robot.compareFluid(side, tank) end

--- Get the durability of the currently equipped tool.
---@return number
function robot.durability() end

--- Rotate in the specified direction.
---@param clockwise boolean
---@return boolean
function robot.turn(clockwise) end

--- Set the color of the activity light to the specified integer encoded RGB value (0xRRGGBB).
---@param value number
---@return number
function robot.setLightColor(value) end

--- Get the name of the agent.
---@return string
function robot.name() end

--- Get the remaining fluid capacity in the specified or selected tank.
---@param index number?
---@return number
function robot.tankSpace(index) end

--- Compare the block on the specified side with the one in the selected slot. Returns true if equal.
---@param side number
---@param fuzzy boolean=false
---@return boolean
function robot.compare(side, fuzzy) end

--- Eject the specified amount of fluid to the specified side. Returns the amount ejected or an error message.
---@param side number
---@param amount number=1000
---@return boolean, number | string
function robot.fill(side, amount) end

--- Perform a 'right click' towards the specified side.
--- The `face' allows a more precise click calibration, and is relative to the targeted blockspace.
---@param side number
---@param face number=side
---@param sneaky boolean=false
---@param duration number=0
---@return boolean, string
function robot.use(side, face, sneaky, duration) end

--- The number of tanks installed in the device.
---@return number
function robot.tankCount() end

--- Suck up items from the specified side.
---@param side number
---@param count? number defaults to 64
---@return number | false
function robot.suck(side, count) end

--- Compares the fluids in the selected and the specified tank. Returns true if equal.
---@param index number
---@return boolean
function robot.compareFluidTo(index) end

--- Get the currently selected slot; set the selected slot if specified.
---@param slot number?
---@return number
function robot.select(slot) end

--- Get the current color of the activity light as an integer encoded RGB value (0xRRGGBB).
---@return number
function robot.getLightColor() end

--- Select a tank and/or get the number of the currently selected tank.
---@param index number?
---@return number
function robot.selectTank(index) end

--- Move the specified amount of fluid from the selected tank into the specified tank.
---@param index number
---@param count number=1000
---@return boolean
function robot.transferFluidTo(index, count) end

--- Perform a 'left click' towards the specified side.
--- The `face' allows a more precise click calibration, and is relative to the targeted blockspace.
---@param side number
---@param face number=side
---@param sneaky boolean=false
---@return boolean, string
function robot.swing(side, face, sneaky) end

--- Get the fluid amount in the specified or selected tank.
---@param index number?
---@return number
function robot.tankLevel(index) end

--- Compare the contents of the selected slot to the contents of the specified slot.
---@param otherSlot number
---@param checkNBT boolean=false
---@return boolean
function robot.compareTo(otherSlot, checkNBT) end

--- Drains the specified amount of fluid from the specified side. Returns the amount drained, or an error message.
---@param side boolean
---@param amount number=1000
---@return boolean, number | string
function robot.drain(side, amount) end

--- Move in the specified direction.
---@param direction number
---@return boolean | [boolean?, string]
function robot.move(direction) end

return robot

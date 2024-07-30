---@meta
---@module "component.base"

---@class Component.InventoryController: Component.Base
local inventory_controller = {}

---@class Component.InventoryController.SlotStack
---@field damage    number the current damage value of the item.
---@field maxDamage number the maximum damage this item can have before it breaks.
---@field size      number the current stack size of the item.
---@field maxSize   number the maximum stack size of this item.
---@field id        number the Minecraft id of the item. Note that this field is only included if insertIdsInConverters=true in the configs, and can vary between servers!
---@field name      string the untranslated item name, which is an internal Minecraft value like oc:item.FloppyDisk
---@field label     string the translated item name
---@field hasTag    boolean whether or not the item has an NBT tag associated with it.

--- Store an item stack description in the specified slot of the database with the specified address.
---@param side number
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@return boolean
function inventory_controller.store(side, slot, dbAddress, dbSlot) end

--- Get whether the stack in the selected slot is equivalent to the item in the specified slot (have shared OreDictionary IDs).
---@param otherSlot number
---@return boolean
function inventory_controller.isEquivalentTo(otherSlot) end

--- Get the number of slots in the inventory on the specified side of the device.
---@param side number
---@return number
function inventory_controller.getInventorySize(side) end

--- Get a description of the stack in the inventory on the specified side of the device.
---@param side number
---@param slot number
---@return Component.InventoryController.SlotStack?
function inventory_controller.getStackInSlot(side, slot) end

--- Get the maximum number of items in the specified slot of the inventory on the specified side of the device.
---@param side number
---@param slot number
---@return number
function inventory_controller.getSlotMaxStackSize(side, slot) end

--- Get a description of the stack in the specified slot or the selected slot.
---@param slot number?
---@return Component.InventoryController.SlotStack?
function inventory_controller.getStackInInternalSlot(slot) end

--- Swaps the equipped tool with the content of the currently selected inventory slot.
---@return boolean
function inventory_controller.equip() end

--- Get a description of all stacks in the inventory on the specified side of the device.
---@param side number
---@return userdata
function inventory_controller.getAllStacks(side) end

--- Compare an item in the specified slot in the inventory on the specified side with one in the database with the specified address.
---@param side number
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@param checkNBT boolean=false
---@return boolean
function inventory_controller.compareStackToDatabase(side, slot, dbAddress, dbSlot, checkNBT) end

--- Drops the selected item stack into the specified slot of an inventory.
---@param facing number
---@param slot number
---@param count number?
---@param fromSide number?
---@return boolean
function inventory_controller.dropIntoSlot(facing, slot, count, fromSide) end

--- Get number of items in the specified slot of the inventory on the specified side of the device.
---@param side number
---@param slot number
---@return number
function inventory_controller.getSlotStackSize(side, slot) end

--- Get the the name of the inventory on the specified side of the device.
---@param side number
---@return string
function inventory_controller.getInventoryName(side) end

--- Get whether the items in the two specified slots of the inventory on the specified side of the device are of the same type.
---@param side number
---@param slotA number
---@param slotB number
---@param checkNBT boolean=false
---@return boolean
function inventory_controller.compareStacks(side, slotA, slotB, checkNBT) end

--- Drops an item from the selected slot into the specified slot in the item inventory.
---@param inventorySlot number
---@param slot number
---@param count number=64
---@return number
function inventory_controller.dropIntoItemInventory(inventorySlot, slot, count) end

--- Sucks an item out of the specified slot in the item inventory.
---@param inventorySlot number
---@param slot number
---@param count number=64
---@return number
function inventory_controller.suckFromItemInventory(inventorySlot, slot, count) end

--- Store an item stack description in the specified slot of the database with the specified address.
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@return boolean
function inventory_controller.storeInternal(slot, dbAddress, dbSlot) end

--- The size of an item inventory in the specified slot.
---@param slot number
---@return number
function inventory_controller.getItemInventorySize(slot) end

--- Compare an item in the specified slot with one in the database with the specified address.
---@param slot number
---@param dbAddress string
---@param dbSlot number
---@param checkNBT boolean=false
---@return boolean
function inventory_controller.compareToDatabase(slot, dbAddress, dbSlot, checkNBT) end

--- Sucks items from the specified slot of an inventory.
---@param facing number
---@param slot number
---@param count number?
---@param fromSide number?
---@return boolean
function inventory_controller.suckFromSlot(facing, slot, count, fromSide) end

--- Get whether the items in the two specified slots of the inventory on the specified side of the device are equivalent (have shared OreDictionary IDs).
---@param side number
---@param slotA number
---@param slotB number
---@return boolean
function inventory_controller.areStacksEquivalent(side, slotA, slotB) end

return inventory_controller

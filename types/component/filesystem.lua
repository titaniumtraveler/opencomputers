---@meta
---@module "component.base"

---@class Component.Gpu: Component.Base
local filesystem = {}

--- Returns whether the file system is read-only.
---@return boolean
function filesystem.isReadOnly() end

--- Renames/moves an object from the first specified absolute path in the file system to the second.
---@param from string
---@param to string
---@return boolean
function filesystem.rename(from, to) end

--- Get the current label of the drive.
---@return string
function filesystem.getLabel() end

--- Removes the object at the specified absolute path in the file system.
---@param path string
---@return boolean
function filesystem.remove(path) end

--- The overall capacity of the file system, in bytes.
---@return number
function filesystem.spaceTotal() end

--- Returns a list of names of objects in the directory at the specified absolute path in the file system.
---@param path string
---@return table
function filesystem.list(path) end

--- Opens a new file descriptor and returns its handle.
---@param path string
---@param mode string='r'
---@return userdata
function filesystem.open(path, mode) end

--- Sets the label of the drive. Returns the new value, which may be truncated.
---@param value string
---@return string
function filesystem.setLabel(value) end

--- Returns whether the object at the specified absolute path in the file system is a directory.
---@param path string
---@return boolean
function filesystem.isDirectory(path) end

--- Returns whether an object exists at the specified absolute path in the file system.
---@param path string
---@return boolean
function filesystem.exists(path) end

--- Returns the size of the object at the specified absolute path in the file system.
---@param path string
---@return number
function filesystem.size(path) end

--- Closes an open file descriptor with the specified handle.
---@param handle userdata
function filesystem.close(handle) end

--- Reads up to the specified amount of data from an open file descriptor with the specified handle. Returns nil when EOF is reached.
---@param handle userdata
---@param count number
---@return string or nil
function filesystem.read(handle, count) end

--- Writes the specified data to an open file descriptor with the specified handle.
---@param handle userdata
---@param value string
---@return boolean
function filesystem.write(handle, value) end

--- Creates a directory at the specified absolute path in the file system. Creates parent directories, if necessary.
---@param path string
---@return boolean
function filesystem.makeDirectory(path) end

--- Seeks in an open file descriptor with the specified handle. Returns the new pointer position.
---@param handle userdata
---@param whence string
---@param offset number
---@return number
function filesystem.seek(handle, whence, offset) end

--- The currently used capacity of the file system, in bytes.
---@return number
function filesystem.spaceUsed() end

--- Returns the (real world) timestamp of when the object at the specified absolute path in the file system was modified.
---@param path string
---@return number
function filesystem.lastModified(path) end

return filesystem

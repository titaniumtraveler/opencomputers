---@module "multiblock.types.recipe"
---@type Multiblock.Recipe
return {
  anchor = { -1, 0, -1 },
  trigger_item = "minecraft:ender_pearl",
  multiblock = {
    {
      { "compactmachines3:wallbreakable", "compactmachines3:wallbreakable", "compactmachines3:wallbreakable" },
      { "compactmachines3:wallbreakable", "contenttweaker:glitched3", "compactmachines3:wallbreakable" },
      { "compactmachines3:wallbreakable", "compactmachines3:wallbreakable", "compactmachines3:wallbreakable" },
    },
    {
      { "compactmachines3:wallbreakable", "contenttweaker:glitched3", "compactmachines3:wallbreakable" },
      { "contenttweaker:glitched3", "modularmachinery:blockcasing", "contenttweaker:glitched3" },
      { "compactmachines3:wallbreakable", "contenttweaker:glitched3", "compactmachines3:wallbreakable" },
    },
    {
      { "compactmachines3:wallbreakable", "compactmachines3:wallbreakable", "compactmachines3:wallbreakable" },
      { "compactmachines3:wallbreakable", "contenttweaker:glitched3", "compactmachines3:wallbreakable" },
      { "compactmachines3:wallbreakable", "compactmachines3:wallbreakable", "compactmachines3:wallbreakable" },
    },
  },
}

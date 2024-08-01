---@module "multiblock.types.recipe"
---@type Multiblock.Recipe
return {
  anchor = { 0, 0, 0 },
  trigger_item = "minecraft:redstone",
  multiblock = {
    {
      { "minecraft:iron_block" },
    },
    {
      { "minecraft:redstone" },
    },
  },
}

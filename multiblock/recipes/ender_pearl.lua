---@module "multiblock.types.recipe"
---@type Multiblock.Recipe
return {
  anchor = { -1, 0, -1 },
  trigger_item = "minecraft:redstone",
  multiblock = {
    {
      { "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian" },
      { "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian" },
      { "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian" },
    },
    {
      { "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian" },
      { "minecraft:obsidian", "minecraft:redstone_block", "minecraft:obsidian" },
      { "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian" },
    },
    {
      { "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian" },
      { "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian" },
      { "minecraft:obsidian", "minecraft:obsidian", "minecraft:obsidian" },
    },
  },
}

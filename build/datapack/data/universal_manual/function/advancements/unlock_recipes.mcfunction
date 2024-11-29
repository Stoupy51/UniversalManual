
#> universal_manual:advancements/unlock_recipes
#
# @within	advancement universal_manual:unlock_recipes
#

# Revoke advancement
advancement revoke @s only universal_manual:unlock_recipes

## For each ingredient in inventory, unlock the recipes
# minecraft:book
scoreboard players set #success universal_manual.data 0
execute store success score #success universal_manual.data if items entity @s container.* minecraft:book
execute if score #success universal_manual.data matches 1 run recipe give @s universal_manual:universal_manual

# minecraft:lapis_block
scoreboard players set #success universal_manual.data 0
execute store success score #success universal_manual.data if items entity @s container.* minecraft:lapis_block
execute if score #success universal_manual.data matches 1 run recipe give @s universal_manual:universal_manual

# minecraft:gold_block
scoreboard players set #success universal_manual.data 0
execute store success score #success universal_manual.data if items entity @s container.* minecraft:gold_block
execute if score #success universal_manual.data matches 1 run recipe give @s universal_manual:universal_manual



#> universal_manual:calls/smithed_crafter/shapeless_recipes
#
# @within	#smithed.crafter:event/shapeless_recipes
#

execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 3 if data storage smithed.crafter:input {"recipe": [{"id": "minecraft:book", "count": 2}, {"id": "minecraft:lapis_block", "count": 1}, {"id": "minecraft:gold_block", "count": 1}]} run loot replace block ~ ~ ~ container.16 loot universal_manual:i/universal_manual
execute if score @s smithed.data matches 0 store result score @s smithed.data if score count smithed.data matches 1 if data storage smithed.crafter:input {"recipe": [{"count": 1, "components": {"minecraft:custom_data": {"universal_manual": {"manual": true}}}}]} run loot replace block ~ ~ ~ container.16 loot universal_manual:i/universal_manual



#> universal_manual:v1.0.0/load/confirm_load
#
# @within	universal_manual:v1.0.0/load/valid_dependencies
#

# Confirm load
tellraw @a[tag=convention.debug] {"translate":"universal_manual.loaded_universal_manual_v1_0_0","color":"green"}
scoreboard players set #universal_manual.loaded load.status 1

# Items storage
data modify storage universal_manual:items all set value {}
data modify storage universal_manual:items all.universal_manual set value {"id": "minecraft:written_book","count": 1,"components": {"item_name": "[{\"translate\":\"universal_manual.universal\", \"color\": \"blue\", \"italic\": false}, {\"translate\":\"universal_manual.manual\", \"color\": \"yellow\"}]","max_stack_size": 1,"item_model": "universal_manual:universal_manual","custom_data": {"universal_manual": {"universal_manual": true},"smithed": {"ignore": {"functionality": true,"crafting": true}}}}}


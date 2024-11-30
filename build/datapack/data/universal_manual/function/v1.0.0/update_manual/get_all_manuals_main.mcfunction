
#> universal_manual:v1.0.0/update_manual/get_all_manuals_main
#
# @within	universal_manual:v1.0.0/update_manual/write_manual
#

# Loop through the registered manuals in "python_datapack:main universal_manual"
data modify storage universal_manual:main extracted_pages set value []
data modify storage universal_manual:main new_entries set value []
data modify storage universal_manual:main copy set from storage python_datapack:main universal_manual
scoreboard players set #index universal_manual.data 0
execute if data storage universal_manual:main copy[0] run data modify storage universal_manual:main raw set value {"loot_table":""}
execute if data storage universal_manual:main copy[0] run data modify storage universal_manual:main raw.loot_table set from storage universal_manual:main copy[0].loot_table
execute if data storage universal_manual:main copy[0] run function universal_manual:v1.0.0/update_manual/get_all_manuals_loop with storage universal_manual:main raw


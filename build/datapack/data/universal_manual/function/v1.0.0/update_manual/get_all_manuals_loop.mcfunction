
#> universal_manual:v1.0.0/update_manual/get_all_manuals_loop
#
# @within	universal_manual:v1.0.0/update_manual/get_all_manuals_main with storage universal_manual:main raw
#			universal_manual:v1.0.0/update_manual/get_all_manuals_loop with storage universal_manual:main raw
#

# Get the pages from the loot table
$loot replace block -30000000 14 1610 container.0 loot $(loot_table)
data modify storage universal_manual:main loot_table_first_page set from block -30000000 14 1610 Items[0].components."minecraft:written_book_content".pages[0]

# Insert in the new array
data modify storage universal_manual:main new_entry set from storage universal_manual:main copy[0]
data modify storage universal_manual:main new_entry.first_page set from storage universal_manual:main loot_table_first_page
data modify storage universal_manual:main new_entries append from storage universal_manual:main new_entry

# If the index matches the score, extract the manual
execute if score #index universal_manual.data = @s universal_manual.action run data modify storage universal_manual:main extracted_pages set from block -30000000 14 1610 Items[0].components."minecraft:written_book_content".pages
execute if score #index universal_manual.data = @s universal_manual.action run data modify storage universal_manual:main input.components."minecraft:written_book_content".author set from storage universal_manual:main copy[0].name
execute if score #index universal_manual.data = @s universal_manual.action run tellraw @s ["",{"translate":"universal_manual","color":"blue"},{"translate":"universal_manual.loaded_pages_from","color":"gray"},{"storage":"universal_manual:main","nbt":"copy[0].name"}]
execute if score #index universal_manual.data = @s universal_manual.action at @s run playsound entity.experience_orb.pickup ambient @s

# Increase the index and loop again if remaining
scoreboard players add #index universal_manual.data 1
data remove storage universal_manual:main copy[0]
execute if data storage universal_manual:main copy[0] run data modify storage universal_manual:main raw.loot_table set from storage universal_manual:main copy[0].loot_table
execute if data storage universal_manual:main copy[0] run function universal_manual:v1.0.0/update_manual/get_all_manuals_loop with storage universal_manual:main raw


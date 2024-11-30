
#> universal_manual:v1.0.0/update_manual/write_manual
#
# @within	universal_manual:v1.0.0/update_manual/main
#

# Prepare the input
setblock -30000000 14 1610 yellow_shulker_box
data modify storage universal_manual:main input set value {"Slot":0b,"count":1,"id":"minecraft:written_book","components":{"minecraft:item_name": "[{\"translate\":\"universal_manual.universal\", \"color\": \"blue\", \"italic\": false}, {\"text\":\" \"}, {\"translate\":\"universal_manual.manual\", \"color\": \"yellow\"}]", "minecraft:max_stack_size": 1, "minecraft:custom_data": {"universal_manual": {"universal_manual": true, "is_setup": false}, "smithed": {"ignore": {"functionality": true, "crafting": true}}}, "minecraft:item_model": "universal_manual:universal_manual"}}
data modify storage universal_manual:main input.components."minecraft:custom_data".universal_manual.is_setup set value true
data modify storage universal_manual:main input.components."minecraft:written_book_content" set value {"pages":[], "author":"", "title":""}
data modify storage universal_manual:main pages set value []

# Get all manuals data
function universal_manual:v1.0.0/update_manual/get_all_manuals_main

# Get the first page
function universal_manual:v1.0.0/update_manual/first_page

# Extract the selected manual by handling the input and add the pages to the manual
execute if score @s universal_manual.action matches 0.. run function universal_manual:v1.0.0/update_manual/add_selected_manual

# Add the manual to the shulker box
data modify storage universal_manual:main input.components."minecraft:written_book_content".pages set from storage universal_manual:main pages
data modify storage universal_manual:main Items set value []
data modify storage universal_manual:main Items append from storage universal_manual:main input
data modify block -30000000 14 1610 Items set from storage universal_manual:main Items

# Clean up storage
data remove storage universal_manual:main pages
data remove storage universal_manual:main first_page_string
data remove storage universal_manual:main loot_table_first_page
data remove storage universal_manual:main extracted_pages
data remove storage universal_manual:main text_component
data remove storage universal_manual:main hover_string
data remove storage universal_manual:main index_input
data remove storage universal_manual:main first_page
data remove storage universal_manual:main new_entries
data remove storage universal_manual:main new_entry
data remove storage universal_manual:main new_page
data remove storage universal_manual:main hover
data remove storage universal_manual:main Items
data remove storage universal_manual:main input
data remove storage universal_manual:main temp
data remove storage universal_manual:main copy
data remove storage universal_manual:main raw
data remove storage universal_manual:main f



# Imports
from python_datapack.utils.database_helper import *

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
    SHULKER_BOX: str = "-30000000 14 1610"
    namespace: str = config["namespace"]
    version: str = config["version"]
    database: dict = config["database"]
    PATH: str = f"{namespace}:v{version}/update_manual"

    # Setup load file and tick function
    write_to_load_file(config, f"""
# Additional load
scoreboard objectives add {namespace}.action trigger
function {namespace}:v{version}/load/delayed
""")
    write_to_tick_file(config, f"""
execute as @a[scores={{{namespace}.action=1..}}] run function {PATH}/main
""")
    
    # Delayed load
    write_to_versioned_file(config, "load/delayed", f"""
execute in minecraft:overworld run forceload add {SHULKER_BOX.replace("14 ", "")}
execute in minecraft:overworld run setblock {SHULKER_BOX} yellow_shulker_box
execute unless loaded {SHULKER_BOX} run schedule function {namespace}:v{version}/load/delayed 2s replace
""")

    # Override unlock recipes advancement
    write_to_function(config, f"{namespace}:advancements/unlock_recipes", f"""
advancement revoke @s only {namespace}:unlock_recipes
recipe give @s {namespace}:universal_manual

execute if items entity @s container.* written_book[custom_data~{{"{namespace}":{{"universal_manual":true,"is_setup":false}}}}] run function {PATH}/main
""", overwrite=True)

    # Add update manual function
    write_to_versioned_file(config, "update_manual/main", f"""
# Decrease trigger score
scoreboard players remove @s {namespace}.action 1

# Write the new manual
function {PATH}/write_manual

# Apply the new manual
data modify storage {namespace}:main Inventory set from entity @s Inventory
execute if data storage {namespace}:main Inventory[0] run function {PATH}/apply_inventory

# Reset and enable the action trigger
scoreboard players reset @s {namespace}.action
scoreboard players enable @s {namespace}.action
""")

    # Apply inventory
    write_to_versioned_file(config, "update_manual/apply_inventory", f"""
# Copy the item slot
scoreboard players set #slot {namespace}.data -1
execute if data storage {namespace}:main Inventory[0].components."minecraft:custom_data"."{namespace}".universal_manual store result score #slot {namespace}.data run data get storage {namespace}:main Inventory[0].Slot

# Apply the item slot
""")
    for i in range(4 * 9): # 4 rows, 9 columns
        write_to_versioned_file(config, f"update_manual/apply_inventory", f"execute if score #slot {namespace}.data matches {i} run item replace entity @s container.{i} from block {SHULKER_BOX} container.0\n")
    write_to_versioned_file(config, f"update_manual/apply_inventory", f"""
execute if score #slot {namespace}.data matches 103 run item replace entity @s armor.head from block {SHULKER_BOX} container.0
execute if score #slot {namespace}.data matches 102 run item replace entity @s armor.chest from block {SHULKER_BOX} container.0
execute if score #slot {namespace}.data matches 101 run item replace entity @s armor.legs from block {SHULKER_BOX} container.0
execute if score #slot {namespace}.data matches 100 run item replace entity @s armor.feet from block {SHULKER_BOX} container.0
execute if score #slot {namespace}.data matches -106 run item replace entity @s weapon.offhand from block {SHULKER_BOX} container.0

# Continue loop if there is more to apply (recursive)
data remove storage {namespace}:main Inventory[0]
execute if data storage {namespace}:main Inventory[0] run function {PATH}/apply_inventory
""")

    # Write the manual
    manual: dict = database["universal_manual"]
    components: str = json.dumps({f"minecraft:{x}": y for x, y in manual.items() if x not in NOT_COMPONENTS})
    write_to_versioned_file(config, "update_manual/write_manual", f"""
# Prepare the input
setblock {SHULKER_BOX} yellow_shulker_box
data modify storage {namespace}:main input set value {{"Slot":0b,"count":1,"id":"minecraft:written_book","components":{components}}}
data modify storage {namespace}:main input.components."minecraft:custom_data".{namespace}.is_setup set value true
data modify storage {namespace}:main input.components."minecraft:written_book_content" set value {{"pages":[], "author":"", "title":""}}
data modify storage {namespace}:main pages set value []

# Get all manuals data
function {PATH}/get_all_manuals_main

# Get the first page
function {PATH}/first_page

# Extract the selected manual by handling the input and add the pages to the manual
execute if score @s {namespace}.action matches 0.. run function {PATH}/add_selected_manual

# Add the manual to the shulker box
data modify storage {namespace}:main input.components."minecraft:written_book_content".pages set from storage {namespace}:main pages
data modify storage {namespace}:main Items set value []
data modify storage {namespace}:main Items append from storage {namespace}:main input
data modify block {SHULKER_BOX} Items set from storage {namespace}:main Items

# Clean up storage
data remove storage {namespace}:main pages
data remove storage {namespace}:main first_page_string
data remove storage {namespace}:main loot_table_first_page
data remove storage {namespace}:main extracted_pages
data remove storage {namespace}:main text_component
data remove storage {namespace}:main hover_string
data remove storage {namespace}:main index_input
data remove storage {namespace}:main first_page
data remove storage {namespace}:main new_entries
data remove storage {namespace}:main new_entry
data remove storage {namespace}:main new_page
data remove storage {namespace}:main hover
data remove storage {namespace}:main Items
data remove storage {namespace}:main input
data remove storage {namespace}:main temp
data remove storage {namespace}:main copy
data remove storage {namespace}:main raw
data remove storage {namespace}:main f
""")

    # Get all manuals data from loot table
    write_to_versioned_file(config, "update_manual/get_all_manuals_main", f"""
# Loop through the registered manuals in "python_datapack:main universal_manual"
data modify storage {namespace}:main extracted_pages set value []
data modify storage {namespace}:main new_entries set value []
data modify storage {namespace}:main copy set from storage python_datapack:main universal_manual
scoreboard players set #index {namespace}.data 0
execute if data storage {namespace}:main copy[0] run data modify storage {namespace}:main raw set value {{"loot_table":""}}
execute if data storage {namespace}:main copy[0] run data modify storage {namespace}:main raw.loot_table set from storage {namespace}:main copy[0].loot_table
execute if data storage {namespace}:main copy[0] run function {PATH}/get_all_manuals_loop with storage {namespace}:main raw
""")
    write_to_versioned_file(config, "update_manual/get_all_manuals_loop",
f"""
# Get the pages from the loot table
$loot replace block {SHULKER_BOX} container.0 loot $(loot_table)
data modify storage {namespace}:main loot_table_first_page set from block {SHULKER_BOX} Items[0].components."minecraft:written_book_content".pages[0]

# Insert in the new array
data modify storage {namespace}:main new_entry set from storage {namespace}:main copy[0]
data modify storage {namespace}:main new_entry.first_page set from storage {namespace}:main loot_table_first_page
data modify storage {namespace}:main new_entries append from storage {namespace}:main new_entry

# If the index matches the score, extract the manual
execute if score #index {namespace}.data = @s {namespace}.action run data modify storage {namespace}:main extracted_pages set from block {SHULKER_BOX} Items[0].components."minecraft:written_book_content".pages
execute if score #index {namespace}.data = @s {namespace}.action run data modify storage {namespace}:main input.components."minecraft:written_book_content".author set from storage {namespace}:main copy[0].name
execute if score #index {namespace}.data = @s {namespace}.action run tellraw @s ["",{{"text":"[Universal Manual]","color":"blue"}},{{"text":" Loaded pages from ","color":"gray"}},{{"storage":"{namespace}:main","nbt":"copy[0].name"}}]
execute if score #index {namespace}.data = @s {namespace}.action at @s run playsound entity.experience_orb.pickup ambient @s

# Increase the index and loop again if remaining
scoreboard players add #index {namespace}.data 1
data remove storage {namespace}:main copy[0]
execute if data storage {namespace}:main copy[0] run data modify storage {namespace}:main raw.loot_table set from storage {namespace}:main copy[0].loot_table
execute if data storage {namespace}:main copy[0] run function {PATH}/get_all_manuals_loop with storage {namespace}:main raw
""")


    # Write the first page
    write_to_versioned_file(config, "update_manual/first_page", f"""
# Get the first page
data modify storage {namespace}:main first_page set value [""" + """
[
{"text":""},
{"text":"[Universal Manual]","color":"blue"},
{"text":"\\\\n\\\\n"},
{"text":"Choose your manual:\\\\n"}
]

""".replace("\n", "") + f"""]

# Loop through the new entries and add them to the first page
scoreboard players set #index {namespace}.data 1
data modify storage {namespace}:main index_input set value {{index:1}}
data modify storage {namespace}:main copy set from storage {namespace}:main new_entries
execute if data storage {namespace}:main copy[0] run function {PATH}/add_to_first_page with storage {namespace}:main index_input

# Convert first_page to a string
data modify storage {namespace}:main raw set value {{"first_page":[]}}
data modify storage {namespace}:main raw.first_page set from storage {namespace}:main first_page
function {PATH}/first_page_to_string with storage {namespace}:main raw

# Add the first page to the manual
data modify storage {namespace}:main raw set value {{"raw":""}}
data modify storage {namespace}:main raw.raw set from storage {namespace}:main first_page_string
data modify storage {namespace}:main pages append from storage {namespace}:main raw
""")

    # Convert first_page to a string
    write_to_versioned_file(config, "update_manual/first_page_to_string", f"""
$data modify storage {namespace}:main first_page_string set value '$(first_page)'
""")

    # Add the new entries to the first page
    write_to_versioned_file(config, "update_manual/add_to_first_page", f"""
# If not first index, add the separator
execute if score #index {namespace}.data matches 2.. run data modify storage {namespace}:main first_page append value [{{"text":", ","color":"green"}}]

# Add the new entries to the first page (copy[0] = {{"name":"", "pages":[]}})
$data modify storage {namespace}:main text_component set value [{{"text":"[","color":"dark_green", "hoverEvent":{{"action":"show_text","value":[] }}, "clickEvent":{{"action":"run_command","value":"/trigger {namespace}.action set $(index)"}} }}, {{"text":""}}, {{"text":"]"}}]
data modify storage {namespace}:main text_component[1].text set from storage {namespace}:main copy[0].name
data modify storage {namespace}:main text_component[0].hoverEvent.value set from storage {namespace}:main copy[0].hover
data modify storage {namespace}:main first_page append from storage {namespace}:main text_component

# Loop again if remaining
scoreboard players add #index {namespace}.data 1
execute store result storage {namespace}:main index_input.index int 1 run scoreboard players get #index {namespace}.data
data remove storage {namespace}:main copy[0]
execute if data storage {namespace}:main copy[0] run function {PATH}/add_to_first_page with storage {namespace}:main index_input
""")


    # Add the pages to the manual (not the first one)
    write_to_versioned_file(config, "update_manual/add_selected_manual", f"""
# Add the pages to the manual (not the first one)
data remove storage {namespace}:main extracted_pages[0]
data modify storage {namespace}:main pages append from storage {namespace}:main extracted_pages[]
""")


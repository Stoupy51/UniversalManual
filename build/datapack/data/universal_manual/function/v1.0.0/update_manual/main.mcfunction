
#> universal_manual:v1.0.0/update_manual/main
#
# @within	universal_manual:advancements/unlock_recipes
#			universal_manual:v1.0.0/tick
#

# Decrease trigger score
scoreboard players remove @s universal_manual.action 1

# Write the new manual
function universal_manual:v1.0.0/update_manual/write_manual

# Apply the new manual
data modify storage universal_manual:main Inventory set from entity @s Inventory
execute if data storage universal_manual:main Inventory[0] run function universal_manual:v1.0.0/update_manual/apply_inventory

# Reset and enable the action trigger
scoreboard players reset @s universal_manual.action
scoreboard players enable @s universal_manual.action


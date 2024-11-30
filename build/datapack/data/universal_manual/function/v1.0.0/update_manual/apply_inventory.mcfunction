
#> universal_manual:v1.0.0/update_manual/apply_inventory
#
# @within	universal_manual:v1.0.0/update_manual/main
#			universal_manual:v1.0.0/update_manual/apply_inventory
#

# Copy the item slot
scoreboard players set #slot universal_manual.data -1
execute if data storage universal_manual:main Inventory[0].components."minecraft:custom_data"."universal_manual".universal_manual store result score #slot universal_manual.data run data get storage universal_manual:main Inventory[0].Slot

# Apply the item slot
execute if score #slot universal_manual.data matches 0 run item replace entity @s container.0 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 1 run item replace entity @s container.1 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 2 run item replace entity @s container.2 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 3 run item replace entity @s container.3 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 4 run item replace entity @s container.4 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 5 run item replace entity @s container.5 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 6 run item replace entity @s container.6 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 7 run item replace entity @s container.7 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 8 run item replace entity @s container.8 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 9 run item replace entity @s container.9 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 10 run item replace entity @s container.10 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 11 run item replace entity @s container.11 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 12 run item replace entity @s container.12 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 13 run item replace entity @s container.13 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 14 run item replace entity @s container.14 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 15 run item replace entity @s container.15 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 16 run item replace entity @s container.16 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 17 run item replace entity @s container.17 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 18 run item replace entity @s container.18 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 19 run item replace entity @s container.19 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 20 run item replace entity @s container.20 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 21 run item replace entity @s container.21 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 22 run item replace entity @s container.22 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 23 run item replace entity @s container.23 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 24 run item replace entity @s container.24 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 25 run item replace entity @s container.25 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 26 run item replace entity @s container.26 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 27 run item replace entity @s container.27 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 28 run item replace entity @s container.28 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 29 run item replace entity @s container.29 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 30 run item replace entity @s container.30 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 31 run item replace entity @s container.31 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 32 run item replace entity @s container.32 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 33 run item replace entity @s container.33 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 34 run item replace entity @s container.34 from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 35 run item replace entity @s container.35 from block -30000000 14 1610 container.0

execute if score #slot universal_manual.data matches 103 run item replace entity @s armor.head from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 102 run item replace entity @s armor.chest from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 101 run item replace entity @s armor.legs from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches 100 run item replace entity @s armor.feet from block -30000000 14 1610 container.0
execute if score #slot universal_manual.data matches -106 run item replace entity @s weapon.offhand from block -30000000 14 1610 container.0

# Continue loop if there is more to apply (recursive)
data remove storage universal_manual:main Inventory[0]
execute if data storage universal_manual:main Inventory[0] run function universal_manual:v1.0.0/update_manual/apply_inventory


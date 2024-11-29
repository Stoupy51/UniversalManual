
#> universal_manual:v1.0.0/load/valid_dependencies
#
# @within	universal_manual:v1.0.0/load/secondary
#			universal_manual:v1.0.0/load/valid_dependencies 1t replace
#

# Waiting for a player to get the game version, but stop function if no player found
execute unless entity @p run schedule function universal_manual:v1.0.0/load/valid_dependencies 1t replace
execute unless entity @p run return 0
execute store result score #game_version universal_manual.data run data get entity @p DataVersion

# Check if the game version is supported
scoreboard players set #mcload_error universal_manual.data 0
execute unless score #game_version universal_manual.data matches 4082.. run scoreboard players set #mcload_error universal_manual.data 1

# Decode errors
execute if score #mcload_error universal_manual.data matches 1 run tellraw @a {"translate":"universal_manual_error_this_version_is_made_for_minecraft_1_21_3","color":"red"}
execute if score #dependency_error universal_manual.data matches 1 run tellraw @a {"translate":"universal_manual_error_libraries_are_missingplease_download_the","color":"red"}
execute if score #dependency_error universal_manual.data matches 1 unless score #smithed.crafter.major load.status matches 0.. run tellraw @a {"translate":"universal_manual.smithed_crafter_v0_5_0","color":"gold","clickEvent":{"action":"open_url","value":"https://wiki.smithed.dev/libraries/crafter/"}}
execute if score #dependency_error universal_manual.data matches 1 if score #smithed.crafter.major load.status matches 0 unless score #smithed.crafter.minor load.status matches 5.. run tellraw @a {"translate":"universal_manual.smithed_crafter_v0_5_0","color":"gold","clickEvent":{"action":"open_url","value":"https://wiki.smithed.dev/libraries/crafter/"}}

# Load Universal Manual
execute if score #game_version universal_manual.data matches 1.. if score #mcload_error universal_manual.data matches 0 if score #dependency_error universal_manual.data matches 0 run function universal_manual:v1.0.0/load/confirm_load


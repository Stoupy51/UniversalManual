
#> your_namespace:v1.21.615/load/enumerate
#
# @within	#your_namespace:enumerate
#

# If current major is too low, set it to the current major
execute unless score #your_namespace.major load.status matches 1.. run scoreboard players set #your_namespace.major load.status 1

# If current minor is too low, set it to the current minor (only if major is correct)
execute if score #your_namespace.major load.status matches 1 unless score #your_namespace.minor load.status matches 21.. run scoreboard players set #your_namespace.minor load.status 21

# If current patch is too low, set it to the current patch (only if major and minor are correct)
execute if score #your_namespace.major load.status matches 1 if score #your_namespace.minor load.status matches 21 unless score #your_namespace.patch load.status matches 615.. run scoreboard players set #your_namespace.patch load.status 615


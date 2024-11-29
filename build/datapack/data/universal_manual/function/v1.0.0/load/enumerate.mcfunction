
#> universal_manual:v1.0.0/load/enumerate
#
# @within	#universal_manual:enumerate
#

# If current major is too low, set it to the current major
execute unless score #universal_manual.major load.status matches 1.. run scoreboard players set #universal_manual.major load.status 1

# If current minor is too low, set it to the current minor (only if major is correct)
execute if score #universal_manual.major load.status matches 1 unless score #universal_manual.minor load.status matches 0.. run scoreboard players set #universal_manual.minor load.status 0

# If current patch is too low, set it to the current patch (only if major and minor are correct)
execute if score #universal_manual.major load.status matches 1 if score #universal_manual.minor load.status matches 0 unless score #universal_manual.patch load.status matches 0.. run scoreboard players set #universal_manual.patch load.status 0


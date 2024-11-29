
#> universal_manual:v1.0.0/load/check_dependencies
#
# @within	universal_manual:v1.0.0/load/secondary
#

## Check if Universal Manual is loadable (dependencies)
scoreboard players set #dependency_error universal_manual.data 0
execute if score #dependency_error universal_manual.data matches 0 unless score #smithed.crafter.major load.status matches 0.. run scoreboard players set #dependency_error universal_manual.data 1
execute if score #dependency_error universal_manual.data matches 0 if score #smithed.crafter.major load.status matches 0 unless score #smithed.crafter.minor load.status matches 5.. run scoreboard players set #dependency_error universal_manual.data 1


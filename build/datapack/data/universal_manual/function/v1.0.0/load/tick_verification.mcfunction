
#> universal_manual:v1.0.0/load/tick_verification
#
# @within	#minecraft:tick
#

execute if score #universal_manual.major load.status matches 1 if score #universal_manual.minor load.status matches 0 if score #universal_manual.patch load.status matches 0 run function universal_manual:v1.0.0/tick


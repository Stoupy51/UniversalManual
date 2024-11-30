
#> universal_manual:v1.0.0/load/delayed
#
# @within	universal_manual:v1.0.0/load/confirm_load
#			universal_manual:v1.0.0/load/delayed 2s replace
#

execute in minecraft:overworld run forceload add -30000000 1610
execute in minecraft:overworld run setblock -30000000 14 1610 yellow_shulker_box
execute unless loaded -30000000 14 1610 run schedule function universal_manual:v1.0.0/load/delayed 2s replace


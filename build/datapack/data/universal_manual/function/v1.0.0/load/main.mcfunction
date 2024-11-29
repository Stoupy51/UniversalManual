
#> universal_manual:v1.0.0/load/main
#
# @within	universal_manual:v1.0.0/load/resolve
#

# Avoiding multiple executions of the same load function
execute unless score #universal_manual.loaded load.status matches 1 run function universal_manual:v1.0.0/load/secondary


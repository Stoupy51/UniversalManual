
#> your_namespace:v1.21.615/tick
#
# @within	your_namespace:v1.21.615/load/tick_verification
#

# Timers
scoreboard players add #tick_2 your_namespace.data 1
scoreboard players add #second your_namespace.data 1
scoreboard players add #second_5 your_namespace.data 1
scoreboard players add #minute your_namespace.data 1
execute if score #tick_2 your_namespace.data matches 3.. run function your_namespace:v1.21.615/tick_2
execute if score #second your_namespace.data matches 20.. run function your_namespace:v1.21.615/second
execute if score #second_5 your_namespace.data matches 90.. run function your_namespace:v1.21.615/second_5
execute if score #minute your_namespace.data matches 1200.. run function your_namespace:v1.21.615/minute


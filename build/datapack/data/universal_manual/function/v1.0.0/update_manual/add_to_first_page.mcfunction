
#> universal_manual:v1.0.0/update_manual/add_to_first_page
#
# @within	universal_manual:v1.0.0/update_manual/first_page with storage universal_manual:main index_input
#			universal_manual:v1.0.0/update_manual/add_to_first_page with storage universal_manual:main index_input
#

# If not first index, add the separator
execute if score #index universal_manual.data matches 2.. run data modify storage universal_manual:main first_page append value [{"text":", ","color":"green"}]

# Add the new entries to the first page (copy[0] = {"name":"", "pages":[]})
$data modify storage universal_manual:main text_component set value [{"text":"[","color":"dark_green", "hoverEvent":{"action":"show_text","value":[] }, "clickEvent":{"action":"run_command","value":"/trigger universal_manual.action set $(index)"} }, {"text":""}, {"text":"]"}]
data modify storage universal_manual:main text_component[1].text set from storage universal_manual:main copy[0].name
data modify storage universal_manual:main text_component[0].hoverEvent.value set from storage universal_manual:main copy[0].hover
data modify storage universal_manual:main first_page append from storage universal_manual:main text_component

# Loop again if remaining
scoreboard players add #index universal_manual.data 1
execute store result storage universal_manual:main index_input.index int 1 run scoreboard players get #index universal_manual.data
data remove storage universal_manual:main copy[0]
execute if data storage universal_manual:main copy[0] run function universal_manual:v1.0.0/update_manual/add_to_first_page with storage universal_manual:main index_input



#> universal_manual:v1.0.0/update_manual/first_page
#
# @within	universal_manual:v1.0.0/update_manual/write_manual
#

# Get the first page
data modify storage universal_manual:main first_page set value [[{"text":""},{"translate":"universal_manual","color":"blue"},{"text":"\\n\\n"},{"translate":"universal_manual.choose_your_manual"}]]

# Loop through the new entries and add them to the first page
scoreboard players set #index universal_manual.data 1
data modify storage universal_manual:main index_input set value {index:1}
data modify storage universal_manual:main copy set from storage universal_manual:main new_entries
execute if data storage universal_manual:main copy[0] run function universal_manual:v1.0.0/update_manual/add_to_first_page with storage universal_manual:main index_input

# Convert first_page to a string
data modify storage universal_manual:main raw set value {"first_page":[]}
data modify storage universal_manual:main raw.first_page set from storage universal_manual:main first_page
function universal_manual:v1.0.0/update_manual/first_page_to_string with storage universal_manual:main raw

# Add the first page to the manual
data modify storage universal_manual:main raw set value {"raw":""}
data modify storage universal_manual:main raw.raw set from storage universal_manual:main first_page_string
data modify storage universal_manual:main pages append from storage universal_manual:main raw


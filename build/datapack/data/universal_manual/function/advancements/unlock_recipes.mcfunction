
#> universal_manual:advancements/unlock_recipes
#
# @within	advancement universal_manual:unlock_recipes
#

advancement revoke @s only universal_manual:unlock_recipes
recipe give @s universal_manual:universal_manual

execute if items entity @s container.* written_book[custom_data~{"universal_manual":{"universal_manual":true,"is_setup":false}}] run function universal_manual:v1.0.0/update_manual/main


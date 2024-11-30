
# Import database helper and setup constants
from python_datapack.utils.database_helper import *
from python_datapack.utils.ingredients import *
from python_datapack.constants import *

# Main function should return a database
def main(config: dict) -> dict[str, dict]:
    database: dict[str,dict] = {}
    namespace: str = config["namespace"]
    source_lore: list[dict] = config["source_lore"]

    # Define the universal manual
    database["universal_manual"] = {
        "id": "minecraft:written_book",
        "item_name": json.dumps(source_lore),
        "max_stack_size": 1,
        "custom_data": {
            namespace: {
                "universal_manual": True,
                "is_setup": False
            }
        },

        # Define the crafting recipes
        RESULT_OF_CRAFTING: [
            # Put a book and a steel ingot in the crafting grid to get the manual
            {"type":"crafting_shapeless","result_count":1,"group":"manual","category":"misc","ingredients":[
                ingr_repr("minecraft:book"),
                ingr_repr("minecraft:lapis_block"),
                ingr_repr("minecraft:gold_block"),
                ingr_repr("minecraft:book"),
            ]},

            # Put the manual in the crafting grid to get the manual back (update the manual)
            {"type":"crafting_shapeless","result_count":1,"group":"manual","category":"misc","ingredients": [ingr_repr("universal_manual", namespace)]},
        ],
    }

    # Final adjustments, you definitively should keep them!
    add_item_model_component(config, database)
    add_smithed_ignore_vanilla_behaviours_convention(database)	# Smithed items convention
    print()

    # Return database
    return database


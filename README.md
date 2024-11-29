
# Python Datapack Template

[![GitHub](https://img.shields.io/github/v/release/Stoupy51/python_datapack?logo=github&label=GitHub)](https://github.com/Stoupy51/python_datapack/releases/latest)
[![Discord](https://img.shields.io/discord/1216400498488377467?label=Discord&logo=discord)](https://discord.gg/anxzu6rA9F)

## ❓ What is `python_datapack`
`python_datapack` is a [Python package](https://github.com/Stoupy51/python_datapack) 📦 (and a template) aiming to provide huge automation for creating Minecraft datapacks.<br>
It is designed to be very simple to use and very convenient for developers.<br>
Here is a list of features that the package provides (the template is using all of them with clear comments):

- 🔄 Automatic resource pack files generation (models, textures, sounds, music discs) with the ability to override them with help of the `assets` folder.
- ⏳ Versioned load, and clock functions such as `tick`, `second`, `minute`.
- 🗃️ Loot tables for every item in the `database` along with a proper `_give_all` function that gives named chests.
- 📖 Automatic generation of a really [advanced and interactive items `manual`](./assets/in_game_manual_example.png).
- 📝 Automatic generation of a `en-us.json` lang file in the resource pack if configuration is set.
- 🖼️ Automatic headers for every function in `functions` folders.
- 📦 Minecraft like vanilla recipes unlocking.
- 📚 Official libraries integrations:
  - 🧪 Automatic support for NBT Recipes with [`Smithed Crafter`](https://wiki.smithed.dev/libraries/crafter/) and [`Furnace NBT Recipes`](https://github.com/Stoupy51/FurnaceNbtRecipes/)
  - 🛠️ Placement and destruction for every custom block in the `database` with support for blockstates, ore drops (fortune, silk touch), with [`Smithed Custom Blocks`](https://wiki.smithed.dev/libraries/custom-block/).
  - ⛏️ Custom ore generation with [`Smart Ore Generation`](https://github.com/Stoupy51/SmartOreGeneration).
  - 📦 Item transportation / container declaration with [`ItemIO`](https://github.com/edayot/ItemIO) when making custom containers.
  - 🔔 Events such as new items detection with [`Common Signals`](https://github.com/Stoupy51/CommonSignals).
- 🌐 External datapack libraries support, see configuration for more information.
- 🔗 Merging datapacks and resource packs with libraries using [Smithed Weld](https://weld.smithed.dev/).
- 🧩 Automatic recognition of custom blocks patterns depending on the texture names in the `assets/textures` folder. For instance, if you have a top, side, and bottom texture, the block will be automatically recognized as a cube with the top, side, and bottom textures.
- 📏 Follow the datapack conventions such as [LanternLoad](https://github.com/LanternMC/load), [CustomModelData prefix](https://mcdatapack.vercel.app/), [tag specification](https://wiki.smithed.dev/conventions/tag-specification/), and [namespacing](https://wiki.smithed.dev/conventions/namespacing/).
- 🧰 Ability to merge a model with the autogenerated one or override it.
- 🔀 `merge` folder providing a way to merge custom files with the autogenerated ones or add custom files to the datapack.
- ⚙️ Automatic special compatibilities with datapacks such as [`SimpleDrawer's compacted drawer`](https://edayot.github.io/SimpleDrawer/material.html), [`SimplEnergy's pulverizer`](./build/datapack/data/your_namespace/function/calls/simplenergy/pulverizer_recipes.mcfunction).
- 📂 Automatic copy of generated zip files to configured folders.


## 📦 How to use
In order to use the package, you need to have at least [Python 3.10](https://www.python.org/downloads/) or higher installed on your computer.<br>
Then, you can clone this repository and start configuring the `config.py` script.<br>
Every configuration is explained in the file.<br>
Once you have configured the script, you can run the `build.py` script.<br>
The script will generate a datapack and a resource pack in the `build` folder.<br>
And that's it! 🎉 That is very simple to use the package.<br>
Since this template is using all the features of the package, you can remove the parts you don't need! 🧹<br>


## 🔧 Minecraft version
The Minecraft version will depend on the version of the package you are using.<br>
Currently, this template is using the `1.21.3.x` version of the package.<br>
As you can see, the `x` is the version of the package and the `1.21.3` is the Minecraft version.<br>
If you have Python knowledge, you can use previous versions of the package with `pip install python_datapack==1.21.3.x`.<br>
But warned ⚠️, the template could use features that are not available in the previous versions.<br>


## 📚 Documentation
There are a lot of features in the package, you could check the template to see how to use them.<br>
Alternatively, you could join the [Discord server](https://discord.gg/anxzu6rA9F) to ask questions and get help from the community!<br>
Or, you could check the **highly detailed** [documentation folder](docs/)<br>
Here a list of all the currently available guides:
- [Project structure](docs/1_project_structure.md)
- [Database setup](docs/2_database_setup.md)
- [Writing to files](docs/3_writing_to_files.md)
- [External dependencies](docs/4_external_dependencies.md)
- [Miscellaneous](docs/5_miscellaneous.md)
- [Migration guide](docs/6_migration_guide.md)
- [Adding a sword](docs/specific_guides/adding_a_sword.md)
- More soon!


## 🤝 Contribute
Want to help improve Python Datapack? 🔍<br>
Make sure first you contribute on the right repository, such as the [package 📦 itself](https://github.com/Stoupy51/python_datapack).<br>
Here's how you can contribute:
- 🐛 **Report Bugs**: Found a bug? Open an issue on GitHub describing what happened and how to reproduce it.
- ✨ **Suggest Features**: Have an idea for a new feature? Share it in the issues section!
- 🔧 **Submit Pull Requests**: Feel free to fix bugs or add new features by submitting pull requests.
- 📚 **Improve Documentation**: Help make our docs better by fixing errors or adding examples.
- 💬 **Help Others**: Join our [Discord server](https://discord.gg/anxzu6rA9F) and help other users with their questions.

All contributions are welcome! Please make sure to read our contribution guidelines before making a pull request.


## 📜 What projects use Python Datapack?
To search for projects that use the package, I search like [this.](https://github.com/search?q=%22from+python_datapack+import+build_process%22&type=code)<br>
Here is a list of projects that use the package:<br>
- Actual projects:
  - Your next project here!
  - https://github.com/e-psi-lon/Armored-Elytra
  - https://github.com/Stoupy51/SimplEnergy
  - https://github.com/Stoupy51/ImagineYourCraftDatapack
  - https://github.com/Stoupy51/LifeSteal
  - https://github.com/Stoupy51/Survisland
  - https://github.com/Stoupy51/SmithedSummit
  - https://github.com/Stoupy51/SheepWars
  - https://github.com/Stoupy51/MoreApples
  - https://github.com/Stoupy51/CauldronConcretePowder

- Libraries or tools:
  - https://github.com/Stoupy51/SmartOreGeneration
  - https://github.com/Stoupy51/CommonSignals


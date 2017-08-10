**This document for the devellopers who want use the mod in dependance.**

**See Readme.md if you are a user.**

# Snowdrif API

Summary :
1. Settings
2. Files
 - 2.1. Functions in ./src/utils.lua
3. Description of data
 - 3.1. Player
 - 3.2. Particules
 - 3.3. Sounds

## Settings

For the moment, just take a look in futuresettings.lua.


## Files

- /lib/utils.lua : fonctions that are not specialized for snowdrif
- /futuresettings.lua -> used to keep some constants of the mod, will be replaced by a settingstype
- /src/definitions.lua : define other variables and some storage for data
- /src/playermetada.lua : define and manage metadata of the player
- /src/skyparticleshandler.lua : manage the spawn of particules
- /src/skybrightness.lua : manage the change of the sky color
- /src/calculation.lua : make calculation to decide the weather, will disapear (split in two mods, snowdrift will become a modpack)
- /src/soundhandler.lua : manage the sound
- /src/commands.lua : register privilege and chat commands


## ./src/utils.lua

- snowdrift.is_outside(pos) and snowdrift.is_inside(pos)

Test if the pos is outside using ligth at midday (may issue with glass), return true if outside.


## ./src/playermetada.lua

- snowdrift.get_player_data(player)

- snowdrift.set_weather(player_data, new_weather)
- snowdrift.set_quota(player_data, new_quota)

- snowdrift.register_on_changeweather(player_data, funct, listener_name)
- snowdrift.register_on_changeboolquota(player_data, funct, listener_name)
- snowdrift.clear_changeweather(player_data, listener_name)
- snowdrift.clear_changeboolquota(player_data, listener_name)


## ./src/calculation.lua

Default function :

    Biome system: Frozen biomes below heat 35,
    deserts below line 14 * t - 95 * h = -1496
    h = (14 * t + 1496) / 95
    h = 14/95 * t + 1496/95
    where 14/95 is gradient and 1496/95 is y intersection
    h - 14/95 t = 1496/95 y intersection
    so area above line is
    h - 14/95 t > 1496/95



## Description of data

### Player

The metadata of the player are stocked in snowdrift.players_data.name_of_the_player, and are describe like this :

- player : the object of the player
- player_name : the name of the player
- ppos : a position near the player used to calculate the weather
- weather : the weather for the player
- bool_quota : true if the percent of emitted particules is enought to play a sound -> may disapear for a more progressive way
- sound_handle : the handle of the played sound if there is one, nil if not
- has_changed -> internal use, will disapear
- listener_weather : list of function to call when the weather of that player change -> reserved for further use
- listener_bool_quota : list of function to call when the bool_quota of that player change -> reserved for further use


### Particules

The particules are stocked in snowdrift.particles_data.name_of_their_weather, and  are describe like this :

- base_number : number of particules used by the spawner, used directly for the moment
- min_box : min position where create particules
- random_vector : apply a math.random between 0 and each index of this vector, the add it to min_box to found a position to emit particules
- base_velocity : vector used by the spawner, used directly for the moment
- base_acceleration : vector used by the spawner, used directly for the moment
- expirationtime : expirationtime used by the spawner
- size : size used by the spawner
- texture : table of textures that can be used (one is chosen randomly at each generation)


### Sounds

The particules are stocked in snowdrift.sounds_data.name_of_their_weather, and  are describe like this :

- song : name of the file without extension
- base_gain : gain used to play the sound, used directly for the moment



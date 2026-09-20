# EurekaUtils

A Minecraft Java Edition datapack for Eureka's player onboarding flow: welcome messages, Staff notifications, and configurable teleports.

## Requirements

- A Minecraft Java server/world compatible with the datapack's `pack_format` in `Datapack/EurekaUtils/pack.mcmeta`.
- Operator permission to install/reload datapacks, configure storage, manage teams, and place command blocks.
- Command blocks enabled on a server (`enable-command-block=true` in `server.properties`).

## Install

### Package from this repository

From the project root in PowerShell, run:

```powershell
.\Package-Datapack.ps1
```

This creates `dist/EurekaUtils.zip`. The archive is deliberately structured with `pack.mcmeta` and `data/` at its root, as Minecraft requires.

### Add to a world or server

1. Copy `EurekaUtils.zip` into the target world's `datapacks` directory:
   - Single-player: `<world save>/datapacks/`
   - Server: `<server directory>/<world name>/datapacks/`
2. Start the world/server, or run:

   ```mcfunction
   /reload
   ```

3. Confirm Minecraft has loaded it:

   ```mcfunction
   /datapack list
   ```

The load function creates the `Staff` team and initializes missing destination configuration. Existing configuration is not overwritten on subsequent reloads.

## Staff team setup

The `Staff` team determines who is placed in Creative mode by the welcome function and who receives Staff notifications. Add every Staff member as an operator:

```mcfunction
/team join Staff PlayerName
```

For example:

```mcfunction
/team join Staff Aluciel
/team join Staff Lynkh
```

The team name is case-sensitive: it must be exactly `Staff`.

## Command-block functions

In a command block, enter commands **without** the leading `/`. Use an Impulse command block with a button, pressure plate, redstone signal, or whatever activation mechanism suits that location. For a multi-step flow, use Chain command blocks after the first block.

Distance selectors are measured from the command block/function execution location. Place each command block at the relevant trigger location.

| Purpose | Command block command | Placement / behavior |
| --- | --- | --- |
| Spawn welcome and game mode | `function eureka_utils:welcome` | Use at the spawn/onboarding trigger. The nearest non-Staff player is put into Adventure mode; the nearest Staff player is put into Creative mode. Nearby players receive the applicable message. |
| Underage Staff notification | `function eureka_utils:notify_staff_underage` | Place at the bedrock-box trigger. Notifies all online `Staff` players about the nearest player within 40 blocks. |
| Send underage player to jail | `function eureka_utils:teleport_jail` | Place immediately after the underage notification. Teleports the nearest player within 6 blocks to the configured jail destination. |
| Noobland Staff notification | `function eureka_utils:notify_staff_noobland` | Place at the Noobland trigger. Notifies all online `Staff` players about the nearest player within 50 blocks. |
| Send player to Noobland | `function eureka_utils:teleport_noobland` | Place at the relevant teleport trigger. Teleports the nearest player within 5 blocks to the configured Noobland destination. |
| Age-selection room | `function eureka_utils:teleport_age_selection` | Place at the reading/onboarding trigger. Tells the nearby player "Yay!! You can read!!", plays a chime, teleports them to the configured age-selection room, and emits particles there. |

For the underage path, a typical pair of chained commands is:

```mcfunction
function eureka_utils:notify_staff_underage
function eureka_utils:teleport_jail
```

## Destination configuration

Locations are stored persistently in the world's datapack storage, not in hard-coded command-block commands. They are created with defaults on the first `/reload` after installing the pack.

Inspect the current settings:

```mcfunction
/data get storage eureka_utils:config
```

> **Important:** Values in these configuration commands are quoted strings. Keep the quotes when changing coordinates.

### Noobland

```mcfunction
/data modify storage eureka_utils:config noobland set value {x:"305.5",y:"101",z:"-252.5",yaw:"180",pitch:"0"}
```

### Jail

```mcfunction
/data modify storage eureka_utils:config jail set value {x:"9971.5",y:"94",z:"9962.5",yaw:"0",pitch:"0"}
```

### Age-selection room

```mcfunction
/data modify storage eureka_utils:config age_selection set value {teleport_x:"10007",teleport_y:"93",teleport_z:"9971",teleport_yaw:"180",teleport_pitch:"0",sound_x:"10007",sound_y:"93",sound_z:"9971",sound_volume:"20",particle_x:"10011",particle_y:"94",particle_z:"9971",particle_dx:"5",particle_dy:"8",particle_dz:"5",particle_speed:"100",particle_count:"2000"}
```

The `teleport_*` values are the destination and facing direction. `sound_*` controls the chime location and volume. `particle_*` controls the particle location, spread (`dx`, `dy`, `dz`), speed, and count.

Configuration changes take effect on the next function call; `/reload` is not required after using `data modify`.

To restore a destination to the default shipped by the datapack, remove only that setting and reload:

```mcfunction
/data remove storage eureka_utils:config noobland
/reload
```

Replace `noobland` with `jail` or `age_selection` as needed.

## Updating the datapack

After editing datapack files:

1. Run `./Package-Datapack.ps1` from PowerShell.
2. Replace the old ZIP in the world's `datapacks` directory.
3. Run `/reload`.
4. Check the server console for datapack/function loading errors.

Destination settings already saved in `eureka_utils:config` are retained when the datapack is updated.

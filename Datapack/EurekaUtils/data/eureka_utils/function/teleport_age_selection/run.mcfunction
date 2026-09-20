# This macro receives the room effects and destination from eureka_utils:config/age_selection.
tellraw @p[distance=..5] [{"text":"Yay!!  You can read!!"}]
$playsound minecraft:block.note_block.chime master @p $(sound_x) $(sound_y) $(sound_z) $(sound_volume)
$tp @p[distance=..5] $(teleport_x) $(teleport_y) $(teleport_z) $(teleport_yaw) $(teleport_pitch)
$particle minecraft:happy_villager $(particle_x) $(particle_y) $(particle_z) $(particle_dx) $(particle_dy) $(particle_dz) $(particle_speed) $(particle_count) normal @p

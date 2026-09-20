# EurekaUtils initialization.
# This function runs whenever the datapack is loaded or reloaded.
# `team add` leaves an existing team unchanged.
team add Staff

# Create the editable Noobland destination only when it has not been configured.
execute unless data storage eureka_utils:config noobland run data modify storage eureka_utils:config noobland set value {x:"305.5",y:"101",z:"-252.5",yaw:"180",pitch:"0"}

# Create the editable jail destination only when it has not been configured.
execute unless data storage eureka_utils:config jail run data modify storage eureka_utils:config jail set value {x:"9971.5",y:"94",z:"9962.5",yaw:"0",pitch:"0"}

# Create the editable age-selection room configuration only when it has not been configured.
execute unless data storage eureka_utils:config age_selection run data modify storage eureka_utils:config age_selection set value {teleport_x:"10007",teleport_y:"93",teleport_z:"9971",teleport_yaw:"180",teleport_pitch:"0",sound_x:"10007",sound_y:"93",sound_z:"9971",sound_volume:"20",particle_x:"10011",particle_y:"94",particle_z:"9971",particle_dx:"5",particle_dy:"8",particle_dz:"5",particle_speed:"100",particle_count:"2000"}

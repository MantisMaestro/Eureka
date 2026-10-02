# Set only the nearest player within 10 blocks of each team filter to the appropriate mode.
gamemode adventure @p[distance=..10,team=!Staff]
gamemode creative @p[distance=..10,team=Staff]

# Welcome a nearby new player.
tellraw @p[distance=..10,team=!Staff] ["",{"text":"Welcome to the Server! Please enjoy this peaceful town, which was built by many of our server members during Eureka: Season 12.","color":"green"},{"text":"\n"},{"text":"When you're ready to continue on to Eureka 13, please enter the Laboratory building on the East side (on the opposite side of the town to this spawn building)","color":"aqua"}]

# Inform a nearby staff member about the onboarding behavior.
tellraw @p[distance=..10,team=Staff] ["",{"text":"Staff member detected. Placing you in Creative mode.","color":"blue"},{"text":"\n"},{"text":"New players are placed in Adventure Mode and instructed to enter Library for initiation.","italic":true,"color":"gray"}]

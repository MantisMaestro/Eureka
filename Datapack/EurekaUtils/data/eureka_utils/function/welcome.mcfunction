# Set the nearest player to the appropriate mode based on their Staff team membership.
gamemode adventure @p[team=!Staff]
gamemode creative @p[team=Staff]

# Welcome a nearby new player.
tellraw @p[distance=..10,team=!Staff] ["",{"text":"Welcome to the Server! Please enjoy this peaceful town, which was built by many of our server members during Eureka: Season 11.","color":"green"},{"text":"\n"},{"text":"When you're ready to continue on to Eureka 12, please enter the Library building on the North side (to the right of the bridge where you spawned.)","color":"aqua"}]

# Inform a nearby staff member about the onboarding behavior.
tellraw @p[distance=..10,team=Staff] ["",{"text":"Staff member detected. Placing you in Creative mode.","color":"blue"},{"text":"\n"},{"text":"New players are placed in Adventure Mode and instructed to enter Library for initiation.","italic":true,"color":"gray"}]

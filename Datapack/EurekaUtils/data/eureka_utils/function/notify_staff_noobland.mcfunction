# Notify every Staff team member about the nearest player within 50 blocks.
# Run this from the Noobland command block/location so the distance selector is centered there.
tellraw @a[team=Staff] ["",{"selector":"@p[distance=..50]","color":"green"},{"text":" just went to Noobland!","color":"green"}]

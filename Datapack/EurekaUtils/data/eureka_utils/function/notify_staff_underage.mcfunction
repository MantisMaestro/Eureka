# Notify every Staff team member about the nearest player within 40 blocks.
# Run this from the bedrock-box command block/location so the distance selector is centered there.
tellraw @a[team=Staff] ["",{"selector":"@p[distance=..40]","color":"#DC575A"},{"text":" just went to the bedrock box. Just a widdle baby!","color":"#DC575A"}]

# The bedrock-box trigger always notifies Staff and sends the player to jail together.
function eureka_utils:teleport_jail

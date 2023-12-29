# Check if there's still a beacon block at the location of the item display
# if it's gone, run the break function, we also check for glass in the case
# where a player tries to use the beacon, and we replace it with glass for 1
# tick to get rid of the UI element
execute unless block ~ ~ ~ beacon run execute unless block ~ ~ ~ glass run function baseshare:blocks/base_beacon/break
# Check if there's still a beacon block at the location of the item display
# if it's gone, run the break function, we also check for glass in the case
# where a player tries to use the beacon, and we replace it with glass for 1
# tick to get rid of the UI element
execute unless block ~ ~ ~ beacon run execute unless block ~ ~ ~ glass run function baseshare:blocks/base_beacon/break

# Check if there's any beacon associated blocks under the beacon
execute if block ~ ~-1 ~ netherite_block run function baseshare:blocks/base_beacon/nullify_beacon
execute if block ~ ~-1 ~ emerald_block run function baseshare:blocks/base_beacon/nullify_beacon
execute if block ~ ~-1 ~ diamond_block run function baseshare:blocks/base_beacon/nullify_beacon
execute if block ~ ~-1 ~ gold_block run function baseshare:blocks/base_beacon/nullify_beacon
execute if block ~ ~-1 ~ iron_block run function baseshare:blocks/base_beacon/nullify_beacon
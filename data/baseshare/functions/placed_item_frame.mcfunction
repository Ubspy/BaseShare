# Revoke trigger advancement
advancement revoke @s only baseshare:placed_item_frame

# Look for the closest item frame, and run the checker, will turn it into an item display
# Looks for anything tagged with item_frame, and within 10 blocks,
# anything more is out of player's reach
execute as @e[tag=baseshare.item_frame,distance=..10] at @s run function baseshare:blocks/checker
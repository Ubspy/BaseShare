# This is mostly for if we add more blocks
# So all blocks marked with base_beacon we turn into a base beacon
execute as @s[tag=baseshare.base_beacon] run function baseshare:blocks/base_beacon/place

# Delete the item frame
kill @s
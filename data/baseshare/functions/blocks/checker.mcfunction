# This is mostly for if we add more blocks
# So all blocks marked with base_beacon we turn into a base beacon
# Executing as @s with the filtering is basically an if statement, @s is always the closest entity,
# so if it's a base_beacon then it'll run the function for it
execute as @s[tag=baseshare.base_beacon] run function baseshare:blocks/base_beacon/place

# Delete the item frame
kill @s
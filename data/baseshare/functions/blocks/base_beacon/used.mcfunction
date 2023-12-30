advancement revoke @s only baseshare:used_beacon

# Find the nearest base beacon to the user and cancel the UI element by replacing the beacon with glass
execute as @e[sort=nearest, tag=baseshare.base_beacon, limit=1] run execute at @s run setblock ~ ~ ~ glass replace

# Put the beacon back after 2 ticks
execute as @e[sort=nearest, tag=baseshare.base_beacon, limit=1] run execute at @s run schedule function baseshare:blocks/base_beacon/replace_beacon 2t

# Check for a sign at each side and of top of the base beacon, if we find one then
# we will rename the beacon and run add
execute as @e[sort=nearest, tag=baseshare.base_beacon, limit=1] at @s if data block ~1 ~ ~ front_text run execute positioned ~1 ~ ~ run function baseshare:blocks/base_beacon/name

# Run print bases for this user
function baseshare:printbases
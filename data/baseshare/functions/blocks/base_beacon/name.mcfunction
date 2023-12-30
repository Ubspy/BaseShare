# Set NewBaseName in our storage to the top line of the sign
# Unfortunately, just getting messasges[0] gives us: '{"text": "Name"}'
# Since we name just Name, we cut off the first 9 characters, and the last 2 characters
data modify storage baseshare:tmp NewBaseName set string block ~ ~ ~ front_text.messages[0] 9 -2

data modify block ~ ~ ~ front_text.messages insert 1 string entity @s

# Set name of base beacon to this base name
execute as @e[sort=nearest, tag=baseshare.base_beacon_name, limit=1] run data modify entity @s CustomName set from block ~ ~ ~ front_text.messages[0]

# Add named tag for later removal
tag @e[sort=nearest, tag=baseshare.base_beacon_name, limit=1] add baseshare.named

# Get rid of the sign
setblock ~ ~ ~ air replace

# Add the base
execute as @p run function baseshare:add
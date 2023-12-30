# Spawn the base beacon where the block was broken
loot spawn ~ ~ ~ loot baseshare:base_beacon

# Find the nearest beacon drop and kill it
execute as @e[type=item, sort=nearest, limit=1, distance=..2, nbt={OnGround:0b, Age:0s, Item:{id: "minecraft:beacon"}}] run kill @s

# Also kill the item_display
kill @s

# Set NewBaseName to the name of this beacon, so we can remove it from the list
# Unfortunately, just getting the entity CustonName gives us: '{"text": "Name"}'
# Since we name just Name, we cut off the first 9 characters, and the last 2 characters
data modify storage baseshare:tmp NewBaseName set string entity @e[sort=nearest, tag=baseshare.base_beacon_name, limit=1] CustomName 9 -2

# Remove this base from the list
execute as @e[sort=nearest, tag=baseshare.base_beacon_name, limit=1, distance=..10] run execute if entity @s[tag=baseshare.named] as @p run execute as @p run function baseshare:remove

# Kill the name display on top of it
kill @e[type=item_display, limit=1, distance=1, tag=baseshare.base_beacon_name]
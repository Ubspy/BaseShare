# Spawn the base beacon where the block was broken
loot spawn ~ ~ ~ loot baseshare:glass

# Find the nearest beacon drop and kill it
execute as @e[type=item, sort=nearest, limit=1, distance=..2, nbt={OnGround:0b, Age:0s, Item:{id: "minecraft:glass"}}] run kill @s

# Also kill the item_display
kill @s

# Kill the name display on top of it
kill @e[type=item_display, limit=1, distance=1, tag=baseshare.base_beacon_name]
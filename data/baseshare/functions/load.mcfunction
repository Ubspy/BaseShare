# Tmp, remove later to prevent crashing
tellraw @a {"text": "Loaded!", "color": "gold"}

# Initialize database
execute unless data storage baseshare:bases Players run data modify storage baseshare:bases Players set value []

# Create objectives
# This just won't do anything if they already exist
scoreboard objectives add TmpVal dummy "TmpVal"
scoreboard objectives add BaseSharePlayers dummy "BaseSharePlayers"
scoreboard objectives add PrintMutex dummy "PrintMutex"

# If the score match fails, $count doesn't exist, so set it to 1
execute unless score $count BaseSharePlayers matches -2147483648..2147483647 run scoreboard players set $count BaseSharePlayers 1
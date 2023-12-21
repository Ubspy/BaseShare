# Tmp, remove later to prevent crashing
tellraw @a {"text": "Loaded!", "color": "gold"}

# Initialize database
execute unless data storage baseshare:bases Players run data modify storage baseshare:bases Players set value []

# Create objectives
# This just won't do anything if they already exist
execute run scoreboard objectives add TmpVal dummy "TmpVal"
execute run scoreboard objectives add BaseSharePlayers dummy "BaseSharePlayers"
execute run scoreboard players add $count BaseSharePlayers 1
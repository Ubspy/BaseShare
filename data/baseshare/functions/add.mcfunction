# The BaseSharePlayers scoreboard will be used to assign each player who uses this pack a unique ID,
# starting at 1 and going on until INT_MAX

# First check if the current player is on the board at all, if not, add them using the current count
# (assume count is there from initialization, and was set initially to 0)
execute unless score @s BaseSharePlayers matches 1.. store result score @s BaseSharePlayers run scoreboard players get $count BaseSharePlayers

# Make new player:
data modify storage baseshare:tmp NewPlayer set value {}
execute store result storage baseshare:tmp NewPlayer.PlayerID int 1 run scoreboard players get @s BaseSharePlayers

# May need the sign trick here, but idk if it's even worth doing so
data modify storage baseshare:tmp NewPlayer.PlayerName set from entity @s CustomName
data modify storage baseshare:tmp NewPlayer.Bases set value []

# Append this new player to the players in the main storage
execute if score $count BaseSharePlayers = @s BaseSharePlayers run data modify storage baseshare:bases Players append from storage baseshare:tmp NewPlayer

# If count is the same as the player's index, we just added it, increase the count
execute if score $count BaseSharePlayers = @s BaseSharePlayers run scoreboard players add $count BaseSharePlayers 1

# Remove NewPlayer so there's no conflicts
execute run data remove storage baseshare:tmp NewPlayer

# Reorder the array to have the last element of Players be our player
function baseshare:orderplayers

# Now we want to check and see if this base already exists
function baseshare:searchbases

# Now, the rest of this function should only happen if we did not find the base

# TODO: Mutex lock
# TODO: Make this a github project

# NEW FUNCTION
# Search to make sure the name doesn't already exist (most likely in a similar fashion to the last recusrion)
# Add a base using players coordinates
# Need to decide how to add a base, since you cannot run

# execute as @s run data modify storage baseshare:bases Players[{PlayerName: {selector: "@s"}}] merge string entity @s CustomName

# Datastructure:
# {
#     "Players": [
#         {
#			  "PlayerID": 0
#             "PlayerName": "Ubspy",
#             "Bases": [
#                 {
#                     "BaseName": "Home",
#                     "X": 120,
#                     "Z": -250
#                 },
#                 {
#                     "BaseName": "KFC",
#                     "X": 165,
#                     "Z": 107
#                 }
#             ]
#         }
#     ]
# }
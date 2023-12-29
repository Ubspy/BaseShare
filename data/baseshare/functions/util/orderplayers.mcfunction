# Sort recursive function
# TmpVal needs to exist as an objective, this would copy the last index of the Players arr
execute store result score @s TmpVal run data get storage baseshare:bases Players[-1].PlayerID
# execute if score @s TmpVal = @s BaseSharePlayers run data modify storage baseshare:bases CurrentPlayer set from storage baseshare:bases Players[-1]

# Copy last element to the front, then remove the last element to reorder the list
execute unless score @s TmpVal = @s BaseSharePlayers run data modify storage baseshare:bases Players insert 0 from storage baseshare:bases Players[-1]
execute unless score @s TmpVal = @s BaseSharePlayers run data remove storage baseshare:bases Players[-1]

# Run function if it's not empty, because it means there's more to search
# Once this is done, the variable at CurrentPlayer in baseshare:tmp will be the player running this function
execute unless score @s TmpVal = @s BaseSharePlayers run function baseshare:util/orderplayers
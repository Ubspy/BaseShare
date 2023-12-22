# Sort recursive function

# Copy the NewBaseName data to a temporary Compare register
data remove storage baseshare:tmp Compare
data modify storage baseshare:tmp Compare set from storage baseshare:tmp NewBaseName

# Try to write the last element of the search array to this compare register, it will fail if they're the same string
execute store success score @s TmpVal run data modify storage baseshare:tmp Compare set from storage baseshare:bases Players[-1].Bases[-1].BaseName

# Copy last element to the front, then remove the last element to reorder the list
execute unless score @s TmpVal matches 0 run data modify storage baseshare:bases Players[-1].Bases insert 0 from storage baseshare:bases Players[-1].Bases[-1]
execute unless score @s TmpVal matches 0 run data remove storage baseshare:bases Players[-1].Bases[-1]

# Run function if it's not empty, because it means there's more to search
# Once this is done, the variable at CurrentPlayer in baseshare:tmp will be the player running this function
execute unless score @s TmpVal matches 0 run function baseshare:orderbases
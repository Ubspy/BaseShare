function baseshare:createbasestring

# Now we want to remove the last player from the list and recurse,
# so we can add the next player
data remove storage baseshare:tmp Players[-1].Bases[-1]

# Only recurse if there's more players to add
execute unless data storage baseshare:tmp Players[-1].Bases[-1] run tellraw @s "\n"
execute if data storage baseshare:tmp Players[-1].Bases[-1] run function baseshare:bookaddbases
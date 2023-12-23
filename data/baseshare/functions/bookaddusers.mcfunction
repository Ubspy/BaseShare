# Initialize current entries per page as one (the user header counts as one)
scoreboard players set $entries TmpVal 1

# Add header to the page for this user
tellraw @s [{"text": "Player", "bold": true,"italic": true, "underlined": true, "color": "gold"}]

# Add all the bases from this user to the page(s)
function baseshare:bookaddbases

# Remove last player from the database
data remove storage baseshare:tmp Players[-1]

# Only recurse if there's more players to add
execute if data storage baseshare:tmp Players[-1] run function baseshare:bookaddusers
# Initialize current entries per page as one (the user header counts as one)
scoreboard players set $entries TmpVal 1

# Add header to the page for this user
data modify storage baseshare:tmp EntriesToAdd set value ['{"text": "Player\\\\n", "bold": true,"italic": true}']

# Add all the bases from this user to the page(s)
function baseshare:bookaddbases

# If there's any page left to be added, add it
execute if data storage baseshare:tmp PageToAdd[0] run data modify storage baseshare:tmp NewPages append from storage baseshare:tmp PageToAdd

# Increment the user index
scoreboard players add $userIndex TmpVal 1

# Only recurse if there's more players to add
execute if data storage baseshare:tmp Player[-1] run function baseshare:bookaddusers
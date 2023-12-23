# Initialize current entries per page as one (the user header counts as one)
scoreboard players set $entries TmpVal 1

# Add header to the page for this user
data modify storage baseshare:tmp EntriesToAdd set value ['{"text": "Player\\\\n", "bold": true,"italic": true}']

# Add all the bases from this user to the page(s)
function baseshare:bookaddbases

# Subtract one from entries before trying to see what the values is, because entries is always one ahead
scoreboard players remove $entries TmpVal 1

data modify storage baseshare:tmp EntiresFormatted set value {}

execute if score $entries TmpVal matches 0.. run data modify storage baseshare:tmp EntiresFormatted.0 set from storage baseshare:tmp EntriesToAdd[0]
execute if score $entries TmpVal matches ..-1 run data modify storage baseshare:tmp EntiresFormatted.0 set value ""

execute if score $entries TmpVal matches 1.. run data modify storage baseshare:tmp EntiresFormatted.1 set from storage baseshare:tmp EntriesToAdd[1]
execute if score $entries TmpVal matches ..0 run data modify storage baseshare:tmp EntiresFormatted.1 set value ""

execute if score $entries TmpVal matches 2.. run data modify storage baseshare:tmp EntiresFormatted.2 set from storage baseshare:tmp EntriesToAdd[2]
execute if score $entries TmpVal matches ..1 run data modify storage baseshare:tmp EntiresFormatted.2 set value ""

execute if score $entries TmpVal matches 3.. run data modify storage baseshare:tmp EntiresFormatted.3 set from storage baseshare:tmp EntriesToAdd[3]
execute if score $entries TmpVal matches ..2 run data modify storage baseshare:tmp EntiresFormatted.3 set value ""

data modify storage baseshare:tmp EntiresFormatted.4 set value ""

# If there's any page left to be added, add it
function baseshare:concatenatebasestring with storage baseshare:tmp EntiresFormatted

# Remove last player from the database
data remove storage baseshare:tmp Players[-1]

# Only recurse if there's more players to add
execute if data storage baseshare:tmp Players[-1] run function baseshare:bookaddusers
function baseshare:createbasestring with storage baseshare:tmp Players[-1].Bases[-1]

# Increment entries counter by 1
scoreboard players add $entries TmpVal 1

# If we are at 5, write the page and create a new one
data modify storage baseshare:tmp EntiresFormatted set value {}
data modify storage baseshare:tmp EntiresFormatted.0 set from storage baseshare:tmp EntriesToAdd[0]
data modify storage baseshare:tmp EntiresFormatted.1 set from storage baseshare:tmp EntriesToAdd[1]
data modify storage baseshare:tmp EntiresFormatted.2 set from storage baseshare:tmp EntriesToAdd[2]
data modify storage baseshare:tmp EntiresFormatted.3 set from storage baseshare:tmp EntriesToAdd[3]
data modify storage baseshare:tmp EntiresFormatted.4 set from storage baseshare:tmp EntriesToAdd[4]
execute if score $entries TmpVal matches 5.. run say hi
execute if score $entries TmpVal matches 5.. run function baseshare:concatenatebasestring with storage baseshare:tmp EntiresFormatted
#execute if score $entries TmpVal matches 5.. run data modify storage baseshare:tmp NewPages append from storage baseshare:tmp PageToAdd

# Wipe PageToAdd if we're at 5
execute if score $entries TmpVal matches 5.. run data modify storage baseshare:tmp EntriesToAdd set value ''

# Now we want to remove the last player from the list and recurse,
# so we can add the next player
data remove storage baseshare:tmp Players[-1].Bases[-1]

# Only recurse if there's more players to add
execute if score $entries TmpVal matches ..4 run execute if data storage baseshare:tmp Players[-1].Bases[-1] run function baseshare:bookaddbases
# Recursive search function
# Prereqs: baseshare:tmp NewBaseName needs to contain the string for the new base, and the correct bases array needs to be copied to baseshare:tmp Search, scoreboard TmpVal user $NotFound set to 1

# Copy the NewBaseName data to a temporary Compare register
data modify storage baseshare:tmp Compare set from storage baseshare:tmp NewBaseName

# Try to write the last element of the search array to this compare register, it will fail if they're the same string
execute store success score $NotFound TmpVal run data modify storage baseshare:tmp Compare set from storage baseshare:tmp Search[-1].Name

# If NotFound is 1, then the strings were different, if NotFound is 0, then they were the same, if they were different, remove the last element and try again
# Move the last element to the first, and recurse if the strings did not match
execute if score $NotFound TmpVal matches 1 run data modify storage baseshare:tmp Search insert 0 from storage baseshare:tmp Search[-1]
execute if score $NotFound TmpVal matches 1 run data remove storage baseshare:tmp Search[-1]
execute if score $NotFound TmpVal matches 1 run function baseshare:recursivesearch

# After: $NotFound at TmpVal will be 0 if the match was in fact found, otherwise it will remain 1
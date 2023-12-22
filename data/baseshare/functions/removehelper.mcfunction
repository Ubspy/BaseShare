# Sort players array so the one we want is at the last index
function baseshare:orderarray

# TODO: Get base name to remove and put it at baseshare:tmp NewBaseName
data modify storage baseshare:tmp Search set from storage baseshare:basesearch Players[-1].Bases

function baseshare:searchbases

execute if score $NotFound TmpVal matches 0 run function baseshare:orderbases

# Now Search in baseshare:tmp will have the base to delete as the last one, if we found the one to delete,
# do so and say so, if not throw error msg
execute if score $NotFound TmpVal matches 0 run data remove storage baseshare:bases Players[-1].Bases[-1]

# TODO: Make these better
execute if score $NotFound TmpVal matches 0 run tellraw @s "Deleted!"
execute if score $NotFound TmpVal matches 1 run tellraw @s "Not Found :("
# Okay hear me out: we can do one at a time and flip pages between players
# Simply have the player array copied to a new place, and hold the page count in a scoreboard, the remove the first element X amount of times
# Have the display-page command show the first player in the list
# Definitely doable, will benefit greatly from the mutex lock

# Align players
execute store result score $pageTmp TmpVal run scoreboard players get $atPage TmpVal
execute if score $printVal TmpVal matches 1 run function baseshare:print/alignplayers

execute if score $printVal TmpVal matches 1 run tellraw @s "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
execute if score $printVal TmpVal matches 1 run tellraw @s [{"text": "Player", "bold": true,"italic": true, "underlined": true, "color": "gold"}]
execute if score $printVal TmpVal matches 1 run scoreboard players add $printVal TmpVal 1

execute if score $printVal TmpVal matches ..7 run execute if data storage baseshare:tmp Players[-1].Bases[-1] run tellraw @s [{"storage": "baseshare:tmp", "nbt": "Players[-1].Bases[-1].BaseName", "bold": false, "italic": false, "color": "reset"}, {"text": ": ", "bold": false, "italic": false, "color": "reset"}, {"storage": "baseshare:tmp", "nbt": "Players[-1].Bases[-1].X", "bold": false, "italic": false, "color": "reset"}, {"text": ", "}, {"storage": "baseshare:tmp", "nbt": "Players[-1].Bases[-1].Z", "bold": false, "italic": false, "color": "reset"}]
execute if score $printVal TmpVal matches ..7 run execute unless data storage baseshare:tmp Players[-1].Bases[-1] run tellraw @s ""
execute if score $printVal TmpVal matches 8..9 run tellraw @s ""
scoreboard players add $printVal TmpVal 1

execute if score $printVal TmpVal matches 10 run tellraw @s "<-    ->"
execute if score $printVal TmpVal matches ..7 run data remove storage baseshare:tmp Players[-1].Bases[-1]
execute if score $printVal TmpVal matches ..9 run function baseshare:print/printpage
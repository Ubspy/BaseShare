# Since this is a beacon, we're going to set the base block as also a beacon, no tools will mine it faster,
# and it will have beacon sounds
setblock ~ ~ ~ beacon keep

# Summon an item display at this location to show our base beaon
summon item_display ~ ~ ~ {Tags:["baseshare.base_beacon", "baseshare.custom_block"], transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0.47f,0f],scale:[1.01f,1.01f,1.01f]}, item:{id:"minecraft:item_frame", Count:1b, tag:{CustomModelData: 6573895}}}
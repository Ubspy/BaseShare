advancement revoke @s only baseshare:used_beacon

execute as @e[tag=baseshare.base_beacon] run execute at @s run setblock ~ ~ ~ glass replace
execute as @e[tag=baseshare.base_beacon] run execute at @s run schedule function baseshare:blocks/base_beacon/replace_beacon 2t

function baseshare:printbases
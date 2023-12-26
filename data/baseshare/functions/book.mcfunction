data modify storage baseshare:tmp NewPages set value []

data modify storage baseshare:tmp Players set from storage baseshare:bases Players

scoreboard players set $printVal TmpVal 1

advancement revoke @s only baseshare:printthing

function baseshare:bookprintpage
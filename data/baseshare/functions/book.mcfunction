data modify storage baseshare:tmp NewPages set value []

data modify storage baseshare:tmp Players set from storage baseshare:bases Players

function baseshare:bookaddusers

give @p written_book{pages: [], title: "Shared Bases", author: "BaseShare"}

execute as @s run data modify entity @s Inventory[{tag: {author: "BaseShare", title: "Shared Bases"}}].tag.pages set from storage baseshare:tmp NewPages
execute if score $pageTmp TmpVal matches 1.. run data remove storage baseshare:tmp Players[-1]
execute if score $pageTmp TmpVal matches 1.. run scoreboard players remove $pageTmp TmpVal 1
execute if score $pageTmp TmpVal matches 1.. run function baseshare:print/alignplayers
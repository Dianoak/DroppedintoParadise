right = keyboard_check(ord("D"))
left = keyboard_check(ord("A"))

var move = right - left

hsp = move * walksp


x += hsp
y += vsp
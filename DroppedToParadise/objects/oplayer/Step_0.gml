//variables
right = keyboard_check(ord("D"))
left = keyboard_check(ord("A"))

//state checks
onground = place_meeting(x,y-1,owall)
onwall = place_meeting(x+1,y,owall) - place_meeting(x-1,y,owall)

//movement
var move = right - left

hsp = move * walksp

//gravity
if !onground
	{
		vsp += grv	
	}
	
//collision
if (place_meeting(x+hsp, y, owall))
{
	while (!place_meeting(x+sign(hsp), y, owall))
	{
		x += sign(hsp);	
	}
	hsp = 0;	
}
if place_meeting(x,y+vsp, owall)
{
	while !place_meeting(x,y+sign(vsp), owall)
	{
		y += sign(vsp);	
	}
	vsp = 0; 
}

//important change


x += hsp
y += vsp
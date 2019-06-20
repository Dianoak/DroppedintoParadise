//variables
right = keyboard_check(ord("D"))
left = keyboard_check(ord("A"))
sprint = keyboard_check(vk_shift)
crouch1 = keyboard_check(ord("C"))
crouch2 = keyboard_check(vk_control)
jump1 = keyboard_check_pressed(vk_space)
jump2 = keyboard_check_pressed(ord("W"))

//state checks
onground = place_meeting(x,y+1,owall)
onwall = place_meeting(x+1,y,owall) - place_meeting(x-1,y,owall)

//movement
var move = right - left

if !sprint
	{
		hsp = move * walksp	
	} else
		{
			hsp = move * sprintsp
		}

//crouch
if crouch1 || crouch2
	{
		sprite_index = splayercrouch
	} else
		{
			sprite_index = splayerstand	
		}

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

//jump
if onground
	{
		if jump1 || jump2
			{
				vsp = jumph
			}		
	}




x += hsp
y += vsp
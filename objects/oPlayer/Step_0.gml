/// @description Player Movement/Animation

#region Controller Support
if (hascontrol)
{
	//Player Input
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);

	//Keyboard Support for Player Movement
	if (key_left) || (key_right) || (key_jump)
	{
		controller = 0;
	}

	//Controller Support for Player Movement
	if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0, gp_axislh),0));
		key_right = max(gamepad_axis_value(0, gp_axislh),0);
		controller = 1;
	}

	//Controller Support for Player Jump
	if (gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}
}
else
{
	key_left = 0;
	key_right = 0;
	key_jump = 0;
}
#endregion

#region Movement Calculations
//Movement Calculation
//**Added gun kick to the movement speed**
var move = key_right - key_left;
horizontalSpeed = move * walkSpeed;
verticalSpeed = verticalSpeed + gravityWeight;

//Gun Kick force
/* Not working with animation code
horizontalSpeed = (move * walkSpeed) + gunkickx;
verticalSpeed = (verticalSpeed + gravityWeight) + gunkicky;
gunkickx = 0;
gunkicky = 0;
*/

//Footstep Animation Sounds
if (sprite_index = sPeppinoRun) 
{	
	if (rightfoot = false && (image_index > 1 && image_index < 3))
	{
		audio_sound_pitch(snStep,choose(.8,1,1.5,2));
		audio_play_sound(snStep,5,false);
		rightfoot = true;
		leftfoot = false;
		
		//Add Dust to footsteps
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
			{
				vsp = 0;
			}
		}
	}
	
	if(leftfoot = false && (image_index > 6 && image_index < 8))
	{
		audio_sound_pitch(snStep,choose(.8,1,1.5,2));
		audio_play_sound(snStep,5,false);
		leftfoot = true;
		rightfoot = false;
	}
}

//Jumping Calculation
canjump -= 1;
if (canjump > 0) && (key_jump)
{
	verticalSpeed = jumpHeight;
	audio_play_sound(snJump, 10, false);
	canjump = 0;
}
#endregion

#region Collisions
//Horizontal Collision
if (place_meeting(x + horizontalSpeed, y, oPhysicalObject))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, oPhysicalObject))
	{
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = 0;
}

x = x + horizontalSpeed;

//Vertical Collision
if (place_meeting(x, y + verticalSpeed, oPhysicalObject))
{
	while (!place_meeting(x, y + sign(verticalSpeed), oPhysicalObject))
	{
		y = y + sign(verticalSpeed);
	}
	verticalSpeed = 0;
}

y = y + verticalSpeed;
#endregion

#region Animation
//Animation
if (!place_meeting(x, y + 1, oPhysicalObject))
{
	image_speed = 1;
	show_debug_message(sign(verticalSpeed));
	if (sign(verticalSpeed) > 0)
	{
		sprite_index = sPeppinoFall;
	} else {
		sprite_index = sPeppinoJump;
		jumped = true;
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDustYellow))
			{
				vsp = 0;
			}
		}
	}
} else {
	canjump = 10;
	image_speed = 1;
	
	//Check if Player landed from Jumping
	if(jumped) 
	{
		repeat(5)
		{
			with (instance_create_layer(x, bbox_bottom, "Bullets", oDust))
			{
				vsp = 0;
			}
		}
		jumped = false;
	}
	
	//Check if Player is moving horizontal or idle
	if (horizontalSpeed == 0)
	{
		sprite_index = sPeppino;	
		rightfoot = false;
		leftfoot = false;
	} else {
		if(gunkickx > 0)
		{
			sprite_index = sPeppino;
		} else {
			sprite_index = sPeppinoRun;
		}
	}
}

if (horizontalSpeed != 0)
{
	image_xscale = sign(horizontalSpeed);	
}
#endregion

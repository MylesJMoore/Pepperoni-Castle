/// @description Enemy Movement/Animation
#region Physics
verticalSpeed = verticalSpeed + gravityWeight;
#endregion

#region Collision
//Horizontal Collision
if (place_meeting(x + horizontalSpeed, y, oPhysicalObject))
{
	while (!place_meeting(x + sign(horizontalSpeed), y, oPhysicalObject))
	{
		x = x + sign(horizontalSpeed);
	}
	horizontalSpeed = -horizontalSpeed;
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
	if (sign(verticalSpeed) > 0)
	{
		sprite_index = enemyFallSprite;
	} else {
		sprite_index = enemyJumpSprite;
	}
} else {
	image_speed = 1;
	if (horizontalSpeed == 0)
	{
		sprite_index = enemyIdleSprite;	
	} else {
		sprite_index = enemyRunSprite;
	}
}

if (horizontalSpeed != 0)
{
	image_xscale = sign(horizontalSpeed) * size;	
	image_yscale = size;
}
#endregion






	
	
	
	
/// @description Player Dead Physics
if (done == 0)
{
	verticalSpeed = verticalSpeed + gravityWeight;

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
		if (verticalSpeed > 0)
		{
			done = 1;
			image_index = 1;
			alarm[0] = 60;
		}
		
		while (!place_meeting(x, y + sign(verticalSpeed), oPhysicalObject))
		{
			y = y + sign(verticalSpeed);
		}
		verticalSpeed = 0;
	}

	y = y + verticalSpeed;
}
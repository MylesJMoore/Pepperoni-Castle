/// @description Bullet Enemy Collision

//Move bullet, then check for collision
x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

if(place_meeting(x, y, pShootable))
{
	with (instance_place(x, y, pShootable))
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}

if (place_meeting(x, y, oWall) && (image_index != 0))
{
	while (place_meeting(x, y, oWall))
	{
		x -= lengthdir_x(.5, direction);
		y -= lengthdir_y(.5, direction);
	}
	spd = 0;
	instance_change(oHitSpark, true);
}
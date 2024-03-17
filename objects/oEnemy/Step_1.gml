/// @description Enemy Dead Physics
if (hp <= 0)
{
	with(instance_create_layer(x, y, layer, enemyDeadObject))
	{
		direction = other.hitfrom;
		horizontalSpeed = lengthdir_x(3, direction);
		verticalSpeed = lengthdir_y(3, direction) - 4;
		if ( sign(horizontalSpeed) != 0)
		{
			image_xscale = sign(horizontalSpeed) * other.size;
			image_yscale = other.size;
		}
	}
	
	with (mygun)
	{
		if (instance_exists(oPlayer))
		{
			global.kills++;
			global.killsthisroom++;
			with (oGame) 
			{
				killtextscale = 2;
			}
		}
		instance_destroy();
	}
	instance_destroy();
}

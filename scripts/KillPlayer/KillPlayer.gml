// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function KillPlayer(){
	/// @description Player Death

	with (oGun) 
	{
		instance_destroy();
	}

	instance_change(oPlayerDead, true);

	direction = point_direction(other.x, other.y, x, y);
	horizontalSpeed = lengthdir_x(6, direction);
	verticalSpeed = lengthdir_y(4, direction) - 2;

	if(sign(horizontalSpeed) != 0)
	{
		image_xscale = sign(horizontalSpeed);
	}
	
	global.kills -= global.killsthisroom;
}
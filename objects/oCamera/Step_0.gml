/// @description Camera Movement

//Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
	
	if((follow).object_index == oPlayerDead)
	{
		x = xTo;
		y = yTo;
	}
}

//Update object position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

//Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

//Update camera view
camera_set_view_pos(camera, x - view_w_half, y - view_h_half);

//Parallax
if (room != rMenu && room != rEnding)
{
	if (layer_exists("Factory"))
	{
		layer_x("Factory", x)
	}

	if (layer_exists("FactoryPipes"))
	{
		layer_x("FactoryPipes", x/4)
	}
}

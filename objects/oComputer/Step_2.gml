if(instance_exists(oPlayer))
{
	if ((point_in_circle(oPlayer.x, oPlayer.y, x, y, 64)) && (!instance_exists(oText)) && (gamepad_button_check_pressed(0,gp_face4)))
	{
		with (instance_create_layer(x, y - 64, layer, oText))
		{
			text = other.text;
			length = string_length(text);
		}
	
		with (oCamera)
		{
			//follow = other.id;
		}
	}
}
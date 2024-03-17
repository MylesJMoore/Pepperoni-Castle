/// @description Create Wall

mywall = instance_create_layer(x, y, layer, oWall);
with(mywall) 
{
	image_xscale = other.sprite_width / sprite_width;
	image_yscale = other.sprite_height / sprite_height;
	
	//Make a modification because of sprite size
	if(image_xscale > 1) 
	{
		image_xscale = 2;
	}
	
	if(image_yscale > 1) 
	{
		image_yscale = 2;
	}
}
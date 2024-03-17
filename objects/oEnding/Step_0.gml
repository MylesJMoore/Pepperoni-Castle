//Can move the player/layer/anything in here during the ending if I want

//Progress Text
letters += spd;
text = string_copy(endtext[currentline],1, floor(letters));

//Next Line
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	if ((currentline + 1) == array_length(endtext))
	{
		SlideTransition(TRANS_MODE.RESTART);
	}
	else 
	{
		currentline++;
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}

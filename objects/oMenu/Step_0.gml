/// @description Control Menu

//Item Ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard + Controller Controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items)
		{
			menu_cursor = 0;
		}
		audio_play_sound(snMenuMove, 5, false);
	}
	
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
	{
		menu_cursor--;
		if (menu_cursor < 0)
		{
			menu_cursor = menu_items - 1;
		}
		audio_play_sound(snMenuMove, 5, false);
	}
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("S")) || (gamepad_button_check_pressed(0,gp_face1)))
	{
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		switch (menu_committed)
		{
			case 2: default: ScreenShake(10, 60); break;
			case 1: default: ScreenShake(8, 60); break;
			case 0: ScreenShake(4, 60); break;
		}
		menu_control = false;
		audio_play_sound(snMenuSelect, 10, false);
	}
	
	//Controller Support
	var controller_up = abs(min(gamepad_axis_value(0, gp_axislv),0));
	var controller_down = max(gamepad_axis_value(0, gp_axislv),0);
	if (controller_up > 0.9 && controller_control == true)
	{
		menu_cursor++;
		if (menu_cursor >= menu_items)
		{
			menu_cursor = 0;
		}
		audio_play_sound(snMenuMove, 5, false);
		controller_control = false;
	}
	
	if (controller_down > 0.9 && controller_control == true)
	{
		menu_cursor--;
		if (menu_cursor < 0)
		{
			menu_cursor = menu_items - 1;
		}
		audio_play_sound(snMenuMove, 5, false);
		controller_control = false;
	}
	
	if (controller_up < 0.3 && controller_down < 0.3)
	{
		controller_control = true;
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5); 
	}
}

if (menu_x > gui_width + 150) && (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 2: default: SlideTransition(TRANS_MODE.NEXT); break;
		case 1:
		{
			if (!file_exists(SAVEFILE))
			{
				SlideTransition(TRANS_MODE.NEXT);
			}
			else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				global.kills = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO, target);
			}
		}
		break;
		case 0: game_end(); break;
	}
}
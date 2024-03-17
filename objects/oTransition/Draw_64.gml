/// @description Draw Black Bars

if (mode != TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0, 0, gui_width, percent * half_gui_height, false);
	draw_rectangle(0, gui_height, gui_width, gui_height - (percent * half_gui_height), false);
}

draw_set_color(c_white);
//draw_text(50, 50, string(percent));
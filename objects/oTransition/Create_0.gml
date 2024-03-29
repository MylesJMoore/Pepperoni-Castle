/// @description Size Variables & Mode Setup

gui_width = display_get_gui_width()
gui_height = display_get_gui_height()
half_gui_height = gui_height * 0.5;

enum TRANS_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
};
mode = TRANS_MODE.INTRO;
percent = 1;
target = room;
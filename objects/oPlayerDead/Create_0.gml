/// @description Player Dead Setup
horizontalSpeed = 0;
verticalSpeed = 0;
gravityWeight = 1.2;
done = 0;
image_speed = 0;
image_index = 0;

ScreenShake(6,60);
//audio_sound_pitch(snPlayerDeath,.85);
audio_play_sound(snPlayerDeath, 10, false);
game_set_speed(30, gamespeed_fps);

with (oCamera) 
{
	follow = other.id;
}
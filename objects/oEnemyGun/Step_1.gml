x = owner.x;
y = owner.y + 10;

//Scales the gun based on the enemy
image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

//Check if player exists
if ( instance_exists(oPlayer))
{
	//Check if player is to the left
	if (oPlayer.x < x)
	{
		image_yscale = -image_yscale;
	}
	
	//Check distance from player then begin countdown for shooting
	if (point_distance(oPlayer.x, oPlayer.y, x, y) < 600)
	{
		image_angle = point_direction(x, y, oPlayer.x, oPlayer.y);
		countdown--;
		if (countdown <= 0)
		{
			//Reset Countdown
			countdown = countdownrate;
			
			//Check if Player is in line of sight and oWall is not in line of sight either
			if (!collision_line(x, y, oPlayer.x, oPlayer.y, oWall, false, false))
			{
				//Creates Enemy Bullet with Sound/Pitch
				audio_sound_pitch(snStep,choose(.7,1,1.3));
				audio_play_sound(snShot, 5, false);
				with (instance_create_layer(x, y, "Bullets", oEnemyBullet))
				{
					spd = 10;
					direction = other.image_angle + random_range(-3, 3);
					image_angle = direction;
				}
			}
		}
	}
}
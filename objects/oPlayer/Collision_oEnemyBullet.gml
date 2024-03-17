if(!invincible)
{
	KillPlayer();
	with (other) {
		instance_destroy();
	}
}

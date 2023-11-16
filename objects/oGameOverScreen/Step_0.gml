shootKey = global.shootKey;

alpha += alphaSpd;
alpha = clamp(alpha,0,1);

if shootKey && alpha >= 1
{
	room_restart();
}
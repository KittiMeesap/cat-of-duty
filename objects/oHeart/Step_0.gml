floatDir += floatSpd;
y = ystart + dsin(floatDir) * 1;

if place_meeting(x,y,oPlayer)
{
	oPlayer.hp += heal;
	
	instance_destroy();
}
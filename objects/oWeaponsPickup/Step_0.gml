floatDir += floatSpd;
y = ystart + dsin(floatDir) * 1;

var _size = array_length(global.PlayerWeapons);
for (var i = 0; i < _size; i++;)
{
	if	weapon == global.PlayerWeapons[i]
	{
		instance_destroy();
		exit;
	}
}

if place_meeting(x,y,oPlayer)
{
	array_push(global.PlayerWeapons,weapon);
	
	oPlayer.selectedWeapon = array_length(global.PlayerWeapons) - 1;
	
	instance_destroy();
}
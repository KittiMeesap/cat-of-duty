	get_damaged_create(20,true);
	
	moveDir = 0;
	moveSpd = 2;
	xspd = 0;
	yspd = 0;

	centerYOffset = -5;
	centerY = y +centerYOffset;

	weaponOffsetDist = 4;
	aimDir = 0;

	face = 3;
	sprite[0] = sPlayerRight;
	sprite[1] = sPlayerUp;
	sprite[2] = sPlayerLeft;
	sprite[3] = sPlayerDown;

	shootTimer = 0;
	
	array_push( global.PlayerWeapons,global.WeaponList.Pistol);
	selectedWeapon = 0;
	weapon = global.PlayerWeapons[selectedWeapon];
























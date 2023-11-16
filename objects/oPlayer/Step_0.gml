rightKey = global.rightKey;
leftKey = global.leftKey;
upKey = global.upKey;
downKey = global.downKey;
shootKey = global.shootKey;
swapKeyPressed = global.swapKeyPressed;
starKeyPressed = global.stertKeyPressed;


//pause menu
if starKeyPressed
{
	if !instance_exists(oPauseMenu)
	{
		instance_create_depth(0, 0, 0, oPauseMenu);
	}else {
		instance_destroy(oPauseMenu);
	}
}


//pause self
if screen_pause() {exit;};

//Control
#region
	var _horizonKey = rightKey - leftKey;
	var _vertKey = downKey - upKey;
	moveDir = point_direction(0,0,_horizonKey,_vertKey);

	var _spd = 0;
	var _inputLevel = point_distance(0,0,_horizonKey,_vertKey);
	_inputLevel = clamp(_inputLevel,0,1);
	_spd = moveSpd * _inputLevel;

	xspd = lengthdir_x(_spd,moveDir);
	yspd = lengthdir_y(_spd,moveDir);

	if place_meeting(x + xspd,y,oWall)
	{
		xspd = 0;
	}
	if place_meeting(x,y +yspd, oWall)
	{
		yspd = 0;
	}

	x += xspd;
	y += yspd;

	depth = -bbox_bottom;

#endregion

if get_damaged(oDamagePlayer,true)
{
   //screen_pause 
   create_screen_pause(25);
   
   //shake the screen
   screen_shake(6);
}

//Animation
#region

	centerY = y + centerYOffset;
	aimDir = point_direction(x, centerY,mouse_x,mouse_y);

	face = round(aimDir/90);
	if face == 4 { face = 0; };

	if xspd == 0 && yspd == 0
	{
		image_index = 0;
	}
	mask_index = sprite[3];
	sprite_index = sprite[face];
#endregion

//Swap
#region
var _playerWeapons = global.PlayerWeapons;

if swapKeyPressed
{
	selectedWeapon++;
	if selectedWeapon >= array_length(_playerWeapons) {selectedWeapon = 0;}
	
}
weapon = _playerWeapons[selectedWeapon];

#endregion

//shootweapons
if shootTimer > 0 {shootTimer --; }
if shootKey && shootTimer <= 0
{
	shootTimer = weapon.cooldown;
	
	//screen shake
	screen_shake(2);
	
	
	var _xOffset = lengthdir_x( weapon.lenght + weaponOffsetDist,aimDir);
	var _yOffset = lengthdir_y( weapon.lenght + weaponOffsetDist,aimDir);
	
	var _spread = weapon.spread;
	var _spreadDiv = _spread / max( weapon.bulletNum-1,1);
	
	for (var i = 0; i < weapon.bulletNum; i++)
	{
		var _bulletInst =  instance_create_depth(x + _xOffset,centerY + _yOffset,depth-100,weapon.bulletObj);
		
		with (_bulletInst)
		{
			dir = other.aimDir - _spread/2 + _spreadDiv*i;
		}
	}
}



//death
if hp <= 0
{
	instance_create_depth(0,0,-10000,oGameOverScreen);
	
	create_animated_vfx(sSmallBoom,x,y,depth);
	
	instance_destroy();
}
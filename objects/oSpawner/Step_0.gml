	timer++;
	
	if instance_number(oEnemyParent) >=global.activeEnemyMax || global.totalEnemiesSpawned >= global.enemyRoomMax
	{
		timer = 0;
	}

	if timer >= spawnTime && !place_meeting(x,y,oDogs)
	{
	
	var _inst =	instance_create_depth(x,y,depth-1,oDogs);
	with(_inst)
	{
		image_alpha = 0;
		state = -1;
	}
	
		timer = 0;
	}
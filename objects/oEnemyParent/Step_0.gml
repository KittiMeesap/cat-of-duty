get_damaged(oDamageEnemy);


	if hp <= 0
	{
		global.enemyKIllCount++;
		
		
		if global.enemyKIllCount mod 30 == 0
		{
			instance_create_depth(x,y,depth,oHeart);
		}
		
		instance_create_depth(x,y,depth,oSmallBoom);
		
		instance_destroy();
	}
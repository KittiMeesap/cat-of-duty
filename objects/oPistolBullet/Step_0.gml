//pause self
if screen_pause() {exit;};

	
	//move
	xspd = lengthdir_x(spd , dir);
	yspd = lengthdir_y(spd,dir);

	x += xspd;
	y += yspd;
	
	//depth
	depth = -y;

	if hitConfirm == true && enemyDestroy = true {destroy = true};
	
	if destroy == true {instance_destroy();};

	if place_meeting(x,y, oSoildWall) {destroy = true;};

	if point_distance(xstart,ystart,x,y) > maxDist {destroy = true;};

	
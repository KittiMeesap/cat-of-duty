//pause self
if screen_pause() {exit;};

//coed coommands
var _wallcollisions = true;
var _getDamage = true;
	
	switch(state)
	{
		
		case -1:
			if image_alpha < 1
			{
				
				image_alpha += fadeSpd;
			}
			
			_wallcollisions = false;
			_getDamage = false;
			
			if image_alpha >=1
			{
				spd = emergeSpd;
				dir = 270;
			}
			
			if !place_meeting(x,y,oWall)
			{
				state = 0;
			}
			
		break;
		
		case 0:
		#region
				if instance_exists(oPlayer)
				{
					dir = point_direction(x,y,oPlayer.x,oPlayer.y);
				}
				
				spd = chaseSpd;
				
				var _camLeft = camera_get_view_x(view_camera[0]);
				var _camRight = _camLeft + camera_get_view_width(view_camera[0]);
				var _camTop = camera_get_view_y(view_camera[0]);
				var _camBottom = _camTop + camera_get_view_height(view_camera[0]);
				
				
				if bbox_right > _camLeft && bbox_left < _camRight && bbox_bottom > _camTop && bbox_top < _camBottom
				{
					shootTimer++;
				}
				
				if shootTimer > cooldownTime
				{
					state = 1;
					
					shootTimer = 0;
				}
				
				#endregion
				
		break;
		
		
		case 1:
		#region
				if instance_exists(oPlayer)
				{
					dir = point_direction(x,y,oPlayer.x,oPlayer.y);
				}
				
				spd = 0;
				
				image_index = 0;
				
				shootTimer++;
				
				if shootTimer == 1 
				{
					bulletInst = instance_create_depth(x + bulletXoff*face,y + bulletYoff,depth,oEnemyBullet);
				}
				
				if shootTimer <= windupTime && instance_exists(bulletInst)
				{
					bulletInst.x = x + bulletXoff*face;
					bulletInst.y = y + bulletYoff;
				}
				
				if shootTimer == windupTime && instance_exists(bulletInst)
				{
					bulletInst.state = 1;
				}
				
				if shootTimer > windupTime + recoverTime
				{
					state = 0;
					
					shootTimer = 0;
				}
				
				#endregion
		break;
		
	}
	
	


	xspd = lengthdir_x(spd,dir);
	yspd = lengthdir_y(spd,dir);
	
	if dir > 90 && dir < 270
	{
		face = -1;
	}else {
		face = 1;
	}
	
//wall
	if _wallcollisions == true
	{
		if place_meeting(x + xspd ,y,oWall) {xspd = 0;}
		if place_meeting(x,y + yspd,oWall) {yspd = 0;}
	}
//enemy
		if place_meeting(x + xspd ,y,oEnemyParent) {xspd = 0;}
		if place_meeting(x,y + yspd,oEnemyParent) {yspd = 0;}
	

	x += xspd;
	y += yspd;
	
	depth = -y;

if _getDamage == true
{
	event_inherited();
}


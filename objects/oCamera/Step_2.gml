var _camW = camera_get_view_width(view_camera[0]);
var _camH = camera_get_view_height(view_camera[0]);

if instance_exists(oPlayer)
{
	x = oPlayer.x - _camW/2;
	y = oPlayer.centerY - _camH/2;
}



//camara shaking
    //x shake
	if xShakeAmont > 0 
	{
	     xShakeDir += xShakeDirspd;
		 xShakeAmont -= xShakeAmontspd;
	} else {
	    xShakeAmont = 0;
		xShakeDir = 0;
	}
	xShake = dsin ( xShakeDir ) * xShakeAmont;
	
	//y Shake
	if yShakeAmont > 0 
	{
	     yShakeDir += yShakeDirspd;
		 yShakeAmont -= yShakeAmontspd;
	} else {
	    yShakeAmont = 0;
		yShakeDir = 0;
	}
	yShake = dsin ( yShakeDir ) * yShakeAmont;
	
	//add in the camera shake
x += xShake;
y += yShake;


x = clamp(x,0,room_width - _camW);
y = clamp(y,0,room_height - _camH);

camera_set_view_pos(view_camera[0],x,y);
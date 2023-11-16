get_damaged(oDamageParent);

var _healthPercent =  1 - (hp/maxHp);
image_index = _healthPercent * image_number;

if hp <= 0
{
	var _boomInst =  instance_create_depth(x+8,y+8, -3000,oBigBoom);
	
	with (_boomInst)
	{
		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	//screen pause
	instance_create_depth(0, 0, 0, oScreenPauseTimed);
	
	instance_destroy();
}
get_damaged(oDamageParent);

var _healthPercentage = 1 - (hp/maxHp);
image_index = _healthPercentage * (image_number);

if hp <= 0
{
	create_animated_vfx(sSmallBoom,x + 8,y+16,depth);
	
	instance_destroy();
}
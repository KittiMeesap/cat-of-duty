get_damaged(oDamageParent);

var _healthPercentage = 1 - (hp/maxHp);
image_index = _healthPercentage * (image_number);

if hp <= 0
{
	instance_create_depth(x+8,y+16,depth,oSmallBoom);
	
	instance_destroy();
}
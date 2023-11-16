if createdDamageObjects == false
{
	damageInst = instance_create_depth(x,y,0,oDamageAll);
	with(damageInst)
	{
		damge = other.damage;
		mask_index = other.sprite_index;
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	
	createdDamageObjects = true;
	
}

if floor(image_index) > 1
{
	if instance_exists(damageInst)
	{
		instance_destroy(damageInst);
	}
}
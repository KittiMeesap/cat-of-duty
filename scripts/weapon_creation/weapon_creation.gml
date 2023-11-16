function create_weapons(_sprite = sDessertCanon, _weaponlenght = 0,_bulletObj = oDessertBullet, _cooldown = 1,_bulletNum = 1, _spread = 0, _pickupSprite = sPistolPickup) constructor
{
	sprite = _sprite;
	lenght = _weaponlenght;
	bulletObj = _bulletObj;
	cooldown = _cooldown;
	bulletNum = _bulletNum;
	spread = _spread;
	pickupSprite = _pickupSprite;
	
}

global.PlayerWeapons = array_create(0);

global.WeaponList = {
	
	Pistol : new create_weapons(
	sPistol,
	sprite_get_bbox_right(sPistol) - sprite_get_xoffset(sPistol),
	oPistolBullet,
	9,
	1,
	0,
	sPistolPickup
	),
	
	AR : new create_weapons(
	sAR,
	sprite_get_bbox_right(sAR) - sprite_get_xoffset(sAR),
	oARBullet,
	3,
	1,
	0,
	sARPickUp
	),
	
	Shotgun : new create_weapons(
	sShotgun,
	sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),
	oShotgunBullet,
	16,
	7,
	80,
	sShotgunPickUp
	),

}

	
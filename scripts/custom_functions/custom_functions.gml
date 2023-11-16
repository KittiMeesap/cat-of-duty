function draw_my_weapon()


{
	var _xOffset = lengthdir_x(weaponOffsetDist, aimDir);
	var _yOffset = lengthdir_y(weaponOffsetDist, aimDir);


	var _weaponYsc1 = 1;

	if aimDir > 90 && aimDir < 270
	{
		_weaponYsc1 = -1;
	}
	draw_sprite_ext(weapon.sprite, 0 ,x + _xOffset, centerY + _yOffset, 1 ,_weaponYsc1 , aimDir ,c_white,image_alpha)
}

//vfx
function screen_pause()
  {
	  
	//pause self
    if instance_exists(oScreenPause)
    {
	   image_speed = 0;
	   
	   return true; 
	   
    } else {
	   image_speed = 1;
	   
	   return false;
    } 
	
  }
function create_screen_pause(_time = 3)
{
  	with( instance_create_depth(0, 0, 0, oScreenPauseTimed ) )
	{
	  timer = _time; 
	}
  
}
function screen_shake(_amont = 4 )
{
    with(oCamera)
	{
	    xShakeAmont = _amont;
		yShakeAmont = _amont;
	}
}
function create_animated_vfx(_sprite,_x,_y,_depth)
{
	with(instance_create_depth(_x,_y,_depth,oAnimatedVFX))
	{
		sprite_index = _sprite;
	}
}

function get_damaged_create(_hp = 10, _iframes = false)
{
	maxHp = _hp;
	hp = _hp;
	
	if _iframes == true
	{
		ifamesTimer = 0;
		ifamesNumber = 90;
	}
	
	if _iframes == false
	{
		damageList = ds_list_create();
	}
}

function get_damaged_cleanup()
{
	ds_list_destroy(damageList);
}

function get_damaged( _damageObj, _iframes = false)
{
	if _iframes == true && ifamesTimer > 0
	{
		ifamesTimer--;
		
		if  ifamesTimer mod 4 == 0
		{
			if image_alpha == 1
			{
				image_alpha = 0;
			} else {
				image_alpha = 1;
		
			}
		}
		
		hp = clamp(hp,0,maxHp);
		
		//exit by returning the function false
		return false;
	}
	
	if _iframes == true
	{
		image_alpha = 1;
	}
	
	    var _hitConfirm = false;
		if place_meeting(x,y,_damageObj) || (_damageObj != oDamageParent && place_meeting(x,y,oDamageAll))
		{
			var _instList = ds_list_create();
			instance_place_list(x,y,_damageObj,_instList,false);
			
			if _damageObj != oDamageParent 
			{
			instance_place_list(x,y,oDamageAll,_instList,false);
			}
		
			var _listSize = ds_list_size(_instList);
			
			var _hitConfirm = false;
		
			for (var i = 0; i < _listSize; i++)
			{
				var _inst = ds_list_find_value(_instList,i);
			
					if _iframes == true || ds_list_find_index(damageList,_inst ) == -1
					{
						if _iframes == false
						{
							ds_list_add(damageList,_inst);
						}
					
						hp -= _inst.damage;
						_hitConfirm = true;
					
						_inst.hitConfirm = true;
					}
			}
			
			if _iframes == true && _hitConfirm == true
			{
				ifamesTimer = ifamesNumber;
			}
			
			ds_list_destroy(_instList);
	
		}

		if _iframes == false
		{
			var _damageListSize = ds_list_size(damageList);
			for (var i = 0;i < _damageListSize; i++)
			{
				var _inst = ds_list_find_value(damageList,i);
				if !instance_exists(_inst) || !place_meeting(x,y,_inst)
				{
					ds_list_delete(damageList,i);
					i--;
					_damageListSize--;
				}
			}
		}
		
		hp = clamp(hp,0,maxHp);
		
		//return hit confinrm variable value
		return _hitConfirm;
}
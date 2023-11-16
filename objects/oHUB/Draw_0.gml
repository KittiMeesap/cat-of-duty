var _camX = camera_get_view_x(view_camera[0]);
var _camY = camera_get_view_y(view_camera[0]);

var _border = 8;
var _hudX = _camX + _border;
var _hudY = _camY + _border;

if instance_exists(oPlayer)
{
	draw_sprite(sHealthbar,0,_camX + _border,_camY + _border);

	for(var i = 0; i < playerMaxHp; i++)
	{
		var  _img = 1;
		if i+1 <= playerHp {_img = 2;};
	
		var _sep = 3;
		draw_sprite(sHealthbar,_img,_hudX + _sep*i, _hudY);
	}
}

var _enemyCountOffset = 24 ;
var _ecHudX = _hudX;
var _echudY = _hudY + _enemyCountOffset;

draw_sprite(sEnemyCountHUB,0,_ecHudX,_echudY);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fAI);

draw_text(_ecHudX + 22,_echudY + 5,string(global.enemyKIllCount));

draw_text(_ecHudX + 44 , _echudY + 5, "/" + string(global.enemyRoomMax));
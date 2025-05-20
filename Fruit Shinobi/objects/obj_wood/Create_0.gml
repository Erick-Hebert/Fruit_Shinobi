/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

sprites = [spr_wood_idle, spr_wood_run, spr_wood_dmg, spr_wood_attack];

state_attack = function() {
	check_img(3);
	img_spd = 10 / game_get_speed(gamespeed_fps);
	hspd = 0;
	if (shoot_timer <= 0 and img_ind >= sprite_get_number(spr_wood_attack)-2) {
		var _shoot = instance_create_layer(x + sprite_width/5 * -xscale, y - sprite_height/2 + sprite_height/3, "Enemies", obj_shoot);
		_shoot.hspeed = 7 * -xscale;
		shoot_timer = game_get_speed(gamespeed_fps);
	}
}

ret_collision = function() {
	
	var _border = 32;
	var _dist = 100;
	
	var _shoot = collision_rectangle(x + _border * -xscale, y - _border, x + (_border + _dist)  * -xscale, y, obj_player, 1, 0);	
	if (_shoot and state != state_attack and state != state_dmg) {
		shooted = 1;
		state = state_attack;	
	} else {
		if (state = state_attack and img_ind + img_spd >= img_numb and !_shoot) state = state_idle;	
	}
}

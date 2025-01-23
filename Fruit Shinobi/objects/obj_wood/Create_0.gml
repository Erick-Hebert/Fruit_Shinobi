/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

// Inherit the parent event
event_inherited();

sprites = [spr_wood_idle, spr_wood_run, spr_wood_dmg, spr_wood_attack];


state_attack = function() {
	check_img(3);
	img_spd = 10 / game_get_speed(gamespeed_fps);
	hspd = 0;
	if (shoot_timer <= 0) {
		var _shoot = instance_create_layer(x + sprite_width/5 * -xscale, y - sprite_height/5, "Enemies", obj_shoot);
		_shoot.hspeed = 7 * -xscale;
		shoot_timer = game_get_speed(gamespeed_fps);
	}
}

ret_collision = function() {
	var _shoot = collision_rectangle(x, y - sprite_height, room_width * -xscale, y, obj_player, 1, 0);	
	if (_shoot and state != state_attack) {
		state = state_attack;	
	} else {
		if (state = state_attack and img_ind + img_spd >= img_numb and !_shoot) state = state_idle;	
	}
}

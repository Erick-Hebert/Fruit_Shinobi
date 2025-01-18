/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

vspd		= 0;

hit_timer   = 3 * game_get_speed(gamespeed_fps);
y_start		= ystart

img_numb	= 0;
img_ind		= 0;
img_spd		= 12 / game_get_speed(gamespeed_fps);
sprite		= sprite_index;
sprites		= [spr_spike_head_idle, spr_spike_head_blink, spr_spike_head_hit];

state_idle = function() {
	vspd = 0;	
	check_img(0);
	
	if (y > y_start) {
		vspd = -1.5;
	}
	
	if (y == y_start and hit_timer <= 0) state = state_attack;
}

state_attack = function() {
	vspd = 8;	
	
	check_img(1);
		
	var _floor = instance_place(x, y + 1, obj_wall);
	
	if (_floor and hit_timer <= 0) {
		state = state_hit;
		hit_timer = 3 * game_get_speed(gamespeed_fps)
	}
}

state_hit = function() {
	check_img(2);
	
	if (img_ind + img_spd >= img_numb) {
		state = state_idle;
	}	
}


state = state_idle;

/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

vspd		= 0;
max_vspd	= 2;
hspd		= 0;
max_hspd	= 2;
grav		= .5;

life		= 2;
dmg			= false;
dmg_timer	= 0;

sprite		= sprite_index;
alpha		= image_alpha;
img_numb	= 0;
img_ind		= 0;
img_spd		= 12 / game_get_speed(gamespeed_fps);
xscale		= image_xscale;
sprites		= [spr_mush_idle, spr_mush_run, spr_mush_dmg];

state_idle = function() {
	check_img(0)
	spd = 0;	
}

state_dmg = function() {	
	check_img(2)
	
	if (img_ind + img_spd >= img_numb) {
		state = state_idle;
	}
	
	if (dmg and dmg_timer <= 0 and life > 0) {
		dmg			= false;
		dmg_timer	= game_get_speed(gamespeed_fps) / 2;
		life--;	
	}
	
}



state = state_idle;
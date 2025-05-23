/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//wood timer
shoot_timer = game_get_speed(gamespeed_fps);
shooted = false;

//bee collision 
x_start = xstart;
y_start = ystart;

//mov
vspd		= 0;
max_hspd	= -1;
hspd		= max_hspd;
grav		= .5;

//dmg and life
life		= 2;
dmg			= false;
dmg_timer	= 0;
timer		= game_get_speed(gamespeed_fps) * .2

//sprites
sprite		= sprite_index;
alpha		= image_alpha;
img_numb	= 0;
img_ind		= 0;
img_spd		= 10 / game_get_speed(gamespeed_fps);
xscale		= image_xscale;
sprites		= [spr_mush_idle, spr_mush_run, spr_mush_dmg];

state_idle = function() {
	check_img(0)
	shooted = 0;
	hspd = 0	
	if(img_ind + img_spd >= img_numb) state = state_run;	
}

state_dmg = function() {	
	check_img(2)
	
	if (img_ind + img_spd >= img_numb) {
		state = state_idle;
	}
	
	if (dmg and dmg_timer <= 0 and life > 0) {
		dmg			= false;
		dmg_timer	= timer;
		life--;	
	}
	
}

state_run = function() {
	check_img(1);
	hspd = max_hspd * xscale;
}

e_collision = function() {	 
	
	repeat(abs(hspd)) {			
		var _hspd = sign(hspd);	
		if (place_meeting(x + _hspd, y, obj_wall) or !place_meeting(x + _hspd * (sprite_width/2), y + 1, obj_wall)) {				
			state = state_idle;
			xscale = -xscale;
		} else {
			x += _hspd * .5
		}	
	}

	repeat(abs(vspd)) {	
		var _vspd = sign(vspd);	
		if (place_meeting(x, y + _vspd, obj_wall)) {
			vspd = 0;	
		} else {
			y += _vspd;
		}
	}	
}

state = state_idle;
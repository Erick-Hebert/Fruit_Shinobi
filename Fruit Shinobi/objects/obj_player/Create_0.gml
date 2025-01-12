/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

vspd		= 0;
hspd		= 0;
max_vspd	= 7; 
max_hspd	= 3;
jump_qt		= 2;

grav		= .5;

life		= 2;

xscale		= image_xscale;
face		= 0;
sprite		= sprite_index;

sprites		= [[spr_player_idle], [spr_player_run], [spr_player_jump], [spr_player_down], [spr_player_jump_double]]


p_mov = function() {	
	var _floor	= place_meeting(x, y + 1, obj_wall);
	
	var _right	= keyboard_check(vk_right);
	var _left	= keyboard_check(vk_left);
	var _jump	= keyboard_check_pressed(vk_up);
		
    // Controle de sprite
    if (_right) {face = 0;xscale = 1;sprite = sprites[1][0];}
    if (_jump) {face = 1; sprite = sprites[2][0];}
    if (_left) {face = 2;xscale = -1;sprite = sprites[1][0];}
    
    if (!_right && !_jump && !_left && _floor) {
        sprite = sprites[0][0]; 
    }
	
	hspd = (_right - _left) * max_hspd;
	
	if (!_floor) {
		vspd += grav;
		if (vspd > 0){
			sprite = sprites[3][0];
		} else{
			if (jump_qt == 1) {   
				sprite = sprites[2][0];	
			} else {
				sprite = sprites[4][0]	
			}
		}		
	} else {		
		jump_qt = 2;
	}
	
	if (_jump and jump_qt > 0) {
		jump_qt--;
		vspd = -max_vspd	
	}
	
	vspd = clamp(vspd, -max_vspd, max_vspd)
}


p_collision = function() {	
	//horizontal colission
	repeat(abs(hspd)) {
		var _hspd = sign(hspd);
	
	
		if (place_meeting(x + _hspd, y, obj_wall)) {
			hspd = 0;
		} else {
			x += _hspd;
		}
	
	}

	//vertical collision
	repeat(abs(vspd)) {
		var _vspd = sign(vspd);
	
		if (place_meeting(x, y + _vspd, obj_wall)) {
			vspd = 0;	
		} else {
			y += _vspd	
		}
	}	
}

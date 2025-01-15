/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//velocidade
vspd		= 0;
hspd		= 0;
max_vspd	= 7; 
max_hspd	= 3;
jump_qt		= 2;

grav		= .5;

//dano
max_life	= 5;
life		= max_life;
dmg			= false;
dmg_timer	= 0;

//sprite
img_ind		= 1;
img_numb	= 0;
img_spd		= 12 / game_get_speed(gamespeed_fps);
xscale		= image_xscale;
alpha		= image_alpha;
face		= 0;
sprite		= sprite_index;
sprites		= [spr_player_idle, spr_player_run, spr_player_jump, spr_player_jump_double, spr_player_down, spr_player_dmg];

#region control
jump_control = function() {
	if (!floor_) {
		vspd += grav;		
		if (vspd > 0) {
			check_img(4)	
		} else {
			if (jump_qt >= 1) {
				check_img(2);	
			} else {
				check_img(3);	
			}
		}		
	} else {		
		jump_qt = 2;
	}
	
	if (jump and jump_qt > 0) {
		jump_qt--;
		vspd = -max_vspd	
	}
	
	vspd = clamp(vspd, -max_vspd, max_vspd)	
	
}

controls = function() {
	
	dmg_timer--;
	
	floor_	= place_meeting(x, y + 1, obj_wall);

	right	= keyboard_check(vk_right) or keyboard_check(ord("D"));
	left	= keyboard_check(vk_left) or keyboard_check(ord("A"));
	jump	= keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	
	// Controle de sprite
    if (right) {face = 0;xscale = 1;}
    if (jump) {face = 1;}
    if (left) {face = 2;xscale = -1;}
	
	hspd = (right - left) * max_hspd;	
}

check_img = function(_sprite_index) {
	//checking if i'm using this sprite
	if (sprite != sprites[_sprite_index]) {
		//else i reset my index
		img_ind = 0;	
	}
	
	//using my sprite
	sprite = sprites[_sprite_index];
	
	//geting my number of sprite frames
	img_numb = sprite_get_number(sprites[_sprite_index]);
	
	//increasing my sprite index
	img_ind += img_spd;
	
	//reseting my sprites after end
	img_ind %= img_numb;
	
}

#endregion

#region states
state_idle = function() {	
	controls();	
	
	check_img(0);
		
	if (right xor left) {
		state = state_mov;
	}	
	
	jump_control()
}

state_mov = function() {		
	controls();
	
	check_img(1);
	
	if (!right and !left) state = state_idle;
	
	jump_control();	
}

state_dmg = function(_dano = 1) {	
	check_img(5);
	
	if (img_ind + img_spd >= img_numb) {
		state = state_idle;
	}
	
	if (dmg and life > 0) {
		dmg			= false;
		dmg_timer	= game_get_speed(gamespeed_fps);
		life -= _dano;	
	}	
}

p_collision = function() {

#region wall collision		
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
#endregion

#region enemy collision	
	
	//player hitting enemy
	var _enemy = instance_place(x, y + 1, obj_enemies);	
	
	if (_enemy  and _enemy.life > 0 and !dmg and y < _enemy.y) {
		jump_qt = 1;
		vspd = -max_vspd;
		_enemy.dmg = true;
		_enemy.state = _enemy.state_dmg;
	}
	
	//enemy colission
	_enemy = instance_place(x, y, obj_enemies);
	
	if (_enemy and !_enemy.dmg and dmg_timer <= 0 and life > 0) {
		if (x < _enemy.x) {
			hspd = -1;	
		} else {
			hspd = 1;	
		}
		vspd = 0;
		dmg = true;
		state = state_dmg;	
	}
	
	//traps collision
	var _trap_collision = instance_place(x, y, obj_saw);
	
	if (_trap_collision and dmg_timer <= 0 and life > 0) {
		if (x < _trap_collision.x) {
			hspd = -1;	
		} else {
			hspd = 1;	
		}
		vspd = 0;
		dmg = true;
		state = state_dmg;
	}	
	
	//collecting my item
	var _fruta_collected = instance_place(x, y, obj_fruits)

	if (_fruta_collected) {
		instance_create_layer(_fruta_collected.x, _fruta_collected.y, "Itens", obj_collected);
		instance_destroy(_fruta_collected)
	}	
	
}
#endregion

state = state_idle;
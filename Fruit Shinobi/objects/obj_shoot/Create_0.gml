/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

sprite = spr_wood_shoot_peace;

s_collision = function() {
	var _wall = place_meeting(x + image_xscale, y, obj_wall);
	
	if (_wall) {
		var _shoot = instance_create_layer(x, y, "Enemies", obj_shoot_peace);
		_shoot.sprite_index = sprite;
		_shoot.vspeed = 2;
		instance_destroy();
	}
	
	var _player = instance_place(x, y, obj_player);
	
	if (_player) {
		instance_destroy();
		with(obj_player) {
			if (life > 0 and !dmg and dmg_timer <= 0) {
				dmg = true;
				state = state_dmg;	
			}
		}
	}
}

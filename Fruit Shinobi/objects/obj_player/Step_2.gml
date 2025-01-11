/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

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

var _fruta_collected = instance_place(x, y, obj_fruits)

if (_fruta_collected) {
	instance_create_layer(_fruta_collected.x, _fruta_collected.y, "Itens", obj_collected);
	instance_destroy(_fruta_collected)
}

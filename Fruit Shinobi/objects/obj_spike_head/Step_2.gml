/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

repeat(abs(vspd)) {	
	var _vspd = sign(vspd);	
	if (place_meeting(x, y + _vspd, obj_wall)) {
		vspd = 0;	
	} else {
		y += _vspd	
	}
}

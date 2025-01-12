/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

repeat(abs(spd)) {	
	var _spd = sign(spd);
	
	if (place_meeting(x + _spd, y, obj_wall)) {
		spd = 0;	
	} else {
		x += _spd	
	}
	
}




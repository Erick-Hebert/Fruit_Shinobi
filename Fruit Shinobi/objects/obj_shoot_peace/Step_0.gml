/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _wall = place_meeting(x - sprite_width * -image_xscale, y, obj_wall);

if (_wall) {
	vspeed = 0;
	image_alpha = lerp(image_alpha, 0, .06);
	if (image_alpha <= .2) instance_destroy();
}

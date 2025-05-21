/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _count = 1;
repeat(life){
	draw_sprite(spr_life, -1, sprite_get_width(spr_life) * _count, 20);	
	_count++;
}

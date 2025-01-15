// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações

function check_img(_sprite_index) {
	//Se ainda n estiver usando a sprite  correta
	if (sprite != sprites[_sprite_index]) {
		//reseto meu img_ind
		img_ind = 0;
	}
	
	//ajustando a sprite
	sprite = sprites[_sprite_index];
	
	//pegando a quant de frames da animação
	img_numb = sprite_get_number(sprite);
	
	//aumentando meu indice conforme minha
	img_ind += img_spd;
	
	//zerando após minha animação acabar
	img_ind %= img_numb;	
}
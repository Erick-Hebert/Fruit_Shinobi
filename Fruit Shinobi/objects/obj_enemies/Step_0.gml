/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

dmg_timer--;

state();

if (life <= 0 and image_alpha > .3) {
	check_img(2)
	vspd = -max_vspd
	y += vspd;
	image_angle -= 5;
	image_alpha -= .02
} else {
	vspd += grav;	
}

if (image_alpha <= .35) {instance_destroy(); instance_create_layer(x, y, "Itens", obj_collected)}


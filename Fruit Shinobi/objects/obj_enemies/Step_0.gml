/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

dmg_timer--;
shoot_timer--;

state();

if (life <= 0 and image_alpha > .3) {
	image_alpha -= .05
} else {
	vspd += grav;	
}

if (image_alpha <= .35) {instance_destroy(); instance_create_layer(x, y, "Itens", obj_collected)}


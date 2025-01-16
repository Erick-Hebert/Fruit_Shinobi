/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

dmg_timer--;

state();

if (life <= 0 and image_alpha > .0) {
	vspd = -max_vspd
	image_angle -= 10;
	image_alpha -= .03
}

if (image_alpha <= .35) {instance_destroy(); instance_create_layer(x, y, "Itens", obj_collected)}

y += vspd
x += hspd

vspd = clamp(vspd, -max_vspd, max_vspd)

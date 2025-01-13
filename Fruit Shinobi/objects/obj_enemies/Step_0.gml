/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

state();

if (life <= 0 and image_alpha > .5) {
	hspd = +max_hspd
	image_angle -= 4;
	image_alpha -= .02
}

if (image_alpha <= .5) {instance_destroy(); instance_create_layer(x, y, "Itens", obj_collected)}

y += vspd
x += hspd

vspd = clamp(vspd, -max_vspd, max_vspd)

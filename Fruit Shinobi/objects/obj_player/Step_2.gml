/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

p_collision();

var _fruta_collected = instance_place(x, y, obj_fruits)

if (_fruta_collected) {
	instance_create_layer(_fruta_collected.x, _fruta_collected.y, "Itens", obj_collected);
	instance_destroy(_fruta_collected)
}

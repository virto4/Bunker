/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if position_meeting(mouse_x, mouse_y, object_index) {
	sprite_index = sprite_selecionado
	mouse_entrou= true
} else {
	sprite_index = sprite_padrao
	mouse_entrou = false
}

if conquistada {
	image_blend = c_white
} else {
	image_blend = c_black
}
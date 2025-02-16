/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
x = mouse_x
y = mouse_y

if place_meeting(x, y, objetos_interativos) {
	var _colisao = instance_place(x, y, objetos_interativos)
	sprite_index = spr_cursor_mao
	if point_distance(obj_personagem.x, obj_personagem.y, _colisao.x, _colisao.y) > 100 {
		image_alpha = 0.5
	} else {
		image_alpha = 1
	}
} else {
	image_alpha = 1
	sprite_index = spr_cursor_padrao
}
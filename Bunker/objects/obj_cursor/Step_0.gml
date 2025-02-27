/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


x=mouse_x
y=mouse_y
image_alpha=0

if place_meeting(mouse_x, mouse_y, obj_interativo) {
	var _colisao = instance_place(mouse_x, mouse_y, obj_interativo)
	cursor_sprite = spr_cursor_mao
	if point_distance(obj_personagem.x, obj_personagem.y, _colisao.x, _colisao.y) > 100 {
		cursor_sprite = spr_cursor_mao_1
	} else {
		cursor_sprite = spr_cursor_mao
	}
} else {
	//image_alpha = 1
	cursor_sprite = spr_cursor_padrao
}
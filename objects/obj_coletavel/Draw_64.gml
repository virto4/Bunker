/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if obj_personagem.direita_coletavel {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_dialogo, 0, 960, 880, 5, 5, 0, c_white, 1)
	draw_set_color(c_black)
	draw_set_font(fnt_dialogos)
	var linhas = obj_conquistas.quebrar_texto(variable_struct_get(global.descricoes, object_get_name(obj_personagem.objeto)), 1500)
	draw_text(190, 800, variable_struct_get(global.nomes, object_get_name(obj_personagem.objeto)))
	for (var i = 0; i < array_length(linhas); i++) {
		draw_text(190, 850 + 50 * i, linhas[i])
	}
	draw_sprite_ext(spr_retrato, 0, 1632, 552, 1, 1, 0, c_white, 1)
	draw_sprite_ext(object_get_sprite(obj_personagem.objeto), 0, 1632, 552, 4, 4, 0, c_white, 1)
	if mouse_check_button_pressed(mb_left) {
		obj_personagem.direita_coletavel = false
		global.tem_tela_aberta = false
	}
}
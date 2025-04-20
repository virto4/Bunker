/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if room_get_name(room) == "rm_tela_inicial" and sair_jogo {
	draw_set_alpha(alpha)
	draw_set_color(c_black)
	draw_rectangle(0, 0, 1920, 1080, false)
	if sair_jogo {
		alpha += 0.03
	}
}
if room_get_name(room) == "rm_tela_inicial" {
	draw_sprite_ext(spr_jogar, 0, x_jogar, y_jogar, a_jogar, a_jogar, 0, c_white, 1)
	draw_sprite_ext(spr_conquistas, 0, x_conquistas, y_conquistas, a_conquistas, a_conquistas, 0, c_white, 1)
	draw_sprite_ext(spr_sair, 0, x_sair, y_sair, a_sair, a_sair, 0, c_white, 1)
	draw_sprite_ext(spr_opcoes, 0, x_opcoes, y_opcoes, a_opcoes, a_opcoes, 0, c_white, 1)
} else if room_get_name(room) == "rm_opcoes" {
	draw_sprite_ext(spr_voltar, 0, x_voltar, y_voltar, a_voltar, a_voltar, 0, c_white, 1)
	draw_sprite_ext(spr_fundo_tela_inicial, 0, 0, 0, 1, 1, 0, c_white, alpha_opcoes)
} else if room_get_name(room) == "rm_conquistas" {
	draw_sprite_ext(spr_voltar, 0, x_voltar, y_voltar, a_voltar, a_voltar, 0, c_white, 1)
	draw_sprite_ext(spr_fundo_tela_inicial, 0, 0, 0, 1, 1, 0, c_white, alpha_conquistas)
}
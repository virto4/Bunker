/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if room_get_name(room) == "rm_tela_inicial" {
	draw_sprite_ext(spr_nuvem1, 0, x_nuvem1, y_nuvem1, 3, 3, 0, c_white, n_alpha)
	draw_sprite_ext(spr_nuvem1, 0, x_nuvem4, y_nuvem4, 3, 3, 0, c_white, n_alpha)
	draw_sprite_ext(spr_nuvem2, 0, x_nuvem2, y_nuvem2, 3, 3, 0, c_white, n_alpha)
	draw_sprite_ext(spr_nuvem3, 0, x_nuvem3, y_nuvem3, 3, 3, 0, c_white, n_alpha)
	draw_sprite_ext(spr_logo, 0, x_logo, y_logo, 6, 6, 0, c_white, 1)
	draw_sprite_ext(spr_jogar, 0, x_jogar, y_jogar, a_jogar, a_jogar, 0, c_white, 1)
	draw_sprite_ext(spr_conquistas, 0, x_conquistas, y_conquistas, a_conquistas, a_conquistas, 0, c_white, 1)
	draw_sprite_ext(spr_sair, 0, x_sair, y_sair, a_sair, a_sair, 0, c_white, 1)
	
	if window_get_fullscreen() {
		draw_sprite(spr_windowed, 0, x_dividir, y_dividir)
	} else {
		draw_sprite(spr_fullscreen, 0, x_dividir, y_dividir)
	}
} else if room_get_name(room) == "rm_conquistas" {
	draw_sprite_ext(spr_voltar, 0, x_voltar, y_voltar, a_voltar, a_voltar, 0, c_white, 1)
	draw_sprite_ext(spr_fundo_tela_inicial, 0, 0, 0, 1, 1, 0, c_white, alpha_conquistas)
}
if room_get_name(room) == "rm_tela_inicial" and sair_jogo {
	draw_set_alpha(alpha)
	draw_set_color(c_black)
	draw_rectangle(0, 0, 1920, 1080, false)
	if sair_jogo {
		alpha += 0.03
	}
} else if room_get_name(room) = "rm_tela_inicial" and mudar_jogo {
	for(var _i = 0; _i <= tempo; _i++) {
		var _x  = 0
		var _y = 32 * _i
		if _i % 2 == 0 {
			_x = 0
		} else {
			_x = -32
		}
		draw_sprite(spr_efeito_transicao, 0, _x, _y)
	}
	tempo++
	if tempo >= 35 {
		room_goto(rm_casa)
		instance_destroy()
	}
}
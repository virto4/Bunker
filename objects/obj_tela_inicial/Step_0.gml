/// @description Inserir descrição aqui
// Você pode escrever seu código neste
if room_get_name(room) == "rm_tela_inicial" {
	if !em_transicao {
		if mouse_x <= x_jogar + width / 2 and mouse_x >= x_jogar - width / 2 and mouse_y <= y_jogar + height / 2 and mouse_y >= y_jogar - height / 2 {
			if a_jogar < 1.08 {
				a_jogar += 0.005
			}
			if mouse_check_button_pressed(mb_left) {
				em_transicao = true
				mudar_jogo = true
			}
		} else {
			if a_jogar > 1 {
				a_jogar -= 0.005
			}
		}
		
		if mouse_x <= x_conquistas + width / 2 and mouse_x >= x_conquistas - width / 2 and mouse_y <= y_conquistas + height / 2 and mouse_y >= y_conquistas - height / 2 {
			if a_conquistas < 1.08 {
				a_conquistas += 0.005
			}
			if mouse_check_button_pressed(mb_left) {
				mudar_conquistas = true
				em_transicao = true
			}
		} else {
			if a_conquistas > 1 {
				a_conquistas -= 0.005
			}
		}
		
		if mouse_x <= x_dividir + l_dividir and mouse_x >= x_dividir - l_dividir and mouse_y <= y_dividir + l_dividir and mouse_y >= y_dividir - l_dividir {
			if mouse_check_button_pressed(mb_left) {
				if cliques_dividir_tela % 2 == 0 {
					window_set_fullscreen(false)
				} else {
					window_set_fullscreen(true)
				}
				cliques_dividir_tela++
			}
		}

		if mouse_x <= x_sair + width / 2 and mouse_x >= x_sair - width / 2 and mouse_y <= y_sair + height / 2 and mouse_y >= y_sair - height / 2 {
			if a_sair < 1.08 {
				a_sair += 0.005
			}
			if mouse_check_button_pressed(mb_left) {
				sair_jogo = true
				em_transicao = true
			}
		} else {
			if a_sair > 1 {
				a_sair -= 0.005
			}
		}
	} 
	
	if sair_jogo {
		if y_sair + height / 2 >= 0 {
			y_conquistas -= 30
			y_jogar -= 30
			y_dividir -= 30
			y_sair -= 30
		} else {
			game_end() //fecha o jogo
		}
	} else if mudar_conquistas {
		if x_conquistas <= x2 + 1920 {
			x_conquistas += 30
			x_jogar += 30
			x_sair += 30
			x_dividir += 30
		} else {
			room_goto(rm_conquistas)
		}
	} else if sair_conquistas {
		if x_conquistas >= x2 {
			x_conquistas -= 30
			x_jogar -= 30
			x_sair -= 30
			x_dividir -= 30
		} else {
			sair_conquistas = false
			em_transicao = false
		}
	} 
} else if room_get_name(room) == "rm_conquistas" {
	if mudar_conquistas {
		if alpha_conquistas > 0 {
			alpha_conquistas -= 0.03
		} else {
			mudar_conquistas = false
		}
	}
	
	if mouse_x <= x_voltar + 64 and mouse_x >= x_voltar - 64 and mouse_y <= y_voltar + 32 and mouse_y >= y_voltar - 32 {
		if a_voltar < 1.08 {
			a_voltar += 0.005
		}
		if mouse_check_button_pressed(mb_left) { //se clicar, volta para tela inicial
			sair_conquistas = true
		}
	} else {
		if a_voltar > 1 {
			a_voltar -= 0.005
		}
	}
	
	if sair_conquistas {
		if alpha_conquistas < 1 {
			alpha_conquistas += 0.03
		} else {
			room_goto(rm_tela_inicial)
		}
	}
}
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
				tempo = current_time
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
				tempo = current_time
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
				tempo = current_time
			}
		} else {
			if a_sair > 1 {
				a_sair -= 0.005
			}
		}
	} 
	
	x_nuvem1 += 50 * delta_time / 1000000
	x_nuvem2 -= 90 * delta_time / 1000000
	x_nuvem3 -= 50 * delta_time / 1000000
	x_nuvem4 += 30 * delta_time / 1000000
	if x_nuvem1 >= 1920 + 3 * sprite_get_width(spr_nuvem1) / 2 {
		x_nuvem1 -= 1920 + 3 * sprite_get_width(spr_nuvem1)
	}
	if x_nuvem2 <= -3 * sprite_get_width(spr_nuvem2) / 2 {
		x_nuvem2 += 1920 + 3 * sprite_get_width(spr_nuvem2)
	}
	if x_nuvem3 <= -3 * sprite_get_width(spr_nuvem3) / 2 {
		x_nuvem3 += 1920 + 3 * sprite_get_width(spr_nuvem3)
	}
	if x_nuvem4 >= 1920 + 3 * sprite_get_width(spr_nuvem1) / 2 {
		x_nuvem4 -= 1920 + 3 * sprite_get_width(spr_nuvem1)
	}

	if sair_jogo {
		if y_sair + height / 2 >= 0 {
			if current_time >= tempo + 1 * delta_time / 1000000 {
				y_conquistas -= 30 
				y_jogar -= 30
				y_dividir -= 30
				y_sair -= 30
				y_logo -= 30
				y_nuvem1 -= 30
				y_nuvem2 -= 30
				y_nuvem3 -= 30
				y_nuvem4 -= 30
				tempo = current_time
			}
		} else {
			game_end() //fecha o jogo
		}
	} else if mudar_conquistas {
		if x_conquistas <= x2 + 1920 {
			if current_time >= tempo + 1 *delta_time / 1000000 {
				x_conquistas += 30
				x_jogar += 30
				x_sair += 30
				x_dividir += 30
				x_logo += 30
				n_alpha -= 0.05
				tempo = current_time
			}
		} else {
			room_goto(rm_conquistas)
		}
	} else if sair_conquistas {
		if x_conquistas >= x2 {
			if current_time >= tempo + 1 * delta_time / 1000000 {
				x_conquistas -= 30
				x_jogar -= 30
				x_sair -= 30
				x_dividir -= 30
				x_logo -= 30
				n_alpha += 0.05
				tempo = current_time
			}
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
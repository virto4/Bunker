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

		if mouse_x <= x_opcoes + width / 2 and mouse_x >= x_opcoes - width / 2 and mouse_y <= y_opcoes + height / 2 and mouse_y >= y_opcoes - height / 2 {
			if a_opcoes < 1.08 {
				a_opcoes += 0.005
			}
			if mouse_check_button_pressed(mb_left) {
				mudar_opcoes = true
				em_transicao = true
			}
		} else {
			if a_opcoes > 1 {
				a_opcoes -= 0.005
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
	if mudar_opcoes { //para mudar para a tela de opcoes, tudo tem que ir para a esquerda
		x_conquistas -= 30
		x_jogar -= 30
		x_opcoes -= 30
		x_sair -= 30
		if x_sair + width < 0 {
			room_goto(rm_opcoes)
		}
	} else if sair_opcoes { //se está voltando da tela de opcoes, as variaveis continuam iguais a quando sairam, entao é só aumentar
		if x_jogar <= x2 {
			x_conquistas += 30
			x_jogar += 30
			x_opcoes += 30
			x_sair += 30
		} else {
			sair_opcoes = false
			em_transicao = false
		}
	} else if sair_jogo {
		if y_sair + height / 2 >= 0 {
			y_conquistas -= 30
			y_jogar -= 30
			y_opcoes -= 30
			y_sair -= 30
		} else {
			game_end() //fecha o jogo
		}
	} else if mudar_conquistas {
		if x_jogar <= x2 + 1920 {
			x_conquistas += 30
			x_jogar += 30
			x_sair += 30
			x_opcoes += 30
		} else {
			room_goto(rm_conquistas)
		}
	} else if sair_conquistas {
		if x_jogar >= x2 {
			x_conquistas -= 30
			x_jogar -= 30
			x_sair -= 30
			x_opcoes -= 30
		} else {
			sair_conquistas = false
			em_transicao = false
		}
	} 
} else if room_get_name(room) == "rm_opcoes" { //animacao das coisas dessa room entrando pela direita
	if mudar_opcoes {
		if alpha_opcoes > 0 {
			alpha_opcoes -= 0.03
		} else {
			mudar_opcoes = false
		}
	}
	
	if mouse_x <= x_voltar + 64 and mouse_x >= x_voltar - 64 and mouse_y <= y_voltar + 32 and mouse_y >= y_voltar - 32 {
		if a_voltar < 1.08 {
			a_voltar += 0.005
		}
		if mouse_check_button_pressed(mb_left) { //se clicar, volta para tela inicial
			sair_opcoes = true
		}
	} else {
		if a_voltar > 1 {
			a_voltar -= 0.005
		}
	}
		
	if sair_opcoes {
		if alpha_opcoes < 1 {
			alpha_opcoes += 0.03
		} else {
			room_goto(rm_tela_inicial)
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
/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if comecar and clicou {
	var width_sair = sprite_get_width(spr_voltar) / 2
	var height_sair = sprite_get_height(spr_voltar) / 2 
	var tx_sair = 1800
	var ty_sair = 50

	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	if mouse_check_button_pressed(mb_left) {
		if mx > tx_sair - width_sair && mx < tx_sair + width_sair &&
		my > ty_sair - height_sair && my < ty_sair + height_sair {
			clicou = false
			global.tem_tela_aberta = false
		}
	}
	
	if obj_personagem.item_selecionado == obj_chave_fenda and !todas_chaves and !todos_espanador {
		if !chave1 {
			if point_in_rectangle(mx, my, x1 - 15, y1 - 15, x1 + 15, y1 + 15) {
				if mouse_check_button_pressed(mb_left) {
					cliques1++
					largura1 = cliques1 * 140 / total_chave
					clicou2 = true
					tempo = current_time
					if cliques1 == total_chave {
						chave1 = true
					}
				}
			}
		}
	
		if !chave2 {
			if point_in_rectangle(mx, my, x2 - 15, y1 - 15, x2 + 15, y1 + 15) {
				if mouse_check_button_pressed(mb_left) {
					cliques2++
					largura2 = cliques2 * 140 / total_chave
					clicou2 = true
					tempo = current_time
					if cliques2 == total_chave {
						chave2 = true
					}
				}
			}
		}
	
		if !chave3 {
			if point_in_rectangle(mx, my, x1 - 15, y2 - 15, x1 + 15, y2 + 15) {
				if mouse_check_button_pressed(mb_left) {
					cliques3++
					largura3 = cliques3 * 140 / total_chave
					clicou2 = true
					tempo = current_time
					if cliques3 == total_chave {
						chave3 = true
					}
				}
			}
		}
	
		if !chave4 {
			if point_in_rectangle(mx, my, x2 - 15, y2 - 15, x2 + 15, y2 + 15) {
				if mouse_check_button_pressed(mb_left) {
					cliques4++
					largura4 = cliques4 * 140 / total_chave
					clicou2 = true
					tempo = current_time
					if cliques4 == total_chave {
						chave4 = true
					}
				}
			}
		}
	
		if chave1 and chave2 and chave3 and chave4 {
			todas_chaves = true
			ferramentas = spr_espanador
		}
	} else if obj_personagem.item_selecionado == obj_espanador and todas_chaves and !todos_espanador {
		if mouse_check_button_pressed(mb_left) {
			if point_in_rectangle(mx, my, mancha1[0][0], mancha1[0][1], mancha1[1][0], mancha1[1][1]) {
				cliques11++
				largura11 = cliques11 * 140 / total_espanador
				clicou2 = true
				tempo = current_time
				if cliques11 == total_espanador {
					espanador1 = true
				}
			}
			if point_in_rectangle(mx, my, mancha2[0][0], mancha2[0][1], mancha2[1][0], mancha2[1][1]) {
				cliques22++
				largura22 = cliques22 * 140 / total_espanador
				clicou2 = true
				tempo = current_time
				if cliques22 == total_espanador {
					espanador2 = true
				}
			}
			if point_in_rectangle(mx, my, mancha3[0][0], mancha3[0][1], mancha3[1][0], mancha3[1][1]) {
				cliques33++
				largura33 = cliques33 * 140 / total_espanador
				clicou2 = true
				tempo = current_time
				if cliques33 == total_espanador {
					espanador3 = true
				}
			}
		}
		
		if espanador1 and espanador2 and espanador3 {
			todos_espanador = true
		}
	}
}
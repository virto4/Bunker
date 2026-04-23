/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if clicou and comecar {
	draw_sprite(spr_voltar, 0, 1800, 50)
	if !todas_chaves {
		draw_sprite_ext(spr_ventilacao_interface, 0, 1920 / 2, 1080 / 2, 10, 10, 0, c_white, 1)
		if !chave1 { //canto superior esquerdo
			draw_circle(x1, y1 - 90, 40, false)
			draw_sprite_ext(ferramentas, 0, x1, y1 - 90, 2, 2, 0, c_white, 1)
			draw_rectangle_color(x1 - 70, y1 - 30 - 10, x1 + 70, y1 - 30 + 10, c_black, c_black, c_black, c_black, false)
			draw_rectangle_color(x1 -  70 + 4, y1 - 30 - 10 + 4, x1 + largura1 - 70 + 4, y1 - 30 + 10 - 4, #487F7D, #487F7D, #487F7D, #487F7D, false)
		} else {
			draw_sprite_ext(spr_concluido, 0, x1, y1 - 70, 3, 3, 0, c_white, 1)
		}
		if !chave2 { //canto superior direito
			draw_circle(x2, y1 - 90, 40, false)
			draw_sprite_ext(ferramentas, 0, x2, y1 - 90, 2, 2, 0, c_white, 1)
			draw_rectangle_color(x2 - 70, y1 - 30 - 10, x2 + 70, y1 - 30 + 10, c_black, c_black, c_black, c_black, false)
			draw_rectangle_color(x2-  70 + 4, y1 - 30 - 10 + 4, x2 + largura2 - 70 + 4, y1 - 30 + 10 - 4, #487F7D, #487F7D, #487F7D, #487F7D, false)
		} else {
			draw_sprite_ext(spr_concluido, 0, x2, y1 - 70, 3, 3, 0, c_white, 1)
		}
		if !chave3 { //canto inferior esquerdo
			draw_circle(x1, y2 - 90, 40, false)
			draw_sprite_ext(ferramentas, 0, x1, y2 - 90, 2, 2, 0, c_white, 1)
			draw_rectangle_color(x1 - 70, y2 - 30 - 10, x1 + 70, y2 - 30 + 10, c_black, c_black, c_black, c_black, false)
			draw_rectangle_color(x1 -  70 + 4, y2 - 30 - 10 + 4, x1 + largura3 - 70 + 4, y2 - 30 + 10 - 4, #487F7D, #487F7D, #487F7D, #487F7D, false)
		} else {
			draw_sprite_ext(spr_concluido, 0, x1, y2 - 70, 3, 3, 0, c_white, 1)
		}
		if !chave4 { //canto inferior direito
			draw_circle(x2, y2 - 90, 40, false)
			draw_sprite_ext(ferramentas, 0, x2, y2 - 90, 2, 2, 0, c_white, 1)
			draw_rectangle_color(x2 - 70, y2 - 30 - 10, x2 + 70, y2 - 30 + 10, c_black, c_black, c_black, c_black, false)
			draw_rectangle_color(x2 -  70 + 4, y2 - 30 - 10 + 4, x2 + largura4 - 70 + 4, y2 - 30 + 10 - 4, #487F7D, #487F7D, #487F7D, #487F7D, false)
		} else {
			draw_sprite_ext(spr_concluido, 0, x2, y2 - 70, 3, 3, 0, c_white, 1)
		}
	} else if !todas_chave_2 {
		if !todos_espanador {
			draw_sprite_ext(spr_ventilacao_aberta_suja, 0, 1920 / 2, 1080 / 2, 10, 10, 0, c_white, 1)
			if !espanador1 {
				draw_circle(x11, y11 - 90, 40, false)
				draw_sprite_ext(ferramentas, 0, x11, y11 - 90, 2, 2, 0, c_white, 1)
				draw_rectangle_color(x11 - 70, y11 - 30 - 10, x11 + 70, y11 - 30 + 10, c_black, c_black, c_black, c_black, false)
				draw_rectangle_color(x11 -  70 + 4, y11 - 30 - 10 + 4, x11 + largura11 - 70 + 4, y11 - 30 + 10 - 4, #487F7D, #487F7D, #487F7D, #487F7D, false)
			} else {
				draw_sprite_part_ext(spr_ventilacao_aberta_limpa, 0, 0, 0, 70, 15, 360, 240, 10, 10, c_white, 1)
			}
			if !espanador2 {
				draw_circle(x22, y22 - 90, 40, false)
				draw_sprite_ext(ferramentas, 0, x22, y22 - 90, 2, 2, 0, c_white, 1)
				draw_rectangle_color(x22 - 70, y22 - 30 - 10, x22 + 70, y22 - 30 + 10, c_black, c_black, c_black, c_black, false)
				draw_rectangle_color(x22 -  70 + 4, y22 - 30 - 10 + 4, x22 + largura22 - 70 + 4, y22 - 30 + 10 - 4, #487F7D, #487F7D, #487F7D, #487F7D, false)
			} else {
				draw_sprite_part_ext(spr_ventilacao_aberta_limpa, 0, 90, 0, 30, 60, 1260, 240, 10, 10, c_white, 1)
			}
			if !espanador3 {
				draw_circle(x33, y33 - 90, 40, false)
				draw_sprite_ext(ferramentas, 0, x33, y33 - 90, 2, 2, 0, c_white, 1)
				draw_rectangle_color(x33 - 70, y33 - 30 - 10, x33 + 70, y33 - 30 + 10, c_black, c_black, c_black, c_black, false)
				draw_rectangle_color(x33 -  70 + 4, y33 - 30 - 10 + 4, x33 + largura33 - 70 + 4, y33 - 30 + 10 - 4, #487F7D, #487F7D, #487F7D, #487F7D, false)
			} else {
				draw_sprite_part_ext(spr_ventilacao_aberta_limpa, 0, 0, 40, 40, 20, 360, 640, 10, 10, c_white, 1)
			}
		} else if !todas_chave_2 {
			draw_sprite_ext(spr_ventilacao_aberta_limpa, 0, 1920 / 2, 1080 / 2, 10, 10, 0, c_white, 1)
			if tempo_finalizacao == 0 {
				tempo_finalizacao = current_time
			} else if current_time <= tempo_finalizacao + 2000 { //vendo se passou 2 segundos, ja que current time é em milissegundo
				draw_sprite_ext(spr_concluido, 0, 1920 / 2, 300, 3, 3, 0, c_white, 1)
			} else if !todas_chave_2 {
				todas_chaves = false
				chave1 = false
				chave2 = false
				chave3 = false
				chave4 = false
				ferramentas = spr_chave_fenda
				largura1 = 0
				largura2 = 0
				largura3 = 0
				largura4 = 0
				cliques1 = 0
				cliques2 = 0
				cliques3 = 0
				cliques4 = 0
				todas_chave_2 = true
			}
		}
	}
}
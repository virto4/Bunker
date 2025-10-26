/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

function maior() {
	var encontrou = false
	for (var k = 6; k >= 0 and !encontrou; k--) {
		for (var l = k; l >= 0 and !encontrou; l--) {
			for (var i = 0; i < array_length(pecas_jogador) and !encontrou; i++) {
				if array_equals(pecas_jogador[i], [k, l]) or array_equals(pecas_jogador[i], [l, k]) {
					encontrou = true
					array_delete(pecas_jogador, i, 1)
					vez_davi = true
					tempo = current_time / 1000 + 3
					array_push(pecas_mesa, [k, l])
				}if array_equals(pecas_adversario[i], [k, l]) or array_equals(pecas_adversario[i], [l, k]) {
					encontrou = true
					vez_davi = false
					array_delete(pecas_adversario, i, 1)
					array_push(pecas_mesa, [k, l])
				}
			}
		}
	}
}

function pontos(n, _x, _y) {
	draw_set_color(c_black)
	switch n {
		case 1:
			draw_circle(_x, _y, 5, false)
			break
		case 2:
			draw_circle(_x - 6, _y, 5, false)
			draw_circle(_x + 6, _y, 5, false)
			break
		case 3:
			draw_circle(_x - 10, _y - 10, 5, false)
			draw_circle(_x, _y, 5, false)
			draw_circle(_x + 10, _y + 10, 5, false)
			break
		case 4:
			draw_circle(_x - 10, _y - 10, 5, false)
			draw_circle(_x - 10, _y + 10, 5, false)
			draw_circle(_x + 10, _y + 10, 5, false)
			draw_circle(_x + 10, _y - 10, 5, false)
			break
		case 5:
			draw_circle(_x - 10, _y - 10, 5, false)
			draw_circle(_x - 10, _y + 10, 5, false)
			draw_circle(_x + 10, _y + 10, 5, false)
			draw_circle(_x + 10, _y - 10, 5, false)
			draw_circle(_x, _y, 5, false)
			break
		case 6:
			draw_circle(_x - 10, _y - 10, 5, false)
			draw_circle(_x - 10, _y, 5, false)
			draw_circle(_x - 10, _y + 10, 5, false)
			draw_circle(_x + 10, _y - 10, 5, false)
			draw_circle(_x + 10, _y, 5, false)
			draw_circle(_x + 10, _y + 10, 5, false)
			break
	}
}
if clicou {
	draw_sprite_ext(spr_interface_mesa, 0, 960, 540, 4, 4, 0, c_white, 1)
	draw_sprite(spr_voltar, 0, 1800, 50)
	var xis = (1920 - 70 * array_length(pecas_tela)) / 2
	var xis2 = (1920 - 70 * array_length(pecas_adversario)) / 2
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	for (var i = 0; i < array_length(pecas_adversario); i++) {
		draw_rectangle_color(xis2 + 70 * i, 150, xis2 + 50 + 70 * i, 50, c_black, c_black, c_black, c_black, false)
		draw_rectangle_color(xis2 + 70 * i + 5, 55, xis2 + 45 + 70 * i, 97, #CCCCCC, #CCCCCC, #CCCCCC, #CCCCCC, false)
		draw_rectangle_color(xis2 + 70 * i + 5, 102, xis2 + 45 + 70 * i, 145, #CCCCCC, #CCCCCC, #CCCCCC, #CCCCCC, false)
	}
	var pode_jogar = false
	for (var i = 0; i < array_length(pecas_tela); i++) {
		draw_rectangle_color(xis + 70 * i, 930, xis + 50 + 70 * i, 1030, c_black, c_black, c_black, c_black, false)
		if point_in_rectangle(mx, my, xis + 70 * i, 930, xis + 50 + 70 * i, 1030) {
			cor_peca = #999999
		} else {
			cor_peca = #CCCCCC
		}
		draw_rectangle_color(xis + 70 * i + 5, 935, xis + 45 + 70 * i, 977, cor_peca, cor_peca, cor_peca, cor_peca, false)
		draw_rectangle_color(xis + 70 * i + 5, 983, xis + 45 + 70 * i, 1025, cor_peca, cor_peca, cor_peca, cor_peca, false)
		pontos(pecas_tela[i][0], xis + 70 * i + 25, 956)
		pontos(pecas_tela[i][1], xis + 70 * i + 25, 1006)
		if point_in_rectangle(mx, my, xis + 70 * i, 930, xis + 50 + 70 * i, 1030) and !vez_davi and !primeira_peca and !ganhou {
			if mouse_check_button_pressed(mb_left) {
				if prim == pecas_tela[i][0] or prim == pecas_tela[i][1] {
					array_insert(pecas_mesa, 0, pecas_tela[i])
					array_delete(pecas_tela, i, 1)
					vez_davi = true
					tempo = current_time / 1000 + 3
					pode_jogar = true
				} else if ult == pecas_tela[i][0] or ult == pecas_tela[i][1] {
					array_push(pecas_mesa, pecas_tela[i])
					array_delete(pecas_tela, i, 1)
					vez_davi = true
					tempo = current_time / 1000 + 3
					pode_jogar = true
				}
			}
		}
	}
	
	if array_length(pecas_tela) == 0 {
		var msg = "Você ganhou!"
		pecas_mesa = []
		draw_set_font(fnt_dialogos)
		draw_set_color(c_white)
		draw_text(960 - string_width(msg) / 2, 540 - string_height(msg) / 2, msg)
		ganhou = true
	}
	if array_length(pecas_adversario) == 0 {
		var msg = "Davi ganhou!"
		pecas_mesa = []
		draw_set_font(fnt_dialogos)
		draw_set_color(c_white)
		draw_text(960 - string_width(msg) / 2, 540 - string_height(msg) / 2, msg)
		ganhou = true
	}
	
	draw_set_font(fnt_dialogos)
	draw_set_color(c_white)
	var text1 = "Comprar"
	var text2 = "Passar vez"
	var x1 = 1720 + string_width(text1)
	var x2 = 1510 + string_width(text2)
	draw_rectangle_color(1700, 935, x1, 983, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(1700 + 5, 935 + 5, x1 - 5, 983 - 5, cor1, cor1, cor1, cor1, false)
	draw_text(1710, 959 - string_height(text1) / 2, text1)
	draw_rectangle_color(1500, 935, x2, 983, c_black, c_black, c_black, c_black, false)
	draw_rectangle_color(1500 + 5, 935 + 5, x2 - 5, 983 - 5, cor2, cor2, cor2, cor2, false)
	draw_text(1510, 959 - string_height(text2) / 2, text2)
	if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1700, 935, x1, 983) {
		cor1 = #061E33
		if mouse_check_button_pressed(mb_left) and array_length(monte) > 0 and !vez_davi and !primeira_peca {
			array_push(pecas_tela, monte[0])
			array_delete(monte, 0, 1)
		}
	} else {
		cor1 = #092E4C
	}
	if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 1500, 935, x2, 983) {
		cor2 = #053330
		if mouse_check_button_pressed(mb_left) and !vez_davi and !primeira_peca {
			if !vez_davi {
				vez_davi = true
				tempo = current_time / 1000 + 3
			}
		}
	} else {
		cor2 = #084C48
	}
	
	if array_length(pecas_jogador) > 14 {
		if pecas_jogador[0] != pecas_tela[0] {
			draw_sprite(spr_voltar_diario, 0, (1920 - 70 * array_length(pecas_tela)) / 2 - 72 , 980)
			if point_in_rectangle(mx, my, (1920 - 70 * array_length(pecas_tela)) / 2 - 144, 980 - 36, (1920 - 70 * array_length(pecas_tela)) / 2, 980 + 36) {
				if mouse_check_button_pressed(mb_left) {
					index--
					array_copy(pecas_tela, 0, pecas_jogador, index, 14)
				}
			}
		}
		if pecas_jogador[array_length(pecas_jogador) - 1] != pecas_tela[array_length(pecas_tela) - 1] {
			var xavancar = 1920 - (1920 - 70 * array_length(pecas_tela)) / 2 
			draw_sprite(spr_avancar_diario, 0, xavancar + 72, 980)
			if point_in_rectangle(mx, my, xavancar, 980 - 36, xavancar + 144, 980 + 36) {
				if mouse_check_button_pressed(mb_left) {
					index++
					array_copy(pecas_tela, 0, pecas_jogador, index, 14)
				}
			}
		}
	}
	var xmesa = (1920 - largura) / 2
	var n_pecas = 0
	largura = 0
	var ultima = 0
	for (var i = 0; i < array_length(pecas_mesa); i++) { 
		if array_length(pecas_mesa) == 1 {
			n_pecas += 50
			largura += 50
			draw_set_color(c_black)	
			draw_rectangle(xmesa + n_pecas - 50, 540 - 50, xmesa + n_pecas, 540 + 50, false)
			draw_set_color(#CCCCCC)
			draw_rectangle(xmesa + n_pecas - 45, 495, xmesa + n_pecas - 5, 537, false)
			draw_rectangle(xmesa + n_pecas - 45, 542, xmesa + n_pecas - 5, 585, false)
			pontos(pecas_mesa[i][0], xmesa + n_pecas - 25, 515)
			pontos(pecas_mesa[i][1], xmesa + n_pecas - 25, 565)
			ultima = pecas_mesa[i][0]
		} else if pecas_mesa[i][0] == pecas_mesa[i][1] {
			n_pecas += 50
			largura += 50
			draw_set_color(c_black)	
			draw_rectangle(xmesa + n_pecas - 50, 540 - 50, xmesa + n_pecas, 540 + 50, false)
			draw_set_color(#CCCCCC)
			draw_rectangle(xmesa + n_pecas - 45, 495, xmesa + n_pecas - 5, 537, false)
			draw_rectangle(xmesa + n_pecas - 45, 542, xmesa + n_pecas - 5, 585, false)
			pontos(pecas_mesa[i][0], xmesa + n_pecas - 25, 515)
			pontos(pecas_mesa[i][1], xmesa + n_pecas - 25, 565)
			ultima = pecas_mesa[i][0]
		} else if i > 0 {
			n_pecas += 100
			largura += 100
			draw_set_color(c_black)
			draw_rectangle(xmesa + n_pecas - 100, 540 - 25, xmesa + n_pecas, 540 + 25, false)
			draw_set_color(#CCCCCC)
			draw_rectangle(xmesa + n_pecas - 95, 520, xmesa + n_pecas - 53, 560, false)
			draw_rectangle(xmesa + n_pecas - 48, 520, xmesa + n_pecas - 5, 560, false)
			if ultima == pecas_mesa[i][1] {
				var aux = pecas_mesa[i][1]
				pecas_mesa[i][1] = pecas_mesa[i][0]
				pecas_mesa[i][0] = aux
			}
			pontos(pecas_mesa[i][0], xmesa + n_pecas - 75, 540)
			pontos(pecas_mesa[i][1], xmesa + n_pecas - 25, 540)
			ultima = pecas_mesa[i][1]
		} else if i == 0 and array_length(pecas_mesa) > 1 {
			n_pecas += 100
			largura += 100
			draw_set_color(c_black)
			draw_rectangle(xmesa + n_pecas - 100, 540 - 25, xmesa + n_pecas, 540 + 25, false)
			draw_set_color(#CCCCCC)
			draw_rectangle(xmesa + n_pecas - 95, 520, xmesa + n_pecas - 53, 560, false)
			draw_rectangle(xmesa + n_pecas - 48, 520, xmesa + n_pecas - 5, 560, false)
			if pecas_mesa[i][0] == pecas_mesa[i + 1][0] {
				var aux = pecas_mesa[i][1]
				pecas_mesa[i][1] = pecas_mesa[i][0]
				pecas_mesa[i][0] = aux
			}
			pontos(pecas_mesa[i][0], xmesa + n_pecas - 75, 540)
			pontos(pecas_mesa[i][1], xmesa + n_pecas - 25, 540)
			ultima = pecas_mesa[i][1]
		}
		if i == 0 {
			prim = pecas_mesa[i][0]
		}
		if i == array_length(pecas_mesa) - 1 {
			ult = pecas_mesa[i][1]
		}
	}
}


if clicou and primeira_peca {
	var _text = "Clique para começar o jogo"
	draw_set_font(fnt_dialogos)
	draw_set_color(c_white)
	draw_set_alpha(alpha)
	draw_text(960 - string_width(_text) / 2, 540 - string_height(_text) / 2, _text)
	draw_set_alpha(1)
	if reverse {
		alpha -= 0.1
		if alpha <= 0 {
			reverse = false
		}
	} else {
		alpha += 0.1
		if alpha >= 1 {
			reverse = true
		}
	}
	
	if mouse_check_button_pressed(mb_left) {
		if !maismais {
			maismais = true
		} else {
			primeira_peca = false
			maior()
		}
	}
	
}

if clicou and !primeira_peca {
	draw_set_font(fnt_dialogos)
	draw_set_color(c_white)
	if reverse {
		alpha -= 0.1
		if alpha <= 0 {
			reverse = false
		}
	} else {
		alpha += 0.1
		if alpha >= 1 {
			reverse = true
		}
	}
	draw_set_alpha(alpha)
	if vez_davi {
		draw_text(100, 150, "Vez de Davi")
	} else {
		draw_text(100, 930, "Sua vez")
	}
	draw_set_alpha(1)
}

if davi_pulou and !vez_davi {
	if davi_pulou_comeco {
		alpha2 += 0.05
		if alpha2 == 1 {
			davi_pulou_comeco = false
			timer = current_time / 1000 + 3
		}
	}
	if timer < current_time / 1000 {
		davi_pulou_fim = true
	}
	if davi_pulou_fim {
		alpha2 -= 0.05
		if alpha2 == 0 {
			davi_pulou_fim = false
			davi_pulou = false
		}
	}
	draw_set_alpha(alpha2)
	draw_set_font(fnt_dialogos)
	draw_set_color(c_white)
	draw_text(100, 150, "Davi não encontrou peças jogáveis")
	
	draw_set_alpha(1)
} else {
	alpha2 = 0
}

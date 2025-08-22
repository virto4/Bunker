/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	for (var i = 0; i < array_length(pecas_tela); i++) {
		draw_rectangle_color(xis + 70 * i, 930, xis + 50 + 70 * i, 1030, c_black, c_black, c_black, c_black, false)
		if point_in_rectangle(mx, my, xis + 70 * i, 930, xis + 50 + 70 * i, 1030) {
			cor_peca = #999999
			if mouse_check_button_pressed(mb_left) {
				
			}
		} else {
			cor_peca = #CCCCCC
		}
		draw_rectangle_color(xis + 70 * i + 5, 935, xis + 45 + 70 * i, 977, cor_peca, cor_peca, cor_peca, cor_peca, false)
		draw_rectangle_color(xis + 70 * i + 5, 983, xis + 45 + 70 * i, 1025, cor_peca, cor_peca, cor_peca, cor_peca, false)
		pontos(pecas_tela[i][0], xis + 70 * i + 25, 956)
		pontos(pecas_tela[i][1], xis + 70 * i + 25, 1006)
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
	var xmesa = 1920 - (1920 - largura) / 2
	var n_pecas = 0
	var ultima = 0
	for (var i = 0; i < array_length(pecas_mesa); i++) { 
		if pecas_mesa[i][0] == pecas_mesa[i][1] {
			n_pecas += 50
			draw_set_color(c_black)	
			draw_rectangle(xmesa + n_pecas - 50, 540 - 50, xmesa + n_pecas, 540 + 50, false)
			draw_set_color(#CCCCCC)
			draw_rectangle(xmesa + n_pecas - 45, 495, xmesa + n_pecas - 5, 537, false)
			draw_rectangle(xmesa + n_pecas - 45, 542, xmesa + n_pecas - 5, 585, false)
			pontos(pecas_mesa[i][0], xmesa + n_pecas - 25, 515)
			pontos(pecas_mesa[i][1], xmesa + n_pecas - 25, 565)
			ultima = pecas_mesa[i][0]
		} else {
			n_pecas += 100
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
		}
	}
}
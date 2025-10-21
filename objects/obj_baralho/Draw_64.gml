/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
function desenhar(numero, naipe, _x, _y) {
	switch naipe {
		case "espadas":
			draw_sprite(spr_espadas, 0, _x, _y)
			break
		case "paus":
			draw_sprite(spr_paus, 0, _x, _y)
			break
		case "copas":
			draw_sprite(spr_copas, 0, _x, _y)
			break
		case "ouros":
			draw_sprite(spr_ouros, 0, _x, _y)
			break
	}
	var n = numero
	if n == 11 {
		n = "J"
	} else if n == 12 {
		n = "Q"
	} else if n == 13 {
		n = "K"
	} else if n == 1 {
		n = "A"
	}
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	draw_text(_x - 29, _y - 56, n)
	draw_text_transformed(_x + 29, _y + 56, n, 1, 1, 180)
}

if clicou {
	draw_sprite_ext(spr_interface_mesa, 0, 960, 540, 4, 4, 0, c_white, 1)
	draw_sprite(spr_voltar, 0, 1800, 50)
	
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if instrucoes and mouse_check_button_pressed(mb_left) {
		instrucoes = false
	}
	
	draw_sprite_ext(spr_exclamacao, 0, 1600, 50, 3, 3, 0, c_white, 1)
	if point_in_rectangle(mx, my, 1600 - 48, 50 - 48, 1600 + 48, 50 + 48) and mouse_check_button_pressed(mb_left) {
		instrucoes = true
	}
	if instrucoes {
		draw_rectangle_color(1600 - 200, 110, 1600 + 200, 120 + linhas, #2B4C4B, #2B4C4B, #2B4C4B, #2B4C4B, false)
		draw_rectangle_color(1600 - 195, 115, 1600 + 195, 115 + linhas, #396664, #396664, #396664, #396664, false)
		draw_set_font(fnt_dialogos)
		draw_set_color(c_white)
		draw_text_ext(1600 - 190, 120, msg_instrucoes, 30, 380)
	}
	
	if sua_vez and !venceu {
		if !comprar {
			msg = "Compre uma carta de uma das pilhas"
			if point_in_rectangle(mx, my, 700 - 37.5, 540 - 60, 700 + 37.5, 540 + 60) {
				draw_rectangle_color(700 - 42.5, 540 - 65, 700 + 42.5, 540 + 65, c_white, c_white, c_white, c_white, false) 
				if mouse_check_button_pressed(mb_left) {
					audio_play_sound(snd_cartas, 1, false)
					comprar = true
					array_push(cartas_roger, cartas_comprar[0])
					array_delete(cartas_comprar, 0, 1)
				}
			} 
			if point_in_rectangle(mx, my, 1220 - 37.5, 540 - 60, 1220 + 37.5, 540 + 60) and carta_monte != 0 {
				draw_rectangle_color(1220 - 42.5, 540 - 65, 1220 + 42.5, 540 + 65, c_white, c_white, c_white, c_white, false) 
				if mouse_check_button_pressed(mb_left) {
					audio_play_sound(snd_cartas, 1, false)
					array_push(cartas_roger, carta_monte)
					var aux = carta_monte
					carta_monte = carta_monte_passada
					carta_monte_passada = aux
					comprar = true
				}
			}
		} else if !descartar {
			msg = "Descarte uma de suas cartas"
		} else {
			comprar = false
			descartar = false
			sua_vez = false
		}
	}
	
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
	if !sua_vez {
		if !a {
			msg = "Vez de Davi"
		}
		draw_text(960 - string_width(msg) / 2, 100, msg)
	} else {
		draw_text(960 - string_width(msg) / 2, 100, msg)
	}
	draw_set_alpha(1)
	
	if !venceu {
		draw_sprite(spr_carta_atras, 0, 700, 540)
		if carta_monte != 0 {
			desenhar(carta_monte[0], carta_monte[1], 1220, 540)
		}
	}
	var xis = (1920 - 85 *  (array_length(cartas_roger) - 1) ) / 2
	for (var i = 0; i < array_length(cartas_roger); i++) {
		if comprar and !descartar and sua_vez and !venceu {
			if point_in_rectangle(mx, my, xis + 85 * i - 37.5, 1000 - 60, xis + 85 * i + 37.5, 1000 + 60) and carta_monte_passada != cartas_roger[i] {
				draw_rectangle_color(xis + 85 * i - 42.5 , 1000 - 65, xis + 85 * i + 42.5, 1000 + 65, c_white, c_white, c_white, c_white, false) 
				if mouse_check_button_pressed(mb_left) {
					audio_play_sound(snd_cartas, 1, false)
					array_push(cartas_comprar, carta_monte_passada) //coloca a carta que nunca mais será utilizada no fundo da pilha de comprar, porque eu só preciso guardar as 2 primeiras cartasd a pilha
					carta_monte_passada = carta_monte
					carta_monte = cartas_roger[i]
					array_delete(cartas_roger, i, 1)
					descartar = true
					break
				} 
			}
		}
		var aaa = false
		if mouse_check_button_pressed(mb_right) and point_in_rectangle(mx, my, xis + 85 * i - 37.5, 1000 - 60, xis + 85 * i + 37.5, 1000 + 60) and sua_vez and comprar {
			audio_play_sound(snd_menu_in, 1, false)
			for (var j = 0; j < array_length(vermelho); j++) {
				if vermelho[j] == cartas_roger[i] {
					aaa = true
					array_delete(vermelho, j, 1)
					break
				}
			}
			if !aaa {
				array_push(vermelho, cartas_roger[i])
			}
		}
		var desenha = false
		for (var j = 0; j < array_length(vermelho); j++) {
			if vermelho[j] == cartas_roger[i] {
				desenha = true
			}
		}
		if array_length(vermelho) == 3 {
			if vermelho[0][0] == vermelho[1][0] and vermelho[1][0] == vermelho[2][0] and vermelho[0][1] != vermelho[1][1] and vermelho[1][1] != vermelho[2][1] and vermelho[2][1] != vermelho[0][1] {
				var indices = []
				for (var j = 0; j < array_length(cartas_roger); j++) {
					if array_equals(cartas_roger[j], vermelho[0]) or array_equals(cartas_roger[j], vermelho[1]) or array_equals(cartas_roger[j], vermelho[2]) {
						array_push(indices, j)
					}
				}
				array_push(grupos_roger, [vermelho[0], vermelho[1], vermelho[2]])
					for (var j = 0; j < array_length(cartas_roger); j++) {
						if cartas_roger[j] == vermelho[0] or cartas_roger[j] == vermelho[1] or cartas_roger[j] == vermelho[2] {
							array_push(indices, j)
						}
					}
					array_delete(cartas_roger, indices[2], 1)
					array_delete(cartas_roger, indices[1], 1)
					array_delete(cartas_roger, indices[0], 1)
				
			} else if vermelho[0][1] == vermelho[1][1] and vermelho[1][1] == vermelho[2][1] {
				for (var j = 0; j < array_length(vermelho) - 1; j++) {
					for (var k = 0; k < array_length(vermelho) - 1 - j; k++) {
						if vermelho[k][0] > vermelho[k + 1][0] {
							var aux = vermelho[k + 1]
							vermelho[k + 1] = vermelho[k]
							vermelho[k] = aux
						}
					}
				}
				if vermelho[0][0] == 1 and vermelho [1][0] == 12 and vermelho[2][0] == 13 {
					array_push(grupos_roger, [vermelho[1], vermelho[2], vermelho[0]])
					var indices = []
					for (var j = 0; j < array_length(cartas_roger); j++) {
						if cartas_roger[j] == vermelho[0] or cartas_roger[j] == vermelho[1] or cartas_roger[j] == vermelho[2] {
							array_push(indices, j)
						}
					}
					array_delete(cartas_roger, indices[2], 1)
					array_delete(cartas_roger, indices[1], 1)
					array_delete(cartas_roger, indices[0], 1)
				}
				
				if vermelho[1][0] - vermelho[0][0] == 1 and vermelho[2][0] - vermelho[1][0] == 1 {
					array_push(grupos_roger, [vermelho[0], vermelho[1], vermelho[2]])
					var indices = []
					for (var j = 0; j < array_length(cartas_roger); j++) {
						if cartas_roger[j] == vermelho[0] or cartas_roger[j] == vermelho[1] or cartas_roger[j] == vermelho[2] {
							array_push(indices, j)
						}
					}
					array_delete(cartas_roger, indices[2], 1)
					array_delete(cartas_roger, indices[1], 1)
					array_delete(cartas_roger, indices[0], 1)
				}
			}
			vermelho = []
		}
		if desenha {
			draw_rectangle_color(xis + 85 * i - 42.5 , 1000 - 65, xis + 85 * i + 42.5, 1000 + 65, #CC6600, #CC6600, #CC6600, #CC6600, false) 
		}
		if i < array_length(cartas_roger) {
			desenhar(cartas_roger[i][0], cartas_roger[i][1], xis + 85 * i, 1000)
		}
	}
	
	for (var i = 0; i < array_length(grupos_roger); i++) {
		for (var j = 0; j < array_length(grupos_roger[i]); j++) {
			desenhar(grupos_roger[i][j][0], grupos_roger[i][j][1], 1700 + 35 * j, 1000 - 140 * i)
		}
	}
	
	for (var i = 0; i < array_length(grupos_davi); i++) {
		for (var j = 0; j < array_length(grupos_davi[i]); j++) {
			desenhar(grupos_davi[i][j][0], grupos_davi[i][j][1], 115 + 35 * j, 80 + 140 * i)
		}
	}
	
	/*
	var xis2 = (1920 - 85 * (array_length(cartas_davi) - 1)) / 2
	for (var i = 0; i < array_length(cartas_davi); i++) {
		desenhar(cartas_davi[i][0], cartas_davi[i][1], xis2 + 85 * i, 200)
		draw_set_font(fnt_dialogos)
		draw_text(xis2 + 85 * i, 200 + 60 + 10, cartas_davi[i][2])
	}*/
	
	if array_length(grupos_roger) == 3 and array_length(cartas_roger) == 0 {
		venceu = true
	}
	
	if array_length(grupos_davi) == 3  and array_length(cartas_davi) == 0 {
		venceu = true
	}
	
	if venceu {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_white)
		if array_length(grupos_roger) == 3 and array_length(cartas_roger) == 0 {
			var txt = "Você venceu!"
			draw_text(960 - string_width(txt) / 2, 540 - string_height(txt) / 2, txt)
		} else if array_length(grupos_davi) == 3 and array_length(cartas_davi) == 0 {
			var txt = "Davi venceu!"
			draw_text(960 - string_width(txt) / 2, 540 - string_height(txt) / 2, txt)
		}
		
	}
}
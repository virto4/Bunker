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
	draw_set_font(fnt_dialogos_menor)
	draw_set_color(c_black)
	draw_text(_x - 29, _y - 56, n)
	draw_text_transformed(_x + 29, _y + 56, n, 1, 1, 180)
}

if clicou {
	draw_sprite_ext(spr_interface_mesa, 0, 960, 540, 4, 4, 0, c_white, 1)
	draw_sprite(spr_voltar, 0, 1800, 50)
	
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	
	if sua_vez {
		if !comprar {
			msg = "Compre uma carta de uma das pilhas"
			if point_in_rectangle(mx, my, 800 - 37.5, 540 - 60, 800 + 37.5, 540 + 60) {
				draw_rectangle_color(800 - 37.5, 540 - 70, 800 + 47.5, 540 + 60, c_white, c_white, c_white, c_white, false) 
				if mouse_check_button_pressed(mb_left) {
					comprar = true
					array_push(cartas_roger, cartas_comprar[0])
					array_delete(cartas_comprar, 0, 1)
				}
			} 
			if point_in_rectangle(mx, my, 1220 - 37.5, 540 - 60, 1220 + 37.5, 540 + 60) and carta_monte != 0 {
				draw_rectangle_color(1220 - 42.5, 540 - 65, 1220 + 42.5, 540 + 65, c_white, c_white, c_white, c_white, false) 
				if mouse_check_button_pressed(mb_left) {
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
		msg = "Vez de Davi"
		draw_text(960 - string_width(msg) / 2, 100, msg)
	} else {
		draw_text(960 - string_width(msg) / 2, 100, msg)
	}
	draw_set_alpha(1)
	
	draw_sprite(spr_carta_atras, 0, 700, 540)
	if carta_monte != 0 {
		desenhar(carta_monte.numero, carta_monte.naipe, 1220, 540)
	}
	var xis = (1920 - 85 * array_length(cartas_roger)) / 2
	for (var i = 0; i < array_length(cartas_roger); i++) {
		if comprar and !descartar and sua_vez {
			if point_in_rectangle(mx, my, xis + 85 * i - 37.5, 1000 - 60, xis + 85 * i + 37.5, 1000 + 60) and carta_monte_passada != cartas_roger[i] {
				draw_rectangle_color(xis + 85 * i - 42.5 , 1000 - 65, xis + 85 * i + 42.5, 1000 + 65, c_white, c_white, c_white, c_white, false) 
				if mouse_check_button_pressed(mb_left) {
					array_push(cartas_comprar, carta_monte_passada) //coloca a carta que nunca mais será utilizada no fundo da pilha de comprar, porque eu só preciso guardar as 2 primeiras cartasd a pilha
					carta_monte_passada = carta_monte
					carta_monte = cartas_roger[i]
					array_delete(cartas_roger, i, 1)
					descartar = true
				}
			}
		}
		if i < array_length(cartas_roger) {
			desenhar(cartas_roger[i].numero, cartas_roger[i].naipe, xis + 85 * i, 1000)
		}
	}
	
	//tem´porario
	var xis2 = (1920 - 85 * array_length(cartas_davi)) / 2
	for (var i = 0; i < array_length(cartas_davi); i++) {
		desenhar(cartas_davi[i].numero, cartas_davi[i].naipe, xis2 + 85 * i, 200)
		draw_set_font(fnt_dialogos)
		draw_text(xis2 + 85 * i, 200 + 60 + 10, cartas_davi[i].valor)
	}
}
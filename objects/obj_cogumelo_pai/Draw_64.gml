if obj_controlador_evento.clicou_cogumelo {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, obj_controlador_evento.scale_cogumelo, obj_controlador_evento.scale_cogumelo, 0, c_white, 1)
	if obj_controlador_evento.scale_cogumelo < 5 {
		obj_controlador_evento.scale_cogumelo += 0.5
	} else {
		var mx = device_mouse_x_to_gui(0)
		var my = device_mouse_y_to_gui(0)
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text(220, 800, "O que você deseja fazer com este cogumelo?")
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		var largura_davi = string_width("Dar a Davi")
		var altura = string_height("A")
		var largura_consumir = string_width("Consumir")
		var largura_destruir = string_width("Destruir")
		var largura_nada = string_width("Nada")
		var coordenada = [
			[280, 930, 280 + largura_consumir + 20, 930 + altura + 10],
			[733 - largura_davi / 2 - 10, 930, 733 + largura_davi / 2 + 10, 930 + altura + 10],
			[1187 - largura_destruir / 2 - 10, 930, 1187 + largura_destruir / 2 + 10, 930 + altura + 10],
			[1640 - largura_nada - 10, 930, 1650, 930 + altura + 10]
		]
		if point_in_rectangle(mx, my, coordenada[0][0], coordenada[0][1], coordenada[0][2], coordenada[0][3]) {
			if mouse_check_button_pressed(mb_left) {
				obj_controlador_evento.tirar = true
				obj_controlador_evento.clicou_cogumelo = false
				obj_controlador_evento.destruir = true
				if object_index == obj_cogumelo_roxo {
					obj_personagem.aumento_saude = 100 - obj_personagem.atributos.saude
					obj_personagem.atributos.saude = 100
					obj_personagem.tomou_remedio = true
				} else if object_index = obj_cogumelo_verde {
					obj_personagem.aumento_fome = 100 - obj_personagem.atributos.fome
					obj_personagem.atributos.fome = 100
					obj_personagem.alimentou = true
				} else {
					obj_personagem.perdeu_vida = 50
					obj_personagem.atributos.saude -= 50
					obj_personagem.tomou_remedio = true
				}
			}
			if !obj_controlador_evento.primeiro {
				obj_controlador_evento.primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(coordenada[0][0], coordenada[0][1], coordenada[0][2], coordenada[0][3], #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(coordenada[0][0] + 5, coordenada[0][1] + 5, coordenada[0][2] - 5, coordenada[0][3] - 5, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			obj_controlador_evento.primeiro = false
		}
		draw_text(300, 940, "Consumir")
		if point_in_rectangle(mx, my, coordenada[1][0], coordenada[1][1], coordenada[1][2], coordenada[1][3]) {
			if mouse_check_button_pressed(mb_left) {
				obj_controlador_evento.tirar = true
				obj_controlador_evento.clicou_cogumelo = false
				obj_controlador_evento.destruir = true
				if object_index == obj_cogumelo_roxo {
					obj_davi.aumento_saude = 100 - obj_davi.atributos.saude
					obj_davi.atributos.saude = 100
					obj_davi.tomou_remedio = true
				} else if object_index = obj_cogumelo_verde {
					obj_davi.aumento_fome = 100 - obj_davi.atributos.fome
					obj_davi.atributos.fome = 100
					obj_davi.alimentou = true
				} else {
					obj_davi.perdeu_vida = 50
					obj_davi.atributos.saude -= 50
					obj_davi.tomou_remedio = true
				}
			}
			if !obj_controlador_evento.segundo {
				obj_controlador_evento.segundo = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(coordenada[1][0], coordenada[1][1], coordenada[1][2], coordenada[1][3], #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(coordenada[1][0] + 5, coordenada[1][1] + 5, coordenada[1][2] - 5, coordenada[1][3] - 5, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			obj_controlador_evento.segundo = false
		}
		draw_text(733 - largura_davi / 2, 940, "Dar a Davi")
		if point_in_rectangle(mx, my, coordenada[2][0], coordenada[2][1], coordenada[2][2], coordenada[2][3]) {
			if mouse_check_button_pressed(mb_left) {
				obj_controlador_evento.tirar = true
				obj_controlador_evento.clicou_cogumelo = false
				obj_controlador_evento.destruir = true
			}
			if !obj_controlador_evento.terceiro {
				obj_controlador_evento.terceiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(coordenada[2][0], coordenada[2][1], coordenada[2][2], coordenada[2][3], #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(coordenada[2][0] + 5, coordenada[2][1] + 5, coordenada[2][2] - 5, coordenada[2][3] - 5, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			obj_controlador_evento.terceiro = false
		}
		draw_text(1187 - largura_destruir / 2, 940, "Destruir")
		if point_in_rectangle(mx, my, coordenada[3][0], coordenada[3][1], coordenada[3][2], coordenada[3][3]) {
			if mouse_check_button_pressed(mb_left) {
				obj_controlador_evento.tirar = true
				obj_controlador_evento.clicou_cogumelo = false
			}
			if !obj_controlador_evento.quarto {
				obj_controlador_evento.quarto = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(coordenada[3][0], coordenada[3][1], coordenada[3][2], coordenada[3][3], #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(coordenada[3][0] + 5, coordenada[3][1] + 5, coordenada[3][2] - 5, coordenada[3][3] - 5, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			obj_controlador_evento.quarto = false
		}
		draw_text(1640 - largura_nada, 940, "Nada")
	}
}

if obj_controlador_evento.tirar {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, obj_controlador_evento.scale_cogumelo, obj_controlador_evento.scale_cogumelo, 0, c_white, 1)
	if obj_controlador_evento.scale_cogumelo > 0 {
		obj_controlador_evento.scale_cogumelo -= 0.5
	} else {
		global.tem_tela_aberta = false
		obj_controlador_evento.tirar = false
		if obj_controlador_evento.destruir {
			obj_controlador_evento.destruir = false
			with obj_controlador_evento.instancia_clicada {
				instance_destroy()
			}
		}
	}
}
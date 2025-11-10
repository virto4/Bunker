function acerto_de_contas(objeto_vendido, objeto_comprado) {
	variable_struct_set(obj_personagem.qtde_itens1, object_get_name(objeto_vendido), variable_struct_get(obj_personagem.qtde_itens1, object_get_name(objeto_vendido)) - 1)
	var is_alimento = false
	for (var i = 0; i < array_length(global.alimentos); i++) {
		if objeto_vendido == global.alimentos[i] {
			is_alimento = true
		}
	}
	var is_consumivel = true
	for (var i = 0; i < array_length(obj_personagem.itens_nao_consumiveis); i++) {
		if obj_personagem.itens_nao_consumiveis[i] == objeto_vendido {
			is_consumivel = false
		}
	}
	var slotn = -1
	if obj_personagem.slot1 == objeto_vendido {
		slotn = obj_personagem.slot1_n
	} else if obj_personagem.slot2 == objeto_vendido {
		slotn = obj_personagem.slot2_n
	} else if obj_personagem.slot3 == objeto_vendido {
		slotn = obj_personagem.slot3_n
	} else if obj_personagem.slot4 == objeto_vendido {
		slotn = obj_personagem.slot4_n
	} else if obj_personagem.slot5 == objeto_vendido {
		slotn = obj_personagem.slot5_n
	} else if is_alimento {
		for (var i = 0; i < array_length(obj_freezer.quantidades); i++) {
			if obj_freezer.quantidades[i][0] == objeto_vendido {
				obj_freezer.quantidades[i][1] -= 1
			}
		}
	} else if is_consumivel {
		objeto_vendido.qtde_itens--
		//variable_instance_set(objeto_vendido, qtde_itens, variable_instance_get(objeto_vendido, qtde_itens) - 1)
		if objeto_vendido.qtde_itens == 0 {
			instance_destroy(objeto_vendido)
		}
	} else {
		instance_destroy(objeto_vendido)
	}
	if slotn != -1 {
		if obj_personagem.slot1_n == slotn {
			obj_personagem.slot1 = noone
			obj_freezer.slot1_novo = false
		} 
		if obj_personagem.slot2_n == slotn {
			obj_personagem.slot2 = noone
			obj_personagem.slot2_novo = false
		} 
		if obj_personagem.slot3_n == slotn {
			obj_personagem.slot3 = noone
			obj_personagem.slot3_novo = false
		} 
		if obj_personagem.slot4_n == slotn {
			obj_personagem.slot4 = noone
			obj_personagem.slot4_novo = false
		} 
		if obj_personagem.slot5_n == slotn {
			obj_personagem.slot5 = noone
			obj_personagem.slot5_novo = false
		}
	}
	variable_struct_set(obj_personagem.qtde_itens1, object_get_name(objeto_comprado), variable_struct_get(obj_personagem.qtde_itens1, object_get_name(objeto_comprado)) + 1)
	var is_alimento2 = false
	for (var i = 0; i < array_length(global.alimentos); i++) {
		if global.alimentos[i] == objeto_comprado {
			is_alimento2 = true
		}
	}
	if is_alimento2 {
		for (var i = 0; i < array_length(obj_freezer.quantidades); i++) {
			if obj_freezer.quantidades[i][0] == objeto_comprado {
				obj_freezer.quantidades[i][1] += 1
			}
		}
	}
	if !is_alimento2 {
		if !instance_exists(objeto_comprado) {
			var xis = variable_struct_get(variable_struct_get(global.posicoes, object_get_name(objeto_comprado)), "x")
			var ipsilon = variable_struct_get(variable_struct_get(global.posicoes, object_get_name(objeto_comprado)), "y")
			instance_create_layer(xis, ipsilon, "Instances", objeto_comprado, {})
		} else {
			variable_instance_set(objeto_comprado, qtde_itens, variable_instance_get(objeto_comprado, qtde_itens) + 1)
		}
	}
}


if interagir_comerciante {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	if scale < 5 {
		scale += 0.5
	} else {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		var largura = string_width("Comerciante")
		var altura = 640 - (78 - string_height("A")) / 2
		draw_sprite_part_ext(spr_dialogo, 0, 0, 0, 10, 60, 160, altura, 1.3, 1.3, c_white, 1)
		var xis = 0
		for (var i = 0; i < largura / 10; i++) {
			draw_sprite_part_ext(spr_dialogo, 0, 10, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
			xis += 10
		}
		draw_sprite_part_ext(spr_dialogo, 0, 310, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
		draw_text(170, 640, "Comerciante")
		draw_text_ext(210, 760, "Bom dia, habitantes dessa humilde residência. Sou um velho latoeiro que circunda por essas bandas trocando coisas que podem ser úteis. Funciona assim: ofereço alguns itens meus em troca de alguns seus. Vamos fazer negócios?", 30, 1520)
		var mx = device_mouse_x_to_gui(0)
		var my = device_mouse_y_to_gui(0)
		if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			if mouse_check_button_pressed(mb_left) {
				sair = true
				interagir2 = true
				interagir_comerciante = false
			}
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Sim")
		if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if !segundo {
				segundo = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			if mouse_check_button_pressed(mb_left) {
				sair = true
				interagir_comerciante = false
				global.tem_tela_aberta = false
			}
		} else {
			segundo = false
		}
		draw_text(1620, 940, "Não")
	}
}

if sair {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	if scale > 0 {
		scale -= 0.5
	} else {
		sair = false
	}
}

if !sair and interagir2 {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, 0.4)
	var width_sair = sprite_get_width(spr_voltar) / 2
	var height_sair = sprite_get_height(spr_voltar) / 2 
	var tx_sair = 1800
	var ty_sair = 50

	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if mouse_check_button_pressed(mb_left) {
		if mx > tx_sair - width_sair and mx < tx_sair + width_sair and my > ty_sair - height_sair and my < ty_sair + height_sair {
			interagir2 = false
			despedida = true
		}
	}
	draw_sprite(spr_voltar, 0, 1800, 50)
	draw_rectangle_color(560, 80, 1360, 1000, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
	draw_rectangle_color(570, 90, 1350, 990, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
	for (var i = 0; i < 6; i++) {
		var is_consumivel = true
		var pode_nao = true
		for (var j = 0; j < array_length(obj_personagem.itens_nao_consumiveis); j++) {
			if obj_personagem.itens_nao_consumiveis[j] == itens_comerciante[i] {
				is_consumivel = false
			}
		}
		if !is_consumivel and instance_exists(itens_comerciante[i]) {
			pode_nao = false
		}
		if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 570, 90 + i * 150, 1350, 235 + i * 150) {
			draw_rectangle_color(570, 90 + i * 150, 1350, 235 + i * 150, #E5C444, #E5C444, #E5C444, #E5C444, false)
			if mouse_check_button_pressed(mb_left) {
				if variable_struct_get(obj_personagem.qtde_itens1, object_get_name(itens_jogador[i])) >= 1 and pode_nao {
					acerto_de_contas(itens_jogador[i], itens_comerciante[i])
					audio_play_sound(snd_menu_in, 1, false)
				}
			}
		}
		var scale_comerciante = 1
		if sprite_get_height(object_get_sprite(itens_comerciante[i])) > sprite_get_width(object_get_sprite(itens_comerciante[i])) {
			scale_comerciante = 128 / sprite_get_height(object_get_sprite(itens_comerciante[i]))
		} else {
			scale_comerciante = 128 / sprite_get_width(object_get_sprite(itens_comerciante[i]))
		}
		var scale_jogador = 1
		if sprite_get_height(object_get_sprite(itens_jogador[i])) > sprite_get_width(object_get_sprite(itens_jogador[i])) {
			scale_jogador = 128 / sprite_get_height(object_get_sprite(itens_jogador[i]))
		} else {
			scale_jogador = 128 / sprite_get_width(object_get_sprite(itens_jogador[i]))
		}
		draw_sprite_ext(object_get_sprite(itens_comerciante[i]), 0, 1210, 165 + i * 150, scale_comerciante, scale_comerciante, 0, c_white, 1)
		draw_sprite_ext(object_get_sprite(itens_jogador[i]), 0, 710, 165 + i * 150, scale_jogador, scale_jogador, 0, c_white, 1)
		var sprite = noone
		if variable_struct_get(obj_personagem.qtde_itens1, object_get_name(itens_jogador[i])) >= 1 and pode_nao {
			sprite = spr_seta
		} else {
			sprite = spr_seta_cancelar
		}
		draw_sprite_ext(sprite, 0, 960, 165 + i * 150, 1, 1, 0, c_white, 1)
		draw_line_width_colour(560, 240, 1360, 240, 10, #7F5E25, #7F5E25)
		draw_line_width_colour(560, 390, 1360, 390, 10, #7F5E25, #7F5E25)
		draw_line_width_colour(560, 540, 1360, 540, 10, #7F5E25, #7F5E25)
		draw_line_width_colour(560, 690, 1360, 690, 10, #7F5E25, #7F5E25)
		draw_line_width_colour(560, 840, 1360, 840, 10, #7F5E25, #7F5E25)
	}
}
if despedida {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	if scale < 5 and !tirar_final {
		scale += 0.5
	} else if !tirar_final {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		var largura = string_width("Comerciante")
		var altura = 640 - (78 - string_height("A")) / 2
		draw_sprite_part_ext(spr_dialogo, 0, 0, 0, 10, 60, 160, altura, 1.3, 1.3, c_white, 1)
		var xis = 0
		for (var i = 0; i < largura / 10; i++) {
			draw_sprite_part_ext(spr_dialogo, 0, 10, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
			xis += 10
		}
		draw_sprite_part_ext(spr_dialogo, 0, 310, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
		draw_text_ext(210, 760, "Foi um prazer falar com você, até uma próxima vez!", 30, 1520)
		draw_text(170, 640, "Comerciante")
		if mouse_check_button_pressed(mb_left) {
			tirar_final = true
		}
	} else if tirar_final {
		if scale > 0 {
			scale -= 0.5
		} else {
			tirar_final = false
			despedida = false
			global.tem_tela_aberta = false
			evento_comerciante = false
		}
	}
}
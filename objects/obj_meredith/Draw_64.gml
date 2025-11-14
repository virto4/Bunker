/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if question {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, fala_scale, fala_scale, 0, c_white, 1)
	if fala_scale < 5 {
		fala_scale += 0.5
	} else if fala_scale >= 5 {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text_ext(210, 760, "Meredith está doente. Você gostaria de dar um remédio para ela? (Você não sabe se vai funcioanr ou não)", 30, 1520)
		var mx = device_mouse_x_to_gui(0)
		var my = device_mouse_y_to_gui(0)
		if point_in_rectangle(mx, my, 280, 920, 320 + largura_sim, 960 + altura_sim) {
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				global.tem_tela_aberta = false
				deu_remedio = true
				question = false
				etapa2 = true
				variable_struct_set(obj_personagem.qtde_itens1, object_get_name(obj_personagem.item_selecionado), variable_struct_get(obj_personagem.qtde_itens1,  object_get_name(obj_personagem.item_selecionado)) - 1)
				var slot = 0
				switch obj_personagem.slot_selecionado {
					case 1:
						slot = obj_personagem.slot1_n
						break
					case 2:
						slot = obj_personagem.slot2_n
						break
					case 3:
						slot = obj_personagem.slot3_n
						break
					case 4:
						slot = obj_personagem.slot4_n
						break
					case 5:
						slot = obj_personagem.slot5_n
						break
				}
				
				if obj_personagem.slot1_n == slot {
					obj_personagem.slot1 = noone
					obj_personagem.slot1_novo = false
				} 
				if obj_personagem.slot2_n == slot {
					obj_personagem.slot2 = noone
					obj_personagem.slot2_novo = false
				} 
				if obj_personagem.slot3_n == slot {
					obj_personagem.slot3 = noone
					obj_personagem.slot3_novo = false
				} 
				if obj_personagem.slot4_n == slot {
					obj_personagem.slot4 = noone
					obj_personagem.slot4_novo = false
				} 
				if obj_personagem.slot5_n == slot {
					obj_personagem.slot5 = noone
					obj_personagem.slot5_novo = false
				}
			}
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Sim")
		if point_in_rectangle(mx, my, 1600, 920, 1640 + largura_nao, 960 + altura_nao) {
			if !segundo {
				segundo = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				question = false
				etapa2 = true
				global.tem_tela_aberta = false
			}
		} else {
			segundo = false
		}
		draw_text(1620, 940, "Não")
	}
}

if !global.tem_tela_aberta {
	if tem_fala {
		if point_in_rectangle(mouse_x, mouse_y, x - 20, y - 20, x + 20, y + 20) {
			variable_struct_set(obj_cursor.interagir, "meredith", true)
			if mouse_check_button_pressed(mb_left) {
				for (var i = 0; i < array_length(global.remedios); i++) {
					if obj_personagem.item_selecionado == global.remedios[i] {
						question = true
					}
				}
				if !question {
					etapa = true
					tempo_fala = current_time + type_speed
					global.tem_tela_aberta = true
				}
			}
		} else {
			variable_struct_set(obj_cursor.interagir, "meredith", false)
		}
	}
}

if etapa {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, fala_scale, fala_scale, 0, c_white, 1)
	if fala_scale < 5 {
		fala_scale += 0.5
	} else if fala_scale >= 5 {
		etapa = false
		mostrar = true
	}
}
if tem_fala {
	draw_set_font(fnt_dialogos)
	draw_set_color(c_black)
	if mostrar {
		if current_time > tempo_fala {
			if char_index < string_length(msg) {
				char_index++
			}
			tempo_fala = current_time + type_speed
		}
		draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, 5, 5, 0, c_white, 1)
		draw_text_ext(210, 760, string_copy(msg, 1, char_index), 30, 1520)
		var largura = string_width("Meredith")
		var altura = 640 - (78 - string_height("A")) / 2
		draw_sprite_part_ext(spr_dialogo, 0, 0, 0, 10, 60, 160, altura, 1.3, 1.3, c_white, 1)
		var xis = 0
		for (var i = 0; i < largura / 10; i++) {
			draw_sprite_part_ext(spr_dialogo, 0, 10, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
			xis += 10
		}
		draw_sprite_part_ext(spr_dialogo, 0, 310, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
		draw_text(170, 640, "Meredith")
		draw_sprite_ext(spr_retrato, 0, 1632, 552, 1, 1, 0, c_white, 1)
		draw_sprite_ext(spr_retrato_meredith, 0, 1632, 552, 2, 2, 0, c_white, 1)
		if mouse_check_button_pressed(mb_left) and aux {
			if char_index < string_length(msg) {
				char_index = string_length(msg)
			} else {
				if instance_exists(obj_davi) {
					obj_davi.sao = true
					obj_davi.aumento_sanidade = 5
				}
				obj_personagem.sao = true
				obj_personagem.aumento_sanidade = 5
				variable_struct_set(obj_cursor.interagir, "meredith", false)
				tem_fala = false
				mostrar = false
				global.tem_tela_aberta = false
				aux = false
				current_text = ""
				char_index = 0
				etapa2 = true
			}
		} else if !aux and mouse_check_button_pressed(mb_left) {
			aux = true
		}
	}
}

if etapa2 {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, fala_scale, fala_scale, 0, c_white, 1)
	if fala_scale > 0 {
		fala_scale -= 0.5
	} else if fala_scale == 0 {
		etapa2 = false
		mostrar = false
	}
}
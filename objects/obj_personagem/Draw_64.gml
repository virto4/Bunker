//200 - 400 - 1800

var mousex = device_mouse_x_to_gui(0)
var mousey = device_mouse_y_to_gui(0)

if room == rm_casa {
	if point_distance(x, y, 1100, 1040) < 250 and !global.tem_tela_aberta and point_in_rectangle(mouse_x, mouse_y, 1026, 1023, 1180, 1055) and !tutorial {
		if mouse_check_button_pressed(mb_left) {
			sair_casa = true
			global.tem_tela_aberta = true
		}
	}
}

if morreu_casa2 {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_casa)
	if alpha_casa < 1 {
		alpha_casa += 0.02
	} else {
		morreu_casa = false
		game_over = true
		msg_game_over = "Você decidiu sair de casa e não conseguiu chegar ao Bunker a tempo."
	}
}

if sair_casa { //vou usar a variavel banheiro pois nao quero fazer outra 
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, banheiro_scale, banheiro_scale, 0, c_white, 1)
	if banheiro_scale < 5 {
		banheiro_scale += 0.5
	} else if banheiro_scale >= 5 {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text(220, 800, "Você deseja sair de casa?")
		if point_in_rectangle(mousex, mousey, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				sair_casa = false
				morreu_casa = true
				tirar_banheiro = true
			}
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Sim")
		if point_in_rectangle(mousex, mousey, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
			if !segundo {
				segundo = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				tirar_banheiro = true
				sair_casa = false
				sm = true
			}
		} else {
			segundo = false
		}
		draw_text(1620, 940, "Não")
	}
}

if room == rm_bunker and item_selecionado == obj_contador_geiger {
	entrou_geiger = true
	draw_sprite_ext(spr_interface_geiger, frame_geiger, 480, y_geiger, 4, 4, 0, c_white, 1)
	if y_geiger > 952 {
		y_geiger -= 3 
	}
	if !hoje_tem {
		frame_geiger = sprite_get_number(spr_interface_geiger) - 1
	} else {
		var distancia = point_distance(hoje[0], hoje[1], obj_personagem.x, obj_personagem.y + 50)
		if distancia < 100 {
			frame_geiger = 0
		} else if distancia < 1000 {
			frame_geiger = floor((distancia - 122) / 22) 
		} else {
			frame_geiger = sprite_get_number(spr_interface_geiger) - 1
		}
	}
	/*
	distancia -- frame
	(1000 - d) / (d - 100) = (51 - x) / (x - 1)--> x = (d - 122) / 22
	*/
} else if entrou_geiger {
	draw_sprite_ext(spr_interface_geiger, frame_geiger, 480, y_geiger, 4, 4, 0, c_white, 1)
	if y_geiger < 1080 + 128 {
		y_geiger += 3
	} else {
		entrou_geiger = false
	}
}

if question_chumbo {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale_chumbo, scale_chumbo, 0, c_white, 1)
	if scale_chumbo < 5 {
		scale_chumbo += 0.5
	} else {
		var mx = device_mouse_x_to_gui(0)
		var my = device_mouse_y_to_gui(0)
		draw_set_color(c_black)
		draw_set_font(fnt_dialogos)
		draw_text_ext(210, 760, "Você deseja gastar uma unidade de Chumbo para eliminar esse vazamento de radiação?", 40, 1520)
		if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
			if mouse_check_button_pressed(mb_left) {
				variable_struct_set(qtde_itens1, "obj_chumbo", variable_struct_get(qtde_itens1, "obj_chumbo") - 1)
				var slot_n = 0
				switch slot_selecionado {
					case 1:
						slot_n = slot1_n
						break
					case 2: 
						slot_n = slot2_n
						break
					case 3:
						slot_n = slot3_n
						break
					case 4:
						slot_n = slot4_n
						break
					case 5:
						slot_n = slot5_n
						break
				}
				
				if slot1_n == slot_n {
					slot1 = noone
					slot1_novo = false
				} 
				if slot2_n == slot_n {
					slot2 = noone
					slot2_novo = false
				} 
				if slot3_n == slot_n {
					slot3 = noone
					slot3_novo = false
				} 
				if slot4_n == slot_n {
					slot4 = noone
					slot4_novo = false
				} 
				if slot5_n == slot_n {
					slot5 = noone
					slot5_novo = false
				}
				tirar_chumbo = true
				question_chumbo = false
				novo = true
				hoje_tem = false
				if instance_exists(obj_davi) and ativada {
					obj_davi.doencas.Radiacao[0] = false
					obj_davi.atributos.saude = 100
				}
				doencas.Radiacao[0] = false
				atributos.saude = 100
				resolveu = true
			}
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Sim")
		if  point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
			if mouse_check_button_pressed(mb_left) {
				tirar_chumbo = true
				question_chumbo = false
			}
			if !segundo {
				segundo = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			segundo = false
		}
		draw_text(1620, 940, "Não")
	}
}

if tirar_chumbo {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale_chumbo, scale_chumbo, 0, c_white, 1)
	if scale_chumbo > 0 {
		scale_chumbo -= 0.5
	} else {
		tirar_chumbo = false
		global.tem_tela_aberta = false
	}
}
var _mes = 0
if room == rm_bunker {
	if !vermelho {
		draw_circle_color(50, 50, 50, c_red, c_red,false)
	}
	draw_sprite_ext(spr_exclamacao, 0, 50, 50, 2, 2, 0, c_white, 1)
	if mouse_check_button_pressed(mb_left) and !global.tem_tela_aberta {
		if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 50 - 48, 50 - 48, 50 + 48, 50 + 48) {
			instrucoes = true
			vermelho = true
			global.tem_tela_aberta = true
		}
	}
	
	switch obj_calendario.mes_atual {
		case 7:	
			_mes = "Julho"
			break
		case 8:
			_mes = "Agosto"
			break
		case 9:	
			_mes = "Setembro"
			break
		case 10:
			_mes = "Outubro"
			break
		case 11:
			_mes = "Novembro"
			break
		case 12:
			_mes = "Dezembro"
			break
	}
}

if morte_meredith {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, 1)
	if !pode_tocar and !audio_is_playing(snd_marcha_funebre) {
		audio_stop_all()
		pode_tocar = true
	}
	if !audio_is_playing(snd_marcha_funebre) {
		audio_play_sound(snd_marcha_funebre, 1, true)
	}
	if !aux1 {
		aux1 = true
		tempo_over = current_time / 1000 + 1.5
	}
	draw_set_font(fnt_alagard)
	draw_set_color(c_white)
	var _txt = "Meredith morreu"
	var msg_meredith = "Meredith sucumbiu devido à ingestão de compostos químicos inapropriados à sua espécie"
	draw_text(960 - string_width(_txt) / 2, 540 - string_height(_txt), _txt)
	draw_set_font(fnt_dialogos)
	if tempo_over < current_time / 1000 {
		draw_text(960 - string_width(msg_meredith) / 2, 660, msg_meredith)
		if pode_comecarb {
			tempo_over2 = current_time / 1000 + 1.5
			pode_comecarb = false
		}
	}
	if tempo_over2 < current_time / 1000 and !pode_comecarb {
		var data_morte = "Data da morte: " + string(obj_calendario.dia_atual) + " de " + string(_mes)
		draw_text(960 - string_width(data_morte) / 2, 760, data_morte)
		if pode_comecarc {
			tempo_over3 = current_time / 1000 + 1.5
			pode_comecarc = false
		}
	}
	if tempo_over3 < current_time / 1000 and !pode_comecarc {
		var msg_tela_inicial = "Voltar para o jogo"
		var xinicial = 960 - string_width(msg_tela_inicial) / 2 - 5
		var xfinal = xinicial + string_width(msg_tela_inicial) + 5
		var yinicial = 860 - 5
		var yfinal = 860 + string_height(msg_tela_inicial) + 5
		draw_rectangle_color(xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5, cor_botao, cor_botao, cor_botao, cor_botao, false)
		draw_rectangle_color(xinicial, yinicial, xfinal, yfinal, c_black, c_black, c_black, c_black, false)
		draw_text(960 - string_width(msg_tela_inicial) / 2, 860, msg_tela_inicial)
		if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5) {
			cor_botao = #527F7F
			if mouse_check_button_pressed(mb_left) {
				etapa2_morte = true
				instance_destroy(obj_meredith)
			}
		} else {
			cor_botao = c_white
		}
	}
	if etapa2_morte {
		morte_meredith = false
		etapa2_morte = false
		alpha_morte = 0
		aux1 = false
		aux2 = false
		tempo_over = 0
		pode_comecarb = true
		pode_comecarc = true
		tempo_over2 = 0
		tempo_over3 = 0
		pode_tocar = false
		cor_botao = c_white
		obituario = true
		for (m = 0; m < array_length(morreram); m++) {
			if morreram[m] == obj_meredith {
				array_delete(morreram, m, 1)
			}
		}
	}
}

if morte_davi {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, 1)
	if !pode_tocar and !audio_is_playing(snd_marcha_funebre) {
		audio_stop_all()
		pode_tocar = true
	}
	if !audio_is_playing(snd_marcha_funebre) {
		audio_play_sound(snd_marcha_funebre, 1, true)
	}
	if !aux1 {
		aux1 = true
		tempo_over = current_time / 1000 + 1.5
	}
	draw_set_font(fnt_alagard)
	draw_set_color(c_white)
	var _txt = "Davi morreu"
	draw_text(960 - string_width(_txt) / 2, 540 - string_height(_txt), _txt)
	draw_set_font(fnt_dialogos)
	if tempo_over < current_time / 1000 {
		draw_text(960 - string_width(msg_davi) / 2, 660, msg_davi)
		if pode_comecarb {
			tempo_over2 = current_time / 1000 + 1.5
			pode_comecarb = false
		}
	}
	if tempo_over2 < current_time / 1000 and !pode_comecarb {
		var data_morte = "Data da morte: " + string(obj_calendario.dia_atual) + " de " + string(_mes)
		draw_text(960 - string_width(data_morte) / 2, 760, data_morte)
		if pode_comecarc {
			tempo_over3 = current_time / 1000 + 1.5
			pode_comecarc = false
		}
	}
	if tempo_over3 < current_time / 1000 and !pode_comecarc {
		var msg_tela_inicial = "Voltar para o jogo"
		var xinicial = 960 - string_width(msg_tela_inicial) / 2 - 5
		var xfinal = xinicial + string_width(msg_tela_inicial) + 5
		var yinicial = 860 - 5
		var yfinal = 860 + string_height(msg_tela_inicial) + 5
		draw_rectangle_color(xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5, cor_botao, cor_botao, cor_botao, cor_botao, false)
		draw_rectangle_color(xinicial, yinicial, xfinal, yfinal, c_black, c_black, c_black, c_black, false)
		draw_text(960 - string_width(msg_tela_inicial) / 2, 860, msg_tela_inicial)
		if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5) {
			cor_botao = #527F7F
			if mouse_check_button_pressed(mb_left) {
				audio_stop_sound(snd_marcha_funebre)
				etapa2_morte = true
				instance_destroy(obj_davi)
			}
		} else {
			cor_botao = c_white
		}
	} 
	if etapa2_morte {
		morte_davi = false
		msg_davi = ""
		etapa2_morte = false
		alpha_morte = 0
		aux1 = false
		aux2 = false
		tempo_over = 0
		pode_comecarb = true
		pode_comecarc = true
		tempo_over2 = 0
		tempo_over3 = 0
		pode_tocar = false
		cor_botao = c_white
		obituario = true
		for (m = 0; m < array_length(morreram); m++) {
			if morreram[m] == obj_davi {
				array_delete(morreram, m, 1)
			}
		}
	}
}

if ganhou_jogo {
	global.tem_tela_aberta = true
	audio_play_sound(snd_adagio, 1, false)
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_final)
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, scale_final, scale_final, 0, c_white, 1)
	if !escureceu_final {
		if alpha_final < 1 {
			alpha_final += 1.5 * delta_time / 1000000
		} else {
			escureceu_final = true
		}
	} else if !voltar_menu {
		if scale_final < 5 {
			scale_final += 0.5
		} else {
			draw_set_color(c_black)
			draw_set_font(fnt_dialogos)
			if final_secreto and !pode_comecar_falas {
				falas_utilizadas = falas_secreto
				pode_comecar_falas = true
				tempo_final = current_time + type_speed
			}
			
			if current_time > tempo_final {
				if char_index < string_length(falas_utilizadas[indice_atual]) {
					if (!audio_is_playing(snd_dialogo_escrito)) {
				        audio_play_sound(snd_dialogo_escrito, 1, true);
				    }
					char_index++
				} else {
					audio_stop_sound(snd_dialogo_escrito)
				}
				tempo_final = current_time + type_speed
			}
			draw_text_ext(210, 760, string_copy(falas_utilizadas[indice_atual], 1, char_index), 30, 1520)
			if mouse_check_button_pressed(mb_left) {
				if char_index < string_length(falas_utilizadas[indice_atual]) {
					current_text = falas_utilizadas[indice_atual]
					char_index = string_length(falas_utilizadas[indice_atual])
				} else {
					if indice_atual == array_length(falas_utilizadas) - 1 {
						voltar_menu = true
						char_index = 0
						indice_atual = 0
					} else {
						char_index = 0
						indice_atual++
					}
				}
			}
		}
	} else {
		if scale_final > 0 {
			scale_final -= 0.5
		} else {
			draw_set_color(c_white)
			draw_set_font(fnt_dialogos)
			draw_sprite_ext(spr_logo, 0, 960, 300, 4, 4, 0, c_white, alpha_logo)
			if alpha_logo < 1 {
				alpha_logo += 0.02
			} else if !bbb {
				bbb = true
				tempo_over = current_time / 1000 + 1.5
			}
			if tempo_over < current_time / 1000 and bbb {
				var msg = "Você zerou o jogo. Obrigado!"
				draw_text(960 - string_width(msg) / 2, 660, msg)
				if !aux1 {
					tempo_over2 = current_time / 1000 + 1.5
					aux1 = true
				}
			}
			if tempo_over2 < current_time / 1000 and aux1 {
				var devs = "Desenvolvedores: Vitor Marian (Programador) e João Marlon Meneghelli (Designer)"
				draw_text(960 - string_width(devs) / 2, 760, devs)
				if !aux2 {
					tempo_over3 = current_time / 1000 + 1.5
					aux2 = true
				}
			}
			if tempo_over3 < current_time / 1000 and aux2 {
				var msg_tela_inicial = "Voltar para tela inicial"
				var xinicial = 960 - string_width(msg_tela_inicial) / 2 - 5
				var xfinal = xinicial + string_width(msg_tela_inicial) + 5
				var yinicial = 860 - 5
				var yfinal = 860 + string_height(msg_tela_inicial) + 5
				draw_rectangle_color(xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5, cor_botao, cor_botao, cor_botao, cor_botao, false)
				draw_rectangle_color(xinicial, yinicial, xfinal, yfinal, c_black, c_black, c_black, c_black, false)
				draw_text(960 - string_width(msg_tela_inicial) / 2, 860, msg_tela_inicial)
				if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5) {
					cor_botao = #527F7F
					if mouse_check_button_pressed(mb_left) {
						room_goto(rm_tela_inicial)
						audio_stop_all()
					}
				} else {
					cor_botao = c_white
				}
			}
		}
	}
}

if instrucoes {
	draw_sprite(spr_voltar, 0, 1800, 50)
	var width_sair = sprite_get_width(spr_voltar) / 2
	var height_sair = sprite_get_height(spr_voltar) / 2 
	var tx_sair = 1800
	var ty_sair = 50

	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if mouse_check_button_pressed(mb_left) {
		if mx > tx_sair - width_sair && mx < tx_sair + width_sair && my > ty_sair - height_sair && my < ty_sair + height_sair {
			instrucoes = false
			global.tem_tela_aberta = false
			escrita = ""
		}
	}
	var vetor = variable_struct_get_names(instrucoes_fala)
	for (var i = 0; i < array_length(vetor); i++) {
		var cor_menu = #E5CE72
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		var largura = string_width(vetor[i])
		var altura = string_height(vetor[i])
		if point_in_rectangle(mx, my, (200 - largura) / 2 - 10, 380 + 80 * i - 10, (200 + largura) / 2 + 10, 380 + 80 * i + 10 + altura) {
			cor_menu = #E5C444
			if mouse_check_button_pressed(mb_left) {
				escrita = variable_struct_get(instrucoes_fala, vetor[i])
			}
		} else {
			cor_menu = #E5CE72
		}
		draw_rectangle_color((200 - largura) / 2 - 10, 380 + 80 * i - 10, (200 + largura) / 2 + 10, 380 + 80 * i + 10 + altura, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
		draw_rectangle_color((200 - largura) / 2 - 5, 380 + 80 * i - 5, (200 + largura) / 2 + 5, 380 + 80 * i + 5 + altura, cor_menu, cor_menu, cor_menu, cor_menu, false)
		draw_text((200 - largura) / 2, 380 + 80 * i, vetor[i])
	}
	draw_rectangle_color(400, 100, 1800, 980, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
	draw_rectangle_color(405, 105, 1795, 975, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
	draw_text_ext(420, 120, escrita, 60, 1380)
}

if direita_coletavel {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale_direita, scale_direita, 0, c_white, 1)
	if scale_direita < 5 {
		scale_direita += 0.5
	} else if scale_direita >= 5 {
		draw_set_color(c_black)
		draw_set_font(fnt_dialogos)
		draw_text_ext(210, 760, variable_struct_get(global.descricoes, object_get_name(obj_personagem.objeto)), 40, 1520)
		var largura = string_width(variable_struct_get(global.nomes, object_get_name(obj_personagem.objeto)))
		var altura = 640 - (78 - string_height("A")) / 2
		draw_sprite_part_ext(spr_dialogo, 0, 0, 0, 10, 60, 160, altura, 1.3, 1.3, c_white, 1)
		var xis = 0
		for (var i = 0; i < largura / 10; i++) {
			draw_sprite_part_ext(spr_dialogo, 0, 10, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
			xis += 10
		}
		draw_sprite_part_ext(spr_dialogo, 0, 310, 0, 10, 60, 170 + xis, altura, 1.3, 1.3, c_white, 1)
		draw_text(170, 640, variable_struct_get(global.nomes, object_get_name(obj_personagem.objeto)))
		draw_sprite_ext(spr_retrato, 0, 1632, 552, 1, 1, 0, c_white, 1)
		var maior = sprite_get_height(object_get_sprite(obj_personagem.objeto))
		if sprite_get_width(object_get_sprite(obj_personagem.objeto)) > sprite_get_height(object_get_sprite(obj_personagem.objeto)) {
			maior = sprite_get_width(object_get_sprite(obj_personagem.objeto))
		}
		draw_sprite_ext(object_get_sprite(obj_personagem.objeto), 0, 1632, 552, 128 / maior, 128 / maior, 0, c_white, 1)
		if mouse_check_button_pressed(mb_left) {
			direita_coletavel = false
			tirar_direita = true
		}
	}
}

if tirar_direita {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, scale_direita, scale_direita, 0, c_white, 1)
	if scale_direita > 0 {
		scale_direita -= 0.5
	} else if scale_direita == 0 {
		tirar_direita = false
		global.tem_tela_aberta = false
	}
}

if !pode_jogar {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, jogo_scale, jogo_scale, 0, c_white, 1)
	if jogo_scale < 5 {
		jogo_scale += 0.5
	} else {
		draw_set_color(c_black)
		draw_set_font(fnt_dialogos)
		draw_text(220, 800, "Você não pode jogar sozinho.")
		if mouse_check_button_pressed(mb_left) {
			if auxua {
				global.tem_tela_aberta = false
				pode_jogar = true
				auxua = false
				global.tem_tela_aberta = false
				tirar_jogo = true
			} else {
				auxua = true
			}
		} 
	}
}

if tirar_jogo {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, jogo_scale, jogo_scale, 0, c_white, 1)
	if jogo_scale > 0 {
		jogo_scale -= 0.5
	} else if jogo_scale == 0 {
		tirar_jogo = false
	}
}
if game_over {
	if !pode_tocar and !audio_is_playing(snd_marcha_funebre)  {
		audio_stop_all()
		pode_tocar = true
	}
	if !audio_is_playing(snd_marcha_funebre) {
		audio_play_sound(snd_marcha_funebre, 1, true)
	}
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, 1)
	if !bbb {
		bbb = true
		tempo_over = current_time / 1000 + 1.5
	}
	draw_set_font(fnt_alagard)
	draw_set_color(c_white)
	var _txt = "Fim de Jogo"
	draw_text(960 - string_width(_txt) / 2, 540 - string_height(_txt), _txt)
	draw_set_font(fnt_dialogos)
	if tempo_over < current_time / 1000 {
		draw_text(960 - string_width(msg_game_over) / 2, 660, msg_game_over)
		if !aux1 {
			tempo_over2 = current_time / 1000 + 1.5
			aux1 = true
		}
	}
	if tempo_over2 < current_time / 1000 and aux1 {
		if room == rm_casa {
			var data_morte = "Data da morte: 16 de Julho"
			draw_text(960 - string_width(data_morte) / 2, 760, data_morte)
		} else {
			var data_morte = "Data da morte: " + string(obj_calendario.dia_atual) + " de " + string(_mes)
			draw_text(960 - string_width(data_morte) / 2, 760, data_morte)
		}
		if !aux2 {
			tempo_over3 = current_time / 1000 + 1.5
			aux2 = true
		}
	}
	if tempo_over3 < current_time / 1000 and aux2 {
		var msg_tela_inicial = "Voltar para tela inicial"
		var xinicial = 960 - string_width(msg_tela_inicial) / 2 - 5
		var xfinal = xinicial + string_width(msg_tela_inicial) + 5
		var yinicial = 860 - 5
		var yfinal = 860 + string_height(msg_tela_inicial) + 5
		if morrer_lutando {
			xinicial = 480 - string_width(msg_tela_inicial) / 2 - 5
			xfinal = 480 + string_width(msg_tela_inicial) / 2 + 5
		}
		draw_rectangle_color(xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5, cor_botao, cor_botao, cor_botao, cor_botao, false)
		draw_rectangle_color(xinicial, yinicial, xfinal, yfinal, c_black, c_black, c_black, c_black, false)
		draw_text(xinicial + 5, 860, msg_tela_inicial)
		if !aux3 {
			tempo_over4 = current_time / 1000 + 1.5
			aux3 = true
		}
		if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5) {
			cor_botao = #527F7F
			if mouse_check_button_pressed(mb_left) {
				audio_stop_all()
				room_goto(rm_tela_inicial)
			}
		} else {
			cor_botao = c_white
		}
	}
	if tempo_over4 < current_time / 1000 and aux3 and morrer_lutando {
		var msg_tela_inicial = "Voltar para a batalha"
		var xinicial = 1440 - string_width(msg_tela_inicial) / 2 - 5
		var xfinal = 1440 + string_width(msg_tela_inicial) / 2 + 5
		var yinicial = 860 - 5
		var yfinal = 860 + string_height(msg_tela_inicial) + 5
		draw_rectangle_color(xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5, cor_botao2, cor_botao2, cor_botao2, cor_botao2, false)
		draw_rectangle_color(xinicial, yinicial, xfinal, yfinal, c_black, c_black, c_black, c_black, false)
		draw_text(1440 - string_width(msg_tela_inicial) / 2 + 5, 860, msg_tela_inicial)
		if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), xinicial - 5, yinicial - 5, xfinal + 5, yfinal + 5) {
			cor_botao2 = #527F7F
			if mouse_check_button_pressed(mb_left) {
				obj_escada.escureceu = true
				if !ativada {
					instance_activate_object(obj_davi)
					ativada = true
				}
				if instance_exists(obj_davi) {
					obj_davi.atributos.saude = obj_escada.vida_davi_original
				}
				atributos.saude = obj_escada.vida_roger_original
				obj_escada.tiros_metra = obj_escada.balas_metra_original
				obj_escada.tiros_pistola = obj_escada.balas_pistola_original
				obj_escada.inimigo.vida = obj_escada.inimigo.total_vida
				for (var i = 0; i < obj_escada.municoes_original; i++) {
					if instance_exists(obj_municao) {
						obj_municao.qtde_itens++
					} else {
					var objeto = variable_struct_get(global.posicoes, "obj_municao")
						var xis = variable_struct_get(objeto, "x")
						var ipsilon = variable_struct_get(objeto, "y")
						instance_create_layer(xis, ipsilon, "Instances", obj_municao)
					}
						variable_struct_set(obj_personagem.qtde_itens1, "obj_municao", variable_struct_get(obj_personagem.qtde_itens1, "obj_municao") + 1)
				}
				morrer_lutando = false
				obj_escada.escureceu = true
				audio_stop_sound(snd_marcha_funebre)			
				game_over = false
				msg_game_over = ""
				alpha_over = 0
				inicio = false
				tempo_over = 0
				aux1 = false
				bbb = false
				tempo_over2 = 0
				aux2 = false
				tempo_over3 = 0
				cor_botao = c_white
				tempo_over4 = false
				aux3 = false
			}
		} else {
			cor_botao2 = c_white
		}
	}
}

if passagem_dia {
	global.tem_tela_aberta = true
	draw_set_color(c_black)
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_dia)
	if !escureceu {
		if alpha_dia < 1 {
			alpha_dia += 1.5 * delta_time / 1000000
		} else {
			escureceu = true
			time2 = current_time / 1000 + 2
		}
	} else if !animacao_dia {
		if time and !mudou_data {
			//aqui vai todas as coisas que acontecem quando um dia passa
			resolveu = false
			audio_play_sound(snd_paginas, 1, false)
			obj_calendario.mudou_dia = true
			mudou_data = true
			passar_dia()
			atributos.fome -= 7
			if obj_controlador_evento.evento_canos {
				atributos.sede -= 25
			}
			if doencas.Gripe[0] {
				dias_gripe++
			}
			if dias_gripe == 4 {
				doencas.Gripe[0] = false
				if instance_exists(obj_davi) {
					if ativada {
						obj_davi.doencas.Gripe[0] = false
					}
				}
				dias_gripe = 0
			}
			for (var i = 0; i < array_length(struct_get_names(doencas)); i++) {
				if variable_struct_get(doencas, struct_get_names(doencas)[i])[0] {
					atributos.saude -= variable_struct_get(doencas, struct_get_names(doencas)[i])[2]
				}
			}
			if obj_diario.dia < 16 {
				atributos.sanidade -= 9
			} else if obj_diario.dia < 32 {
				atributos.sanidade -= 15
			} else {
				atributos.sanidade -= 21
			}
			if instance_exists(obj_davi) {
				if ativada {
					for (var i = 0; i < array_length(struct_get_names(obj_davi.doencas)); i++) {
						if variable_struct_get(obj_davi.doencas, struct_get_names(obj_davi.doencas)[i])[0] {
							obj_davi.atributos.saude -= variable_struct_get(obj_davi.doencas, struct_get_names(obj_davi.doencas)[i])[2]
						}
					}
				 	obj_davi.atributos.fome -= 7
					if obj_controlador_evento.evento_canos {
						obj_davi.atributos.sede -= 25
					}
					if obj_diario.dia < 33 {
						obj_davi.atributos.sanidade -= 9
					} else if obj_diario.dia < 66 {
						obj_davi.atributos.sanidade -= 15
					} else {
						obj_davi.atributos.sanidade -= 21
					}
				}
			}
		}
		if time2 < current_time / 1000 and !time { 
			time = true
			time3 = current_time / 1000 + 2
			aaa = true
		} else if time3 < current_time / 1000 and aaa {
			animacao_dia = true
			var is_dia = false
			if room == rm_bunker {
				if obj_diario.dia == dias_bunker + 1 {
					is_dia = true
				}
			}
			if !is_dia and array_length(alguem_morreu()) { //detecta se alguem morreu (o gato ou os personagens)
				morreram = alguem_morreu()
				obituario = true
				passagem_dia = false
				escureceu = false
				animacao_dia = false
				time = false
				time2 = 0
				time3 = 0
				clareou = false
				aaa = false
				mudou_data = false
			}
		}
		var texto = string(obj_calendario.dia_atual) + " de " + string(_mes)
		draw_set_color(c_white)
		draw_set_font(fnt_alagard)
		draw_text(960 - string_width(texto) / 2, 540, texto)
	} else if !clareou {
		if alpha_dia > 0 {
			alpha_dia -= 1.5 * delta_time / 1000000
		} else {
			global.tem_tela_aberta = false
			passagem_dia = false
			alpha_dia = 0
			escureceu = false
			animacao_dia = false
			time = false
			time2 = 0
			time3 = 0
			clareou = false
			aaa = false
			mudou_data = false
		}
	}
}

if obituario {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_dia)
	var proximo1 = false
	var proximo2 = false
	var clarear = false
	if !array_contains(morreram, obj_meredith) {
		proximo1 = true
	} else {
		morte_meredith = true
		obituario = false
	} 
	if !array_contains(morreram, obj_davi) and proximo1 {
		proximo2 = true
	} else if proximo1 {
		morte_davi = true
		obituario = false
	}
	if array_contains(morreram, obj_personagem) and proximo1 and proximo2 {
		game_over = true
		obituario = false
	}
	if array_length(morreram) == 0 {
		clarear = true
	}
	if clarear {
		if alpha_dia > 0 {
			alpha_dia -= 1.5 * delta_time / 1000000
		} else {
			global.tem_tela_aberta = false
			alpha_dia = 0
			clarear = false
			obituario = false
		}
	}
}

if pode_comecar and !tutorial and !game_over {
	draw_set_color(c_white)
	if room_get_name(room) == "rm_casa" {
		draw_set_font(fnt_alagard)
		draw_text(room_width / 2, 60, tempo_escrito div 1 + 1)//div é o comando para divisap inteira
	}
}

if tutorial and room == rm_casa {
	draw_sprite(spr_tutorial, 0, 128, 250)
	if !coleta {
		tut_mensagem = "Clique com o botão esquerdo do mouse em algum item para coletá-lo."
	} else if !informacao {
		tut_mensagem = "Clique com o botão direito do mouse em algum item para descobrir suas informações."
	} else if !rolar_hotbar {
		tut_mensagem = "Utilize a rodinha do mouse para percorrer a hotbar."
	} else if !porta {
		tut_mensagem = "Clique com o botão esquerdo do mouse nas portas para abri-las"
	} else if !geladeira {
		tut_mensagem = "Clique com o botão esquerdo na geladeira (na parte superior direita da casa) para coletar comidas."
	}else if !deposito {
		tut_mensagem = "Clique com o botão esquerdo do mouse no bunker (estrutura cinza na parte de cima da casa) enquanto segura um item para enviá-lo ao bunker."
	} else {
		tut_mensagem = "Perfeito, seu tutorial foi conluido! Agora pode utilizar esse modo para construir sua estratégia mais facilmente e, quando estiver pronto, volte a tela inicial clicando em 'ESC' e hogue o modo normal."
	}
	draw_set_font(fnt_dialogos)
	draw_set_color(#7FFFF8)
	var linhas = obj_conquistas.quebrar_texto(tut_mensagem, 1500)
	for (var i = 0; i < array_length(linhas); i++) {
		draw_text(370, 50 + 50 * i, linhas[i])
	}
}

if tutorial_ask {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, tut_alpha)
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, tutorial_scale, tutorial_scale, 0, c_white, 1)
	if tutorial_scale < 5 and !tut_saindo {
		tutorial_scale += 0.5
	} else if !tut_saindo {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text(220, 800, "Você gostaria de jogar o tutorial?")
		if mouse_sim {
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Sim")
		if mouse_nao {
			if !segundo {
				segundo = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			segundo = false
		}
		draw_text(1620, 940, "Não")
	} else if tut_saindo {
		if tut_alpha > 0 {
			tut_alpha -= 0.05
		}
		if tutorial_scale > 0 {
			tutorial_scale -= 0.5
		}
		if tutorial_scale <= 0 and tut_alpha <= 0 {
			global.tem_tela_aberta = false
			tutorial_ask = false
			pode_comecar = true
		}
	}
}

var _slotx1=768
var _slotx2=864
var _slotx3=960
var _slotx4=1056
var _slotx5=1152

var desenha = true
if room == rm_casa {
	if desenha and (morreu_casa2 or sair_casa) {
		desenha = false
	}
}
if room == rm_bunker {
	if obj_controlador_evento.clicou_cogumelo and desenha {
		desenha = false
	}
	if esconder_hotbar and desenha {
		desenha = false
	}
	if morte_meredith and desenha {
		desenha = false
	}
	if question_chumbo and desenha {
		desenha = false
	}
	if instance_exists(obj_meredith) {
		if obj_meredith.question and desenha {
			desenha = false
		}
	}
	if obj_controlador_evento.mala_question or obj_controlador_evento.mala_interface and desenha {
		desenha = false
	}
	if obj_escada.clicou and desenha {
		desenha = false
	}
	if obj_controlador_evento.sair_bunker or obj_controlador_evento.davi_sai or (obj_controlador_evento.davi_coletou and !obj_personagem.passagem_dia) or obj_controlador_evento.roger_sai and desenha {
		desenha = false
	}
}

if instance_exists(obj_davi) {
	if ativada {
		if obj_davi.mostrar and desenha {
			desenha = false
		}
		if (obj_davi.remedio or obj_davi.beber_agua or obj_davi.alimento) and desenha {
			desenha = false
		}
	}
}

if instrucoes and desenha {
	desenha = false
}

if room == rm_bunker and instance_exists(obj_tv) and desenha {
	if obj_tv.desenha or obj_tv.tirar {
		desenha = false
	}
}

if (remedio or beber_agua or alimento) and desenha {
	desenha = false
}

if room == rm_bunker {
	if !pode_jogar and desenha {
		desenha = false
	}
}

if ganhou_jogo and desenha {
	desenha = false
}
var alguma_cama_clicada = false;
if instance_exists(obj_cama_campanha) {
	with (obj_cama_campanha) {
	    if (clicou) {
	        alguma_cama_clicada = true;
	        break;
	    }
	}

	if (alguma_cama_clicada) and desenha {
	    desenha = false;
	}
}
if room == rm_bunker {
	if obj_escada.question and desenha {
		desenha = false
	}
	if obj_escada.final and desenha {
		desenha = false
	}
	if obj_calendario.clicou and desenha {
		desenha = false
	}
}

if passagem_dia and desenha {
	desenha = false
}

if instance_exists(obj_baralho) {
	if obj_baralho.nao_pode or obj_baralho.tirar and desenha {
		desenha = false
	}
}

if instance_exists(obj_domino) {
	if obj_domino.nao_pode or obj_domino.tirar and desenha {
		desenha = false
	}
}

if morte_davi and desenha {
	desenha = false
}

if game_over and desenha {
	desenha = false
}

if instance_exists(obj_diario) and desenha {
	if obj_diario.clicou {
		desenha = false
	}
}

if (tutorial_ask or direita_coletavel) and desenha {
	desenha = false
}

if room == rm_bunker and desenha {
	if obj_controlador_evento.interagir_comerciante or obj_controlador_evento.interagir2 or obj_controlador_evento.despedida or obj_controlador_evento.despedida1 {
		desenha = false
	}
}

if instance_exists(obj_domino) and desenha {
	if obj_domino.clicou or obj_domino.comecou {
		desenha = false
	}
}
if instance_exists(obj_baralho) and desenha {
	if obj_baralho.clicou {
		desenha = false
	}
}

if instance_exists(obj_radio) and desenha {
	if obj_radio.clicou {
		desenha = false
	}
}

if instance_exists(obj_meredith) and desenha {
	if obj_meredith.mostrar {
		desenha = false
	}
}

if desenha {
	draw_sprite_ext(spr_hotbar, 0, 960, 1020, 3, 3, 0, c_white, 1)
	switch (slot_selecionado) {
		case 1:
			draw_sprite_ext(spr_slot_selecionado, 0, _slotx1, 1020, 3, 3, 0, c_white, 1)	
			break
		case 2:
			draw_sprite_ext(spr_slot_selecionado, 0, _slotx2, 1020, 3, 3, 0, c_white, 1)
			break
		case 3:
			draw_sprite_ext(spr_slot_selecionado, 0, _slotx3, 1020, 3, 3, 0, c_white, 1)
			break
		case 4:
			draw_sprite_ext(spr_slot_selecionado, 0, _slotx4, 1020, 3, 3, 0, c_white, 1)
			break
		case 5:
			draw_sprite_ext(spr_slot_selecionado, 0, _slotx5, 1020, 3, 3, 0, c_white, 1)
			break
	}
	if slot1 != noone {
		desenhar_hotbar(slot1, slot1_novo, _slotx1)
	}
	if slot2 != noone {
		desenhar_hotbar(slot2, slot2_novo, _slotx2)
	}
	if slot3 != noone {
		desenhar_hotbar(slot3, slot3_novo, _slotx3)
	}
	if slot4 != noone {
		desenhar_hotbar(slot4, slot4_novo, _slotx4)
	}
	if slot5 != noone {
		desenhar_hotbar(slot5, slot5_novo, _slotx5)
	}
}

function desenhar_hotbar(slot, slot_novo, slotx) {
	var width = sprite_get_width(object_get_sprite(slot))
	var heigth = sprite_get_height(object_get_sprite(slot))
	var maior = width
	if width < heigth {
		maior = heigth
	}
	if !slot_novo {
		draw_sprite_ext(object_get_sprite(slot), 0, slotx, 1020, 64 / maior, 64 / maior, 0, c_white, 1)
	} else {
		draw_sprite_ext(object_get_sprite(slot), 0, slotx, 1020, 64 / maior, 64 / maior, 0, c_black, 1)
	}
}
/*
show_debug_message(string(slot1) + ",  " + string(slot1_n) + ", " + string(slot1_novo))
show_debug_message(string(slot2) + ",  " + string(slot2_n) + ", " + string(slot2_novo))
show_debug_message(string(slot3) + ",  " + string(slot3_n) + ", " + string(slot3_novo))
show_debug_message(string(slot4) + ",  " + string(slot4_n) + ", " + string(slot4_novo))
show_debug_message(string(slot5) + ",  " + string(slot5_n) + ", " + string(slot5_novo))
*/
 
if mudar_bunker and room == rm_casa {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha2)
	alpha2 += 0.05 
} else if mudar_bunker and room == rm_bunker {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha2)
	alpha2 -= 0.05
} else if mudar_bunker and room == rm_bunker and alpha2 == 0 {
	mudar_bunker = false
	global.tem_tela_aberta = false
}

if opcoes {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	cursor_sprite = spr_cursor_padrao
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, 0.4)
	draw_sprite(spr_tela_opcoes_jogo, 0, 1920 / 2, 1080 / 2)
	draw_rectangle_color(960 - 160, 540 - 5, 960 + 160, 540 + 5, c_black, c_black, c_black, c_black, false)
	draw_sprite(spr_sair_tela_inicial, 0, 960, 540 - 150)
	if mudar_volume {
		if mx > 960 + 160 {
			volume_x = 960 + 160
		} else if mx < 960 - 160 {
			volume_x = 960 - 160
		} else {
			volume_x = mx
		}
	}
	draw_circle_color(volume_x, 540, 20, c_black, c_black, false)
	
	draw_rectangle_color(960 - 160, 700 - 5, 960 + 160, 700 + 5, c_black, c_black, c_black, c_black, false)
	if mudar_fov {
		if mx > 960 + 160 {
			fov_x = 960 + 160
		} else if mx < 960 - 160 {
			fov_x = 960 - 160
		} else {
			fov_x = mx
		}
	}
	draw_circle_color(fov_x, 700, 20, c_black, c_black, false)
}

function escrever(_x, _y, _texto, _cores) { //cores é um vetro de struct assim: {pos: 0, cor: c_green}. passar na ordem por posicao
	var x_atual = _x
	for (var i = 0; i < array_length(_cores); i++) {
		var inicio = _cores[i].pos
		var fim = (i < array_length(_cores) - 1) ? _cores[i + 1].pos : string_length(_texto) + 1 //se essa não for a ultima interação, o final é o inicio da proxima cor. se for, o final é o fim do proprio texto
		draw_set_color(_cores[i].cor)
		draw_set_font(fnt_dialogos)
		draw_text(x_atual, _y, string_copy(_texto, inicio, fim - inicio))
		x_atual += string_width(string_copy(_texto, inicio, fim - inicio))
	}
}

if alimento or remedio or beber_agua {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, alimento_scale, alimento_scale, 0, c_white, 1)
	if alimento_scale < 5 {
		alimento_scale += 0.5
	} else if alimento_scale >= 5 {
		var nome = variable_struct_get(global.nomes, object_get_name(item_selecionado))
		var largura = string_length(nome)
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text(220, 800, "Você deseja dar a Roger " + nome + " ?")
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		if mouse_sim {
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Sim")
		if mouse_nao {
			if !segundo {
				segundo = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
		} else {
			segundo = false
		}
		draw_text(1620, 940, "Não")
	}
}

if tirar {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, alimento_scale, alimento_scale, 0, c_white, 1)
	if alimento_scale > 0 {
		alimento_scale -= 0.5
	} else if alimento_scale == 0 {
		tirar = false
	}
}

if room == rm_bunker {
	if place_meeting(mouse_x, mouse_y, obj_cortina) and point_distance(x, y, 1140, 620) <= 200 and !banheiro and !global.tem_tela_aberta {
		if mouse_check_button_pressed(mb_left) {
			global.tem_tela_aberta = true
			esconder_hotbar = true
			if usou_hoje {
				msg_usou = true
			} else {
				banheiro = true
			}
		}
	}
}

if banheiro {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, banheiro_scale, banheiro_scale, 0, c_white, 1)
	if banheiro_scale < 5 {
		banheiro_scale += 0.5
	} else if banheiro_scale >= 5 {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text(220, 800, "Você deseja usar o banheiro?")
		if point_in_rectangle(mousex, mousey, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(280, 920, 320 + largura_sim, 960 + altura_sim, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_sim, 950 + altura_sim, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				usou_hoje = true
				usar = true
				banheiro = false
				tirar_banheiro = true
			}
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Sim")
		if point_in_rectangle(mousex, mousey, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
			if !segundo {
				segundo = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			draw_rectangle_color(1600, 920, 1640 + largura_nao, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610, 930, 1630 + largura_nao, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if mouse_check_button_pressed(mb_left) {
				tirar_banheiro = true
				banheiro = false
				nao_usou = true
			}
		} else {
			segundo = false
		}
		draw_text(1620, 940, "Não")
	}
}

if msg_usou {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, banheiro_scale, banheiro_scale, 0, c_white, 1)
	if banheiro_scale < 5 {
		banheiro_scale += 0.5
	} else if banheiro_scale >= 5 {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, 5, 5, 0, c_white, 1)
		draw_text(220, 800, "Você não sente vontade de usar o banheiro.")
		if mouse_check_button_pressed(mb_left) {
			tirar_banheiro = true
			msg_usou = false
			usar2 = true
		}
	}
}

if tirar_banheiro {
	draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, banheiro_scale, banheiro_scale, 0, c_white, 1)
	if banheiro_scale > 0 {
		banheiro_scale -= 0.5
	} else if banheiro_scale == 0 {
		tirar_banheiro = false
		if sm {
			sm = false
			global.tem_tela_aberta = false
		}
		if morreu_casa {
			morreu_casa2 = true
			morreu_casa = false
		}
		if usar2 or nao_usou {
			nao_usou = false
			usar2 = false
			esconder_hotbar = false
			global.tem_tela_aberta = false
		}
	}
}

if usar and !tirar_banheiro {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_banheiro)
	if alpha_banheiro < 1 {
		alpha_banheiro +=  0.02
	} else {
		if !dar_descarga {
			dar_descarga = true
			audio_play_sound(snd_descarga, 1, false)
		} else if !audio_is_playing(snd_descarga) {
			dar_descarga = false
			usar = false
			usar1 = true
		}
	}
}

if usar1 {
	if alpha_banheiro > 0 {
		draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_banheiro)
		alpha_banheiro -=  0.02
	} else {
		draw_sprite_ext(spr_dialogo, 0, 1920 / 2, 880, banheiro_scale, banheiro_scale, 0, c_white, 1)
		if banheiro_scale < 5 {
			banheiro_scale += 0.5
		} else if banheiro_scale == 5 {
			draw_set_font(fnt_dialogos)
			draw_set_color(c_black)
			draw_text(220, 800, "Você se sente mais aliviado.")
			if mouse_check_button_pressed(mb_left) {
				tirar_banheiro = true
				usar1 = false
				usar2 = true
			}
		}
	}
}
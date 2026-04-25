if mala_question {
	global.tem_tela_aberta = true
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	if scale < 5 {
		scale += 0.5
	} else {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text_ext(210, 760, "Você percebeu que deixaram uma mala misteriosa do lado de fora do Bunker. Gostaria de se arrsicar para ver o que tem dentro dela? Você não sabe se é bom ou ruim.", 30, 1520)
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
				tirar_mala = true
				mala_interface_aux = true
				mala_question = false
			}
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Sim")
		if point_in_rectangle(mx, my, nao2[0][0], nao2[0][1], nao2[1][0], nao2[1][1]) {
			draw_rectangle_color(1600 - largura_nao, 920, 1640, 960 + altura_nao, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610 - largura_nao, 930, 1630, 950 + altura_nao, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if !terceiro {
				terceiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			if mouse_check_button_pressed(mb_left) {
				tirar_mala = true
				mala_question = false
				mala_interface_aux = false
			}
		} else {
			terceiro = false
		}
		draw_text(1620 - largura_nao, 940, "Não")
	}
}

if tirar_mala {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	if scale > 0 {
		scale -= 0.5
	} else {
		tirar_mala = false
		if mala_interface_aux {
			mala_interface = true
		} else {
			mala_interface_aux = false
			global.tem_tela_aberta = false
		}
	}
}

if mala_interface {
	draw_sprite(spr_mala, 0, 960, 540)
	draw_sprite(spr_voltar, 0, 1800, 50)
	
	var width_sair = sprite_get_width(spr_voltar) / 2
	var height_sair = sprite_get_height(spr_voltar) / 2 
	var tx_sair = 1800
	var ty_sair = 50

	var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);
	
	if mouse_check_button_pressed(mb_left) {
		if mx > tx_sair - width_sair && mx < tx_sair + width_sair && my > ty_sair - height_sair && my < ty_sair + height_sair {
			mala_interface = false
			global.tem_tela_aberta = false
		}
	}
	var pegou_objeto = noone
	for (var i = 0; i < array_length(mala_atual); i++) {
		var nao_instancia = false
		for (var j = 0; j < array_length(obj_personagem.itens_nao_consumiveis); j++) {
			if obj_personagem.itens_nao_consumiveis[j] == mala_atual[i][0] {
				if variable_instance_get(obj_personagem.qtde_itens1, object_get_name(mala_atual[i][0])) >= 1 {
					nao_instancia = true
					break
				}
			}
		}
		if nao_instancia {
			continue
		}
		if mala_atual[i][2] {
			continue
		}
		var objeto = mala_atual[i][0]
		var quantia = mala_atual[i][1]
		var posicao_x = mala_posicoes[i][0]
		var posicao_y = mala_posicoes[i][1]
		draw_sprite_ext(object_get_sprite(objeto), 0, posicao_x, posicao_y, 96 / sprite_get_height(object_get_sprite(objeto)), 96 / sprite_get_height(object_get_sprite(objeto)), 0, c_white, 1)
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		if quantia != 1 {
			draw_text(posicao_x + 20, posicao_y + 20, string(quantia))
		}
		if point_in_rectangle(mx, my, posicao_x - 48, posicao_y - 48, posicao_x + 48, posicao_y + 48) {
			if mouse_check_button_pressed(mb_left) {
				pegou_objeto = objeto
				mala_atual[i][2] = true
				for (var k = 0; k < mala_atual[i][1]; k++) {
					var is_alimento = false
					for (var j = 0; j < array_length(global.alimentos); j++) {
						if global.alimentos[j] == mala_atual[i][0] {
							is_alimento = true
							break
						}
					}
					if is_alimento {
						for (var j = 0; j < array_length(obj_freezer.quantidades); j++) {
							if obj_freezer.quantidades[j][0] == mala_atual[i][0] {
								obj_freezer.quantidades[j][1]++
							}
						}
					} else {
						var object = mala_atual[i][0]
						if !instance_exists(object) {
							var pos = variable_struct_get(global.posicoes, object_get_name(object))
							var ax = variable_struct_get(pos, "x")
							var ay = variable_struct_get(pos, "y")
							instance_create_layer(ax, ay, layer_get_id("Instances"), object, {})
						} else {
							object.qtde_itens += 1	
						}
					}
					variable_struct_set(obj_personagem.qtde_itens1, object_get_name(mala_atual[i][0]), variable_struct_get(obj_personagem.qtde_itens1, object_get_name(mala_atual[i][0])) + 1)
				}
			}
		}
	}
}

if sair_bunker {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	if scale < 5 {
		scale += 0.5
	} else if (instance_exists(obj_mapa) and (instance_exists(obj_traje_davi) or instance_exists(obj_traje_roger))) or (variable_struct_get(obj_personagem.qtde_itens1, "obj_mapa") > 0 and (variable_struct_get(obj_personagem.qtde_itens1, "obj_traje_davi") > 0 or variable_struct_get(obj_personagem.qtde_itens1, "obj_traje_roger") > 0)) {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text_ext(210, 760, "Você tem a opção de enviar alguém para fora do Bunker em uma arriscada missão para coletar itens; a pessoa escolhida voltará amanhã, podendo ou não apresentar sequelas. Porém, você só pode fazer isso munido de um traje anti-radiação e o mapa para se localizar. Esses itens não são consumíveis. Quem você envia?", 30, 1520)
		var mx = device_mouse_x_to_gui(0)
		var my = device_mouse_y_to_gui(0)
		if point_in_rectangle(mx, my, roger[0][0], roger[0][1], roger[1][0], roger[1][1]) {
			draw_rectangle_color(280, 920, 320 + largura_roger, 960 + altura_roger, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(290, 930, 310 + largura_roger, 950 + altura_roger, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if !primeiro {
				primeiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			if mouse_check_button_pressed(mb_left) {
				tirar_coleta = true
				sair_bunker = false
				roger_sai = true
			}
		} else {
			primeiro = false
		}
		draw_text(300, 940, "Roger")
		if instance_exists(obj_davi) {
			if point_in_rectangle(mx, my, davi[0][0], davi[0][1], davi[1][0], davi[1][1]) {
				draw_rectangle_color(940 - largura_davi / 2, 920, 980 + largura_davi / 2, 960 + altura_davi, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
				draw_rectangle_color(950 - largura_davi / 2, 930, 970 + largura_davi / 2, 950 + altura_davi, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
				if !segundo {
					segundo = true
					audio_play_sound(snd_menu_mouse, 1, false)
				}
				if mouse_check_button_pressed(mb_left) {
					tirar_coleta = true
					sair_bunker = false
					davi_sai = true
				}
			} else {
				segundo = false
			}
		
			draw_text(960 - largura_davi / 2, 940, "Davi")
		}
		if point_in_rectangle(mx, my, nenhum[0][0], nenhum[0][1], nenhum[1][0], nenhum[1][1]) {
			draw_rectangle_color(1600 - largura_nenhum, 920, 1640, 960 + altura_nenhum, #7F5E25, #7F5E25, #7F5E25, #7F5E25, false)
			draw_rectangle_color(1610 - largura_nenhum, 930, 1630, 950 + altura_nenhum, #E5CE72, #E5CE72, #E5CE72, #E5CE72, false)
			if !terceiro {
				terceiro = true
				audio_play_sound(snd_menu_mouse, 1, false)
			}
			if mouse_check_button_pressed(mb_left) {
				tirar_coleta = true
				sair_bunker = false
			}
		} else {
			terceiro = false
		}
		draw_text(1620 - largura_nenhum, 940, "Nenhum")
	} else {
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text_ext(210, 760, "Você só pode sair se tiver pelo menos um traje anti-radiação e o mapa.", 30, 1520)
		if mouse_check_button_pressed(mb_left) {
			tirar_coleta = true
			sair_bunker = false
		}
	}
}

if tirar_coleta {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	if scale > 0 {
		scale -= 0.5
	} else {
		tirar_coleta = false
		if !(davi_sai or roger_sai) {
			global.tem_tela_aberta = false
		}
	}
}

if davi_sai {
	draw_sprite_ext(spr_mudar_casa, 0, 0, 0, 1, 1, 0, c_white, alpha_davi)
	if !escureceu and !clareou {
		if alpha_davi < 1 {
			alpha_davi += 0.05
		} else {
			escureceu = true
		}
	} else if escureceu and !clareou {
		esperando_davi = true
		if instance_exists(obj_mapa) {
			instance_destroy(obj_mapa)
		} else {
			var slotn = -1
			if obj_personagem.slot1 == obj_mapa {
				slotn = obj_personagem.slot1_n
			} else if obj_personagem.slot2 == obj_mapa {
				slotn = obj_personagem.slot2_n
			} else if obj_personagem.slot3 == obj_mapa {
				slotn = obj_personagem.slot3_n
			} else if obj_personagem.slot4 == obj_mapa {
				slotn = obj_personagem.slot4_n
			} else if obj_personagem.slot5 == obj_mapa {
				slotn = obj_personagem.slot5_n
			} 
			if obj_personagem.slot1_n == slotn {
				obj_personagem.slot1 = noone
				obj_personagem.slot1_novo = false
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
		
		var slotn = -1
		if obj_personagem.slot1 == obj_traje_davi {
			slotn = obj_personagem.slot1_n
		} else if obj_personagem.slot2 == obj_traje_davi {
			slotn = obj_personagem.slot2_n
		} else if obj_personagem.slot3 == obj_traje_davi {
			slotn = obj_personagem.slot3_n
		} else if obj_personagem.slot4 == obj_traje_davi {
			slotn = obj_personagem.slot4_n
		} else if obj_personagem.slot5 == obj_traje_davi {
			slotn = obj_personagem.slot5_n
		} 
		if slotn == -1 {
			if obj_personagem.slot1 == obj_traje_roger {
				slotn = obj_personagem.slot1_n
			} else if obj_personagem.slot2 == obj_traje_roger {
				slotn = obj_personagem.slot2_n
			} else if obj_personagem.slot3 == obj_traje_roger {
				slotn = obj_personagem.slot3_n
			} else if obj_personagem.slot4 == obj_traje_roger {
				slotn = obj_personagem.slot4_n
			} else if obj_personagem.slot5 == obj_traje_roger {
				slotn = obj_personagem.slot5_n
			} 
		}
		if slotn == -1 {
			if instance_exists(obj_traje_davi) {
				instance_destroy(obj_traje_davi)
				traje_utilizado = obj_traje_davi
			} else {
				instance_destroy(obj_traje_roger)
				traje_utilizado = obj_traje_roger
			}
		} else {
			if obj_personagem.slot1_n == slotn {
				obj_personagem.slot1 = noone
				obj_personagem.slot1_novo = false
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
		obj_personagem.ativada = false
		instance_deactivate_object(obj_davi)
		tempo_davi = current_time / 1000 + 1
		clareou = true
	} else if escureceu and clareou {
		if alpha_davi > 0 {
			alpha_davi -= 0.05
		} else {
			escureceu = false
		}
	} else if !escureceu and clareou{
		global.tem_tela_aberta = false
		davi_sai = false
		tempo_davi = 0
	}
}

if davi_coletou {
	if obj_personagem.passagem_dia and !obj_personagem.animacao_dia and obj_personagem.escureceu {
		obj_personagem.ativada = true
		instance_activate_object(obj_davi)
		var posicoes = global.posicoes.obj_mapa
		var x_= variable_struct_get(posicoes, "x")
		var y_ = variable_struct_get(posicoes, "y")
		instance_create_layer(x_, y_, "Instances", obj_mapa, {})
		if traje_utilizado == obj_traje_roger {
			posicoes = global.posicoes.obj_traje_roger
			x_= variable_struct_get(posicoes, "x")
			y_ = variable_struct_get(posicoes, "y")
			instance_create_layer(x_, y_, "Instances", obj_traje_roger, {})
		} else {
			posicoes = global.posicoes.obj_traje_davi
			x_= variable_struct_get(posicoes, "x")
			y_ = variable_struct_get(posicoes, "y")
			instance_create_layer(x_, y_, "Instances", obj_traje_davi, {})
		}
		for (var i = 0; i < array_length(coleta_atual) and considerar_loots; i++) {
			var nao_instancia = false
			for (var j = 0; j < array_length(obj_personagem.itens_nao_consumiveis); j++) {
				if obj_personagem.itens_nao_consumiveis[j] == coleta_atual[i][0] {
					if variable_instance_get(obj_personagem.qtde_itens1, object_get_name(coleta_atual[i][0])) >= 1 {
						nao_instancia = true
						break
					}
				}
			}
			if nao_instancia {
				continue
			}
			for (var k = 0; k < coleta_atual[i][1]; k++) {
				var is_alimento = false
				for (var j = 0; j < array_length(global.alimentos); j++) {
					if global.alimentos[j] == coleta_atual[i][0] {
						is_alimento = true
						break
					}
				}
				if is_alimento {
					for (var j = 0; j < array_length(obj_freezer.quantidades); j++) {
						if obj_freezer.quantidades[j][0] == coleta_atual[i][0] {
							obj_freezer.quantidades[j][1]++
						}
					}
				} else {
					var object = coleta_atual[i][0]
					if !instance_exists(object) {
						var pos = variable_struct_get(global.posicoes, object_get_name(object))
						var ax = variable_struct_get(pos, "x")
						var ay = variable_struct_get(pos, "y")
						instance_create_layer(ax, ay, layer_get_id("Instances"), object, {})
					} else {
						object.qtde_itens += 1	
					}
				}
				variable_struct_set(obj_personagem.qtde_itens1, object_get_name(coleta_atual[i][0]), variable_struct_get(obj_personagem.qtde_itens1, object_get_name(coleta_atual[i][0])) + 1)
			}
		}
		considerar_loots = false
	} else if !obj_personagem.passagem_dia {
		draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
		global.tem_tela_aberta = true
		if scale < 5 {
			scale += 0.5
		} else {
			var texto = "Davi conseguiu coletar: "
			for (var i = 0; i < array_length(coleta_atual); i++) {
				texto += variable_struct_get(global.nomes, object_get_name(coleta_atual[i][0])) + " x " + string(coleta_atual[i][1]) + ", "
			}
			draw_set_font(fnt_dialogos)
			draw_set_color(c_black)
			draw_text_ext(210, 760, texto, 30, 1520)
			if mouse_check_button_pressed(mb_left) {
				global.tem_tela_aberta = false
				esperando_davi = false
				considerar_loots = true
				roger_sai = false
				evento_coleta = false
				coleta_aux = false
				davi_coletou = false
				tirar_coleta = true
			}
		}
	}
}

if roger_sai and roger_sai_aux {
	roger_sai_aux = false
	obj_cama_campanha.passar_dia()
} else if roger_sai and obj_personagem.passagem_dia and !obj_personagem.animacao_dia and obj_personagem.escureceu {
	for (var i = 0; i < array_length(coleta_atual) and considerar_loots; i++) {
		for (var k = 0; k < coleta_atual[i][1]; k++) {
			var is_alimento = false
			for (var j = 0; j < array_length(global.alimentos); j++) {
				if global.alimentos[j] == coleta_atual[i][0] {
					is_alimento = true
				}
			}
			if is_alimento {
				for (var j = 0; j < array_length(obj_freezer.quantidades); j++) {
					if obj_freezer.quantidades[j][0] == coleta_atual[i][0] {
						obj_freezer.quantidades[j][1]++
					}
				}
			} else {
				var object = coleta_atual[i][0]
				if !instance_exists(object) {
					var pos = variable_struct_get(global.posicoes, object_get_name(object))
					var ax = variable_struct_get(pos, "x")
					var ay = variable_struct_get(pos, "y")
					instance_create_layer(ax, ay, layer_get_id("Instances"), object, {})
				} else {
					object.qtde_itens += 1	
				}
			}
			variable_struct_set(obj_personagem.qtde_itens1, object_get_name(coleta_atual[i][0]), variable_struct_get(obj_personagem.qtde_itens1, object_get_name(coleta_atual[i][0])) + 1)
		}
	}
	considerar_loots = false
} else if !obj_personagem.passagem_dia and roger_sai {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, scale, scale, 0, c_white, 1)
	global.tem_tela_aberta = true
	if scale < 5 {
		scale += 0.5
	} else {
		var texto = "Você conseguiu coletar: "
		for (var i = 0; i < array_length(coleta_atual); i++) {
			texto += variable_struct_get(global.nomes, object_get_name(coleta_atual[i][0])) + " x " + string(coleta_atual[i][1]) + ", "
		}
		draw_set_font(fnt_dialogos)
		draw_set_color(c_black)
		draw_text_ext(210, 760, texto, 30, 1520)
		if mouse_check_button_pressed(mb_left) {
			global.tem_tela_aberta = false
			roger_sai = false
			evento_coleta = false
			coleta_aux = false
			considerar_loots = true
			tirar_coleta = true
		}
	}
}

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
			obj_personagem.slot1_novo = false
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

if despedida1 {
	draw_sprite_ext(spr_dialogo, 0, 960, 880, 5, 5, 0, c_white, 1)
	interacao1 = false
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
	draw_text_ext(210, 760, "Tudo bem. Partirei somente à noite, caso mude de ideia.", 30, 1520)
	if mouse_check_button_pressed(mb_left) {
		sair = true
		despedida1 = false
		fechar = true
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
		if interacao1 {
			draw_text_ext(210, 760, "Bom dia, habitantes dessa humilde residência. Sou um velho latoeiro que circunda por essas bandas trocando coisas que podem ser úteis. Funciona assim: ofereço alguns itens meus em troca de alguns seus. Vamos fazer negócios?", 30, 1520)
		} else {
			draw_text_ext(210, 760, "Bem vindo de volta! Deseja mais alguma coisa?", 30, 1520)
		}
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
				interagir_comerciante = false
				despedida1 = true
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

if !sair and fechar {
	global.tem_tela_aberta = false
	fechar = false
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
	interacao1 = false
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
		draw_text_ext(210, 760, "Foi um prazer falar com você, ficarei aqui até hoje à noite, caso queira algo mais.", 30, 1520)
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
		}
	}
}
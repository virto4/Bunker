/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if instance_exists(obj_diario) {
	if obj_diario.dia == dias_bunker + 1 and aux_final {
		ganhou_jogo = true
		aux_final = false
		global.tem_tela_aberta = true
	}
}

if room == rm_bunker and !global.tem_tela_aberta {
	for (var i = 0; i < array_length(datas_vazamento) and novo and !resolveu; i++) {
		if obj_diario.dia == datas_vazamento[i] {
			hoje = posicoes_vazamento[i]
			hoje_tem = true
			novo = false
			doencas.Radiacao[0] = true
			if instance_exists(obj_davi) and ativada {
				obj_davi.doencas.Radiacao[0] = true
			}
		}
	}
	if item_selecionado == obj_contador_geiger {
		if aux {
			aux = false
			tempo_geiger = current_time + intervalo * 1000
		}
		if tempo_geiger < current_time {
			tempo_geiger = current_time + intervalo * 1000
			audio_play_sound(snd_contador_geiger, 1, false)
		}
		if !hoje_tem {
			intervalo = 1
		} else {
			var distancia = point_distance(hoje[0], hoje[1], obj_personagem.x, obj_personagem.y + 50)
			if distancia < 100 {
				intervalo = 0.10
			} else if distancia > 100 {
				intervalo = distancia * 0.10 / 100
			}
		}
	} else {
		aux = true
	}
	if item_selecionado == obj_chumbo and !global.tem_tela_aberta and hoje_tem and point_distance(hoje[0], hoje[1], obj_personagem.x, obj_personagem.y + 50) < 100 {
		if point_in_circle(mouse_x, mouse_y, hoje[0], hoje[1], 100) {
			if mouse_check_button_pressed(mb_left) {
				question_chumbo = true
			}
		}
	}
}
/*
num raio de 100px - intervalo = 0.15
num raio de x - intervalo de y
y = x * 0.15 / 100

*/

if room == rm_bunker and audio_is_playing(snd_geladeira_ronco) {
	audio_stop_sound(snd_geladeira_ronco)
}

var is_dia = false
if room == rm_bunker {
	if obj_diario.dia == dias_bunker + 1 {
		is_dia = true
	}
}

if !passagem_dia and !is_dia { //para que ele só morra depois que o dia passar
	if atributos.sede <= 0 {
		game_over = true
		msg_game_over = "Seu personagem morreu desidratado"
	} 
	if atributos.fome <= 0 {
		game_over = true
		msg_game_over = "Seu personagem morreu faminto"
	}
	if atributos.sanidade <= 0 {
		game_over = true
		msg_game_over = "Seu personagem se perdeu em desvario e cometeu suicídio"
	}
	if atributos.saude <= 0 {
		game_over = true
		msg_game_over = "Seu personagem morreu da doença que lhe acometeu"
	}
}

if mudou_humor {
	if atributos.humor == "NEUTRO" {
		atributos.forca = forca_padrao
		atributos.sagacidade = sagacidade_padrao
		atributos.fortuna = fortuna_padrao
		atributos.resistencia = resistencia_padrao
	}
	if atributos.humor == "COLÉRICO" {
		atributos.forca = forca_padrao + 20  
		atributos.resistencia = resistencia_padrao - 20
		atributos.sagacidade = sagacidade_padrao - 20
		atributos.fortuna = fortuna_padrao - 20
	} else if atributos.humor == "APAVORADO" {
		atributos.forca = forca_padrao + 20
		atributos.resistencia = resistencia_padrao - 20
		atributos.sagacidade = sagacidade_padrao + 20
		atributos.fortuna = fortuna_padrao - 20
	} else if atributos.humor == "DEPRIMIDO" {
		atributos.forca = forca_padrao - 20
		atributos.resistencia = resistencia_padrao + 20
		atributos.sagacidade = sagacidade_padrao - 20
		atributos.fortuna = fortuna_padrao - 20 
	} else if atributos.humor == "EXTASIADO" {
		atributos.forca = forca_padrao + 20
		atributos.resistencia = resistencia_padrao + 20
		atributos.sagacidade = sagacidade_padrao - 20
		atributos.fortuna = fortuna_padrao + 20
	} 
	atributos.forca = (atributos.forca > 100) ? 100 : atributos.forca
	atributos.resistencia = (atributos.resistencia > 100) ? 100 : atributos.resistencia 
	atributos.fortuna = (atributos.fortuna > 100) ? 100 : atributos.fortuna
	atributos.sagacidade = (atributos.sagacidade > 100) ? 100 : atributos.sagacidade

	atributos.forca = (atributos.forca < 0) ? 0 : atributos.forca
	atributos.resistencia = (atributos.resistencia < 0) ? 0 : atributos.resistencia
	atributos.fortuna = (atributos.fortuna < 0) ? 0 : atributos.fortuna
	atributos.sagacidade = (atributos.sagacidade < 0) ? 0 : atributos.sagacidade
	
	mudou_humor = false
}
for (var i = 0; i < 5; i++) {
	if slot_selecionado == 1 {
		item_selecionado = slot1
	} else if slot_selecionado == 2 {
		item_selecionado = slot2
	} else if slot_selecionado == 3 {
		item_selecionado = slot3
	} else if slot_selecionado == 4 {
		item_selecionado = slot4
	} else {
		item_selecionado = slot5
	}
}

if global.tem_tela_aberta {
	image_speed = 0
} else {
	image_speed = 1
}

sprite_index = spr_roger_idle_down

if !apertou_pulo {
	depth = -y
}
if room == rm_casa and !tutorial_ask and !tutorial {
	if global.tem_tela_aberta and (obj_geladeira.desenhar or direita_coletavel) {
		tempo_decorrido += delta_time / 1000000
		tempo_escrito = tempo_espera - tempo_decorrido
	}
}

if current_time / 1000 > timer {
	timer = current_time / 1000 + 0.8
}

var _cima, _baixo, _pulo, _esquerda, _direita
	_esquerda = keyboard_check(inputs.esquerda)
	_direita = keyboard_check(inputs.direita)
	_cima = keyboard_check(inputs.cima)
	_baixo = keyboard_check(inputs.baixo)
	_pulo = keyboard_check_pressed(inputs.pulo)

if _esquerda or _direita or _cima or _baixo and !global.tem_tela_aberta {
	   if (!audio_is_playing(snd_passos_roger)) {
        audio_play_sound(snd_passos_roger, 1, true);
    }
} else {
	 audio_stop_sound(snd_passos_roger);
}

if pode_comecar and !opcoes and !global.tem_tela_aberta {

	if !global.tem_tela_aberta and keyboard_check_pressed(vk_escape) {
		global.tem_tela_aberta = true
		opcoes = true
	}
	if _esquerda {
		sprite_index = spr_roger_right
		image_xscale = -1
		image_speed = 1
	} else if _direita {
		if image_xscale == -1 {
			image_xscale = 1
		}
		sprite_index = spr_roger_right
		image_speed = 1
	} else if _baixo {
		if image_xscale == -1 {
			image_xscale = 1
		}
		sprite_index = spr_roger_down
		image_speed = 1
	} else if _cima {
		if image_xscale == -1 {
			image_xscale = 1
		}
		sprite_index = spr_roger_DEFINITIVO
	} else {
		image_speed = 1
	}

	if _pulo and !apertou_pulo {
		velv = -7
		posicao_pre_pulo = y
		apertou_pulo = true
	}

	if place_meeting(x + vel * velh, y + vel * velv, obj_porta_aux) {
		colidiu_porta_aux = true
	} else {
		colidiu_porta_aux = false
	}

	if !apertou_pulo {
		velv = _baixo - _cima
		velh = _direita - _esquerda
	
		if velh != 0 and velv != 0 {
			if place_meeting(x + velh * vel_diagonal * delta_time / 1000000, y + velv * vel_diagonal * delta_time / 1000000, obj_colidivel) {
				move_and_collide(velh * vel_diagonal * 0.6 * delta_time / 1000000, velv * vel_diagonal * 0.6 * delta_time / 1000000, obj_colidivel)
			} else {
				move_and_collide(velh * vel_diagonal * delta_time / 1000000, velv * vel_diagonal * delta_time / 1000000, obj_colidivel)
			}
		} else {
			move_and_collide(velh * vel * delta_time / 1000000, velv * vel * delta_time / 1000000, obj_colidivel)
		}

	} else {
		var _gravidade = 0.5
		velv += _gravidade
		y += velv
		if velv >= 7 {
			y = posicao_pre_pulo
			apertou_pulo = false
			velv = 0
		}
	}
	
	if desenhar and instance_exists(item_segurado) {
		if tempo == false {
			tempo2 = current_time
			tempo = true
			item_segurado.image_alpha = 0
		}
		if item_segurado.image_alpha == 1 {
			desenhar = false
			tempo = false
		} else {
			if current_time > tempo2 + 1 * delta_time / 1000000 {
				item_segurado.image_alpha += 0.05
				tempo2 = current_time
			}
		}
	} else if desenhar2 {
		if tempo == false {
			tempo2 = current_time
			tempo = true
			item_segurado.image_alpha = 0
		}
		if item_segurado.image_alpha == 1 and !segunda_vez {
			segunda_vez = true
			item_segurado.image_alpha = 0
		} else if item_segurado.image_alpha == 1 and segunda_vez {
			tempo = false
			desenhar2 = false
			segunda_vez = false
		} else if current_time > tempo2 + 1 * delta_time / 1000000 {
				item_segurado.image_alpha += 0.1
				tempo2 = current_time
		}
	}
	
	if room == rm_casa and !tutorial and !tutorial_ask {
		tempo_decorrido += delta_time / 1000000
		tempo_escrito = tempo_espera - tempo_decorrido
	}
	
} else if opcoes {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, 960 - 160, 540 - 5, 960 + 160, 540 + 5) {
		if mouse_check_button_pressed(mb_left) and !mudar_fov {
			mudar_volume = true
			clicou_volume = true
		} else  {
			mudar_volume = false
		}
	} else if !clicou_volume {
		mudar_volume = false
	}
	if clicou_volume and !mudar_fov {
		if mouse_check_button(mb_left) {
			mudar_volume = true
		} else {
			mudar_volume = false
			clicou_volume = false
		}
	}
	if mudar_volume {
		var _posicao = mx - (960 - 160)
		var _volume = _posicao / 320
		audio_master_gain(_volume)
	}
	
	if point_in_rectangle(mx, my, 960 - 160, 700 - 5, 960 + 160, 700 + 5) {
		if mouse_check_button_pressed(mb_left) and !mudar_volume {
			mudar_fov = true
			clicou_fov = true
		} else {
			mudar_fov = false
		}
	} else if !clicou_fov {
		mudar_fov = false
	}
	if clicou_fov and !mudar_volume {
		if mouse_check_button(mb_left) {
			mudar_fov = true
		} else {
			mudar_fov = false
			clicou_fov = false
		}
	}
	if mudar_fov {
		var _posicao = fov_x - (960 - 160)
		var _x = 1.5 * _posicao / 320 + 0.7
		camera_set_view_size(view_camera[0], (view_width_base / _x), (view_height_base / _x))
		camera_set_view_pos(view_camera[0], x - (view_width_base / _x) * 0.5, y - (view_height_base / _x) * 0.5)
	}
	
	if point_in_rectangle(mx, my, 960 - 65, 540 - 185, 960 + 65, 540 - 115) {
		if mouse_check_button_pressed(mb_left) {
			room_goto(rm_tela_inicial)
			ds_list_clear(global.itens_pegos)
		}
	}
	
	if keyboard_check_pressed(vk_escape) {
		opcoes = false
		global.tem_tela_aberta = false
	}
}

//passando de cena
if room == rm_casa {
	if alpha2 == 1 {
		room_goto(rm_bunker)
	}
	if tempo_espera <= tempo_decorrido {
		mudar_bunker = true
		global.tem_tela_aberta = true
	}
}

function acerto_de_contas(slot) {
	variable_struct_set(obj_personagem.qtde_itens1, object_get_name(slot), variable_struct_get(obj_personagem.qtde_itens1, object_get_name(slot)) - 1)
	switch slot_selecionado {
		case 1:
			casa(slot1, slot1_novo, slot1_n)
			slot1 = noone
			break
		case 2:
			casa(slot2, slot2_novo, slot2_n)
			slot2 = noone
			break
		case 3:
			casa(slot3, slot3_novo, slot3_n)
			slot3 = noone
			break
		case 4:
			casa(slot4, slot4_novo, slot4_n)
			slot4 = noone
			break
		case 5:
			casa(slot5, slot5_novo, slot5_n)
			slot5 = noone
			break
	}
	return noone
}

if (mouse_check_button_pressed(mb_left) and !global.tem_tela_aberta and room == rm_bunker) {
    if (point_in_rectangle(mouse_x, mouse_y, x - 30, y - 110, x + 30, y + 86)) {
		var is_alimento = false
		for (var i = 0; i < array_length(global.alimentos_consumiveis); i++) {
			if global.alimentos_consumiveis[i] == obj_personagem.item_selecionado {
				is_alimento = true
			}
		}
		
		if room == rm_bunker {
			if obj_escada.curativo_roger {
				if obj_personagem.item_selecionado == obj_curativo {
					remedio = true
					global.tem_tela_aberta = true
				}
			}
		}
		
		if doencas.Gripe[0] {
			if obj_personagem.item_selecionado == obj_aspirina {
				remedio = true
				global.tem_tela_aberta = true
			}
		}
		
		if doencas.Disenteria[0] {
			if obj_personagem.item_selecionado == obj_antibiotico {
				remedio = true
				global.tem_tela_aberta = true	
			}
		}
		
		if doencas.Enxaqueca[0] {
			if obj_personagem.item_selecionado == obj_aspirina {
				remedio = true
				global.tem_tela_aberta = true	
			}
		}
		
		if doencas.Escorbuto[0] {
			if obj_personagem.item_selecionado == obj_chucrute {
				remedio = true
				global.tem_tela_aberta = true	
			}
		}
		
		if doencas.Leptospirose[0] {
			if obj_personagem.item_selecionado == obj_antibiotico {
				remedio = true
				global.tem_tela_aberta = true	
			}
		}
		var is_agua = false
		if item_selecionado == obj_agua {
			is_agua = true
		}
		if is_alimento {
			alimento = true
			global.tem_tela_aberta = true
		}
		if is_agua {
			beber_agua = true
			global.tem_tela_aberta = true
		}
    }
}


if beber_agua and room == rm_bunker {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
		mouse_sim = true
		if mouse_check_button_pressed(mb_left) {
			if atributos.sede + valor_agua > 100 {
				aumento_sede = 100 - atributos.sede
				atributos.sede = 100
			} else {
				atributos.sede += valor_agua 
				aumento_sede = valor_agua
			}
			if slot_selecionado == 1 {
				slot1 = acerto_de_contas(slot1)
			} else if slot_selecionado == 2 {
				slot2 = acerto_de_contas(slot2)
			} else if slot_selecionado == 3 {
				slot3 = acerto_de_contas(slot3)
			} else if slot_selecionado == 4 {
				slot4 = acerto_de_contas(slot4)
			} else {
				slot5 = acerto_de_contas(slot5) 
			}
			bebeu_agua = true
			beber_agua = false
			tirar = true
			global.tem_tela_aberta = false
		}
	} else {
		mouse_sim = false
	}
	if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
		mouse_nao = true
		if mouse_check_button_pressed(mb_left) {
			beber_agua = false
			tirar = true
			global.tem_tela_aberta = false
		}
	} else {
		mouse_nao = false
	}
}

if alimento and room == rm_bunker {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
		mouse_sim = true
		if mouse_check_button_pressed(mb_left) {
			tirar = true
			atributos.fome += variable_struct_get(global.fome, object_get_name(obj_personagem.item_selecionado))
			if atributos.fome > 100 {
				aumento_fome = variable_struct_get(global.fome, object_get_name(obj_personagem.item_selecionado)) - (atributos.fome - 100)
				atributos.fome = 100
			} else {
				aumento_fome = variable_struct_get(global.fome, obj_personagem.item_selecionado)
			}
			if obj_personagem.slot_selecionado == 1 {
				obj_personagem.slot1 = acerto_de_contas(obj_personagem.slot1)
			} else if obj_personagem.slot_selecionado == 2 {
				obj_personagem.slot2 = acerto_de_contas(obj_personagem.slot2)
			} else if obj_personagem.slot_selecionado == 3 {
				obj_personagem.slot3 = acerto_de_contas(obj_personagem.slot3)
			} else if obj_personagem.slot_selecionado == 4 {
				obj_personagem.slot4 = acerto_de_contas(obj_personagem.slot4)
			} else {
				obj_personagem.slot5= acerto_de_contas(obj_personagem.slot5)
			}
			alimento = false
			alimentou = true
			global.tem_tela_aberta = false
		}
	} else {
		mouse_sim = false
	}
	if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
		mouse_nao = true
		if mouse_check_button_pressed(mb_left) {
			tirar = true
			alimento = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_nao = false
	}
}

if tutorial_ask {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
		mouse_sim = true
		if mouse_check_button_pressed(mb_left) {
			tut_saindo = true
			tutorial = true
			global.tem_tela_aberta = false
		}
	} else {
		mouse_sim = false
	}
	
	if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
		mouse_nao = true
		if mouse_check_button_pressed(mb_left) {
			tut_saindo = true
			global.tem_tela_aberta = false
		}
	} else {
		mouse_nao = false
	}
}

if remedio and room == rm_bunker {
	var mx = device_mouse_x_to_gui(0)
	var my = device_mouse_y_to_gui(0)
	if point_in_rectangle(mx, my, sim[0][0], sim[0][1], sim[1][0], sim[1][1]) {
		mouse_sim = true
		if mouse_check_button_pressed(mb_left) {
			if room == rm_bunker {
				if obj_escada.curativo_roger {
					if obj_personagem.item_selecionado == obj_curativo {
						obj_escada.curativo_roger = false
					}
				}
			}
			
			if doencas.Gripe[0] {
				if obj_personagem.item_selecionado == obj_aspirina {
					doencas.Gripe[0] = false
				}
			}
		
			if doencas.Disenteria[0] {
				if obj_personagem.item_selecionado == obj_antibiotico {
					doencas.Disenteria[0] = false
				}
			}
		
			if doencas.Enxaqueca[0] {
				if obj_personagem.item_selecionado == obj_aspirina {
					doencas.Enxaqueca[0] = false
				}
			}
		
			if doencas.Escorbuto[0] {
				if obj_personagem.item_selecionado == obj_chucrute {
					doencas.Escorbuto[0] = false
				}
			}
		
			if doencas.Leptospirose[0] {
				if obj_personagem.item_selecionado == obj_antibiotico {
					doencas.Leptospirose[0] = false
				}
			}
			tirar = true
			if obj_personagem.slot_selecionado == 1 {
				obj_personagem.slot1 = acerto_de_contas(obj_personagem.slot1)
			} else if obj_personagem.slot_selecionado == 2 {
				obj_personagem.slot2 = acerto_de_contas(obj_personagem.slot2)
			} else if obj_personagem.slot_selecionado == 3 {
				obj_personagem.slot3 = acerto_de_contas(obj_personagem.slot3)
			} else if obj_personagem.slot_selecionado == 4 {
				obj_personagem.slot4 = acerto_de_contas(obj_personagem.slot4)
			} else {
				obj_personagem.slot5= acerto_de_contas(obj_personagem.slot5)
			}
			aumento_saude = 100 - atributos.saude 
			atributos.saude = 100
			tomou_remedio = true
			remedio = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_sim = false
	}
	if point_in_rectangle(mx, my, nao[0][0], nao[0][1], nao[1][0], nao[1][1]) {
		mouse_nao = true
		if mouse_check_button_pressed(mb_left) {
			tirar = true
			remedio = false
			global.tem_tela_aberta = false
		}
	} else {
		mouse_nao = false
	}
}
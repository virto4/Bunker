/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
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

if !apertou_pulo {
	depth = -y
}
if room == rm_casa {
	if global.tem_tela_aberta and obj_geladeira.desenhar {
		tempo_decorrido += delta_time / 1000000
		tempo_escrito = tempo_espera - tempo_decorrido
	}
}

if alpha == 0 and !opcoes and !global.tem_tela_aberta {
	var _cima, _baixo, _pulo, _esquerda, _direita
	_esquerda = keyboard_check(inputs.esquerda)
	_direita = keyboard_check(inputs.direita)
	_cima = keyboard_check(inputs.cima)
	_baixo = keyboard_check(inputs.baixo)
	_pulo = keyboard_check_pressed(inputs.pulo)

	if !global.tem_tela_aberta and keyboard_check_pressed(vk_escape) {
		global.tem_tela_aberta = true
		opcoes = true
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
	
	if desenhar {
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
	
	if room == rm_casa {
		tempo_decorrido += delta_time / 1000000
		tempo_escrito = tempo_espera - tempo_decorrido
	}
	
} else if opcoes {
	if display_mouse_get_x() > display_get_width() / 2 - 128 and display_mouse_get_x() < display_get_width() / 2 + 128 and display_mouse_get_y() > display_get_height() / 2 - 5 and display_mouse_get_y() < display_get_height() / 2 + 5 {
		if mouse_check_button_pressed(mb_left) and !mudar_fov{
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
		var _posicao = 960 - 128 - display_mouse_get_x() * 1920 / 1366
		var _volume = _posicao / 256
		audio_master_gain(_volume)
	}
	
	if display_mouse_get_x() > display_get_width() / 2 - 128 and display_mouse_get_x() < display_get_width() / 2 + 128 and display_mouse_get_y() > 700 * 768 / 1080 - 5 and display_mouse_get_y() < 700 * 768 / 1080 + 5 {
		if mouse_check_button_pressed(mb_left) and !mudar_volume {
			mudar_fov = true
			clicou_fov = true
		} else {
			mudar_fov = false
		}
	} else if !clicou_fov {
		mudar_fov = false
	}
	if clicou_fov and !mudar_volume{
		if mouse_check_button(mb_left) {
			mudar_fov = true
		} else {
			mudar_fov = false
			clicou_fov = false
		}
	}
	if mudar_fov {
		var _posicao = fov_x - (960 - 128)
		var _x = 1.5 * _posicao / 256 + 0.7
		camera_set_view_size(view_camera[0], (view_width_base / _x), (view_height_base / _x))
		camera_set_view_pos(view_camera[0], x - (view_width_base / _x) * 0.5, y - (view_height_base / _x) * 0.5)
	}
	
	if display_mouse_get_x() > (display_get_width() / 2 - 65 * 1366 / 1920) and display_mouse_get_x() < (display_get_width() / 2 + 65 * 1366 / 1920) and display_mouse_get_y() > (display_get_height() / 2 - 185 * 768 / 1080) and display_mouse_get_y() < (display_get_height() / 2 - 115 * 768 / 1080) {
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
	} else if room == rm_bunker and alpha2 == 0 {
		mudar_bunker = false
	}
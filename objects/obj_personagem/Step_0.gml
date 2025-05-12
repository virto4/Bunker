/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !apertou_pulo {
	depth = -y
}

if alpha == 0 and !opcoes {
	var _cima, _baixo, _pulo, _esquerda, _direita
	_esquerda = keyboard_check(inputs.esquerda)
	_direita = keyboard_check(inputs.direita)
	_cima = keyboard_check(inputs.cima)
	_baixo = keyboard_check(inputs.baixo)
	_pulo = keyboard_check_pressed(inputs.pulo)

	if keyboard_check_pressed(vk_escape) {
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
	
	//passando de cena
	if room_get_name(room) == "rm_casa" {
		tempo_decorrido += delta_time / 1000000
		tempo_escrito = tempo_espera - tempo_decorrido
		if tempo_espera <= tempo_decorrido {
			room_goto(rm_bunker)
		}
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
		}
	}
	
	if keyboard_check_pressed(vk_escape) {
		opcoes = false
	}
}
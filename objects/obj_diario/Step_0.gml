/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if keyboard_check_pressed(vk_escape) {
	if clicou {
		clicou = false
		global.tem_tela_aberta = false
		obj_personagem.opcoes = false
	}
}

if clicou {
	if image_index <= image_number - 1 {
		image_speed = 1
	} else {
		image_speed = 0
		image_index = image_number - 1
	}
} else {
	if image_index >= 1 {
		image_speed = -1
	} else {
		image_speed = 0
		image_index = 0
	}
}

draw_set_font(fnt_alagard)
// draw_gui event
var width_voltar = sprite_get_width(spr_voltar_diario) / 2
var height_voltar = sprite_get_height(spr_voltar_diario) / 2
var tx_voltar = 200
var ty_voltar = 1080 - 50

var width_primeira = sprite_get_width(spr_primeira_diario) / 2
var height_primeira = sprite_get_height(spr_primeira_diario) / 2
var tx_primeira = 1920 / 2 - 300
var ty_primeira = 1080 - 50

var width_avancar = sprite_get_width(spr_avancar_diario) / 2
var height_avancar = sprite_get_height(spr_avancar_diario) / 2
var tx_avancar = 1920 - 200
var ty_avancar = 1080 - 50

var width_sair = sprite_get_width(spr_voltar) / 2
var height_sair = sprite_get_height(spr_voltar) / 2 
var tx_sair = 1800
var ty_sair = 50

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mouse_check_button_pressed(mb_left)) {
    if (mx > tx_voltar - width_voltar && mx < tx_voltar + width_voltar &&
		my > ty_voltar - height_voltar && my < ty_voltar + height_voltar) and pagina > 0 {
        pagina--
		audio_play_sound(snd_paginas, 1, false)
    } else if (mx > tx_avancar - width_avancar && mx < tx_avancar + width_avancar &&
		my > ty_avancar - height_avancar && my < ty_avancar + height_avancar) and pagina < paginas.numero{
		pagina++
		audio_play_sound(snd_paginas, 1, false)
	} else if (mx > tx_primeira - width_primeira && mx < tx_primeira + width_primeira &&
		my > ty_primeira - height_primeira && my < ty_primeira + height_primeira) and pagina > 0 {
		pagina = 0
		audio_play_sound(snd_paginas, 1, false)
	}
}

if mouse_check_button_pressed(mb_left) {
	if mx > tx_sair - width_sair && mx < tx_sair + width_sair && my > ty_sair - height_sair && my < ty_sair + height_sair {
		clicou = false
		global.tem_tela_aberta = false
	}
}

switch dia {
	case 1:
		ds_list_replace(obj_diario.paginas_escritas, 0, obj_diario.paginas.atributos)
		ds_list_replace(obj_diario.paginas_escritas, 1, obj_diario.paginas.atributos2)
		ds_list_replace(paginas_escritas, dia + 1, "Nada de mais hoje.")
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia1
		break
	case 3:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia3
		break
	case 6:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia6
		break
	case 8:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia8
		break
	case 10:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia10
		break
	case 13:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia13
		break
	case 15:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia15
		break
	case 18:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia18
		break
	case 21:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia21
		break
	case 23:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia23
		break
	case 26:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia26
		break
	case 28:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia28
		break
	case 30:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia30
		break
	case 33:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia33
		break
	case 36:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia36
		break
	case 38:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia38
		break
	case 41:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia41
		break
	case 43:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia43
		break
	case 45:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia45
		break
	case 48:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia48
		break
	case 50:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia50
		break
	case 53:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia53
		break
	case 56:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia56
		break
	case 58:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia58
		break
	case 62:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia62
		break
	case 66:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia66
		break
	case 70:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia70
		break
	case 73:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia73
		break
	case 76:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia76
		break
	case 77:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia77
		break
	case 79:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia79
		break
	case 82:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia82
		break
	case 84:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia84
		break
	case 86:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia86
		break
	case 88:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia88
		break
	case 92:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia92
		break
	case 94:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia94
		break
	case 96:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia96
		break
	default:
		obj_controlador_evento.evento_hoje = 0
		ds_list_replace(paginas_escritas, dia + 1, "Nada de mais hoje.")
}
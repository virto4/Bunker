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
		break
	case 2:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia2
		break
	case 3:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia3
		break
	case 4:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia4
		break
	case 6:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia6
		break
	case 7:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia7
		break
	case 9:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia9
		break
	case 10:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia10
		break
	case 11:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia11
		break
	case 13:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia13
		break
	case 14:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia14
		break
	case 15:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia15
		break
	case 16:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia16
		break
	case 18:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia18
		break
	case 19:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia19
		break
	case 21:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia21
		break
	case 22:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia22
		break
	case 24:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia24
		break
	case 25:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia25
		break
	case 26:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia26
		break
	case 28:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia28
		break
	case 29:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia29
		break
	case 30:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia30
		break
	case 33:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia33
		break
	case 34:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.meio_data.dia34
		break
	case 36:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia36
		break
	case 37:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia37
		break
	case 38:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia38
		break
	case 39:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia39
		break
	case 40:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia40
		break
	case 41:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia41
		break
	case 43:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia43
		break
	case 44:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia44
		break
	case 45:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia45
		break
	case 46:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia46
		break
	case 48:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia48
		break
	case 49:
		obj_controlador_evento.evento_hoje = obj_controlador_evento.fim_data.dia49
		break
	default:
		obj_controlador_evento.evento_hoje = 0
		ds_list_replace(paginas_escritas, dia + 1, "Nada de mais hoje.")
}
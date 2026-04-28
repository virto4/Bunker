/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
depth = -y
if esc {
	clicou = false
	global.tem_tela_aberta = false
	esc = false
}
if keyboard_check_pressed(vk_escape) {
	if clicou {
		esc = true
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
	} else if point_in_rectangle(mx, my, 1920 / 2 + 300 - width_avancar, 1080 - 50 - height_avancar, 1920 / 2 + 300 + width_avancar, 1080 - 50 + height_avancar) {
		var pos = 0
		for (var i = 0; i < ds_list_size(paginas_escritas); i++) {
			if ds_list_find_value(paginas_escritas, i) == "" {
				pos = i
				break
			}
		}
		if pos % 2 == 0 {
			pagina = (pos - 2) / 2
		} else {
			pagina = (pos - 1) / 2
		}
		audio_play_sound(snd_paginas, 1, false)
	}
}

if mouse_check_button_pressed(mb_left) {
	if mx > tx_sair - width_sair && mx < tx_sair + width_sair && my > ty_sair - height_sair && my < ty_sair + height_sair {
		clicou = false
		global.tem_tela_aberta = false
	}
}
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
    } else if (mx > tx_avancar - width_avancar && mx < tx_avancar + width_avancar &&
		my > ty_avancar - height_avancar && my < ty_avancar + height_avancar) and pagina < paginas.numero{
		pagina++
	} else if (mx > tx_primeira - width_primeira && mx < tx_primeira + width_primeira &&
		my > ty_primeira - height_primeira && my < ty_primeira + height_primeira) and pagina > 0 {
		pagina = 0
	}
}

if mouse_check_button_pressed(mb_left) {
	if mx > tx_sair - width_sair && mx < tx_sair + width_sair &&
	my > ty_sair - height_sair && my < ty_sair + height_sair {
		clicou = false
		global.tem_tela_aberta = false
	}
}

switch dia {
	case 1:
		ds_list_replace(paginas_escritas, 0, paginas.atributos)
		ds_list_replace(paginas_escritas, 1, paginas.atributos2)
		ds_list_replace(paginas_escritas, 2, paginas.dia1)
		obj_controlador_evento.evento_hoje = obj_controlador_evento.inicio_data.dia1
		break
	case 2:
		ds_list_replace(paginas_escritas, 3, paginas.dia2)
		break
	case 3:
		ds_list_replace(paginas_escritas, 4, paginas.dia3)
		break
	case 4:
		ds_list_replace(paginas_escritas, 5, paginas.dia4)
		break
	case 5:
		ds_list_replace(paginas_escritas, 6, paginas.dia5)
		break
	case 6:
		ds_list_replace(paginas_escritas, 7, paginas.dia6)
		break
	case 7:
		ds_list_replace(paginas_escritas, 8, paginas.dia7)
		break
	case 8:
		ds_list_replace(paginas_escritas, 9, paginas.dia8)
		break
	case 9:
		ds_list_replace(paginas_escritas, 10, paginas.dia9)
		break
	case 10:
		ds_list_replace(paginas_escritas, 11, paginas.dia10)
		break
	case 11:
		ds_list_replace(paginas_escritas, 12, paginas.dia11)
		break
	case 12:
		ds_list_replace(paginas_escritas, 13, paginas.dia12)
		break
}